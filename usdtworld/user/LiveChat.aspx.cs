using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using BusinessLogicTier;

public partial class LiveChatPage : Page
{
    const int MaxAttachmentBytes = 2 * 1024 * 1024;
    static readonly string[] AllowedExtensions = { ".jpg", ".jpeg", ".png", ".gif", ".bmp", ".webp", ".pdf", ".doc", ".docx", ".txt" };

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["userid"] == null)
            {
                Response.Redirect("index.aspx");
                return;
            }

            hdnCurrentUserId.Value = Session["userid"].ToString();
            hdnCurrentUserName.Value = Session["username"] != null ? Session["username"].ToString() : Session["userid"].ToString();

            clsLiveChat chat = new clsLiveChat();
            chat.EnsureTable();
        }
    }

    public static string BuildAttachmentUrl(string savedFileName)
    {
        if (string.IsNullOrWhiteSpace(savedFileName)) return "";
        return "../ProductImage/" + savedFileName;
    }

    public static string GetAttachmentType(string savedFileName)
    {
        string ext = Path.GetExtension(savedFileName ?? "").ToLowerInvariant();
        if (ext == ".pdf") return "pdf";
        if (ext == ".doc" || ext == ".docx") return "doc";
        if (ext == ".txt") return "txt";
        if (ext == ".jpg" || ext == ".jpeg" || ext == ".png" || ext == ".gif" || ext == ".bmp" || ext == ".webp") return "image";
        return "file";
    }

    public static bool IsImageAttachment(string savedFileName)
    {
        return GetAttachmentType(savedFileName) == "image";
    }

    static ChatMessageDto MapMessage(DataRow row, string currentUserId)
    {
        string attachment = GetString(row, "Attachment");
        return new ChatMessageDto
        {
            id = GetLong(row, "Id"),
            fromUserId = GetString(row, "FromUserId"),
            toUserId = GetString(row, "ToUserId"),
            messageText = GetString(row, "MessageText"),
            sentDate = FormatDate(row["SentDate"]),
            isMine = string.Equals(GetString(row, "FromUserId"), currentUserId, StringComparison.OrdinalIgnoreCase),
            senderName = GetString(row, "SenderName"),
            attachment = attachment,
            attachmentUrl = BuildAttachmentUrl(attachment),
            attachmentName = string.IsNullOrWhiteSpace(attachment) ? "" : Path.GetFileName(attachment),
            attachmentType = GetAttachmentType(attachment),
            isImage = IsImageAttachment(attachment)
        };
    }

    static string CurrentUserId()
    {
        var session = HttpContext.Current.Session;
        if (session == null || session["userid"] == null) return null;
        return session["userid"].ToString();
    }

    static ChatApiResponse RequireSession()
    {
        if (string.IsNullOrEmpty(CurrentUserId()))
            return ChatApiResponse.Fail("Session expired. Please login again.");
        return null;
    }

    [WebMethod(EnableSession = true)]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static ChatSearchResponse SearchByMobile(string mobile)
    {
        try
        {
            var auth = RequireSession();
            if (auth != null) return ChatSearchResponse.FromFail(auth.message);

            if (string.IsNullOrWhiteSpace(mobile))
                return ChatSearchResponse.NotFound("Enter a mobile number to search.");

            clsLiveChat chat = new clsLiveChat();
            DataTable dt = chat.SearchUserByMobile(mobile, CurrentUserId());
            if (dt == null || dt.Rows.Count == 0)
                return ChatSearchResponse.NotFound("No data found for this mobile number.");

            DataRow row = dt.Rows[0];
            bool isActive = GetBool(row, "IsActive") || string.Equals(GetString(row, "Status"), "Active", StringComparison.OrdinalIgnoreCase);
            var user = new ChatUserDto
            {
                userId = GetString(row, "UserId"),
                userName = GetString(row, "UserName"),
                mobile = GetString(row, "Mobile"),
                status = GetString(row, "Status"),
                isActive = isActive
            };

            if (!isActive)
                return ChatSearchResponse.Inactive(user);

            return ChatSearchResponse.Found(user);
        }
        catch (Exception ex)
        {
            return ChatSearchResponse.FromFail("Search failed: " + ex.Message);
        }
    }

    [WebMethod(EnableSession = true)]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static ChatListResponse GetConversations()
    {
        try
        {
            var auth = RequireSession();
            if (auth != null) return ChatListResponse.Fail(auth.message);

            clsLiveChat chat = new clsLiveChat();
            DataTable dt = chat.GetConversations(CurrentUserId());
            var items = new List<ChatConversationDto>();
            if (dt != null)
            {
                foreach (DataRow row in dt.Rows)
                {
                    items.Add(new ChatConversationDto
                    {
                        peerId = GetString(row, "PeerId"),
                        userName = GetString(row, "UserName"),
                        mobile = GetString(row, "Mobile"),
                        status = GetString(row, "Status"),
                        lastMessage = GetString(row, "LastMessage"),
                        lastDate = FormatDate(row["LastDate"]),
                        unreadCount = GetInt(row, "UnreadCount")
                    });
                }
            }
            return ChatListResponse.Ok(items);
        }
        catch (Exception ex)
        {
            return ChatListResponse.Fail("Unable to load conversations: " + ex.Message);
        }
    }

    [WebMethod(EnableSession = true)]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static ChatNotificationResponse GetChatNotifications()
    {
        try
        {
            var auth = RequireSession();
            if (auth != null) return ChatNotificationResponse.Fail(auth.message);

            clsLiveChat chat = new clsLiveChat();
            DataTable dt = chat.GetUnreadNotifications(CurrentUserId());
            if (dt == null || dt.Rows.Count == 0)
                return ChatNotificationResponse.Ok(0, 0, "", "", "", "");

            DataRow row = dt.Rows[0];
            return ChatNotificationResponse.Ok(
                GetInt(row, "TotalUnread"),
                GetLong(row, "LatestUnreadId"),
                GetString(row, "LatestPeerId"),
                GetString(row, "LatestSenderName"),
                GetString(row, "LatestPreview"),
                FormatDate(row["LatestSentDate"]));
        }
        catch (Exception ex)
        {
            return ChatNotificationResponse.Fail("Unable to load notifications: " + ex.Message);
        }
    }

    [WebMethod(EnableSession = true)]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static ChatMessagesResponse GetMessages(string peerUserId, long afterId)
    {
        try
        {
            var auth = RequireSession();
            if (auth != null) return ChatMessagesResponse.Fail(auth.message);

            if (string.IsNullOrWhiteSpace(peerUserId))
                return ChatMessagesResponse.Fail("Select a member to chat.");

            clsLiveChat chat = new clsLiveChat();
            DataTable peerDt = chat.GetPeerInfo(peerUserId.Trim());
            if (peerDt == null || peerDt.Rows.Count == 0)
                return ChatMessagesResponse.Fail("Member not found.");

            DataRow peer = peerDt.Rows[0];
            bool isActive = GetBool(peer, "IsActive") || string.Equals(GetString(peer, "Status"), "Active", StringComparison.OrdinalIgnoreCase);

            chat.MarkAsRead(CurrentUserId(), peerUserId.Trim());
            DataTable dt = chat.GetMessages(CurrentUserId(), peerUserId.Trim(), afterId);
            var messages = new List<ChatMessageDto>();
            if (dt != null)
            {
                foreach (DataRow row in dt.Rows)
                {
                    messages.Add(MapMessage(row, CurrentUserId()));
                }
            }

            var peerInfo = new ChatUserDto
            {
                userId = GetString(peer, "UserId"),
                userName = GetString(peer, "UserName"),
                mobile = GetString(peer, "Mobile"),
                status = GetString(peer, "Status"),
                isActive = isActive
            };

            return ChatMessagesResponse.Ok(messages, peerInfo);
        }
        catch (Exception ex)
        {
            return ChatMessagesResponse.Fail("Unable to load messages: " + ex.Message);
        }
    }

    [WebMethod(EnableSession = true)]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static ChatSendResponse SendMessage(string peerUserId, string messageText)
    {
        try
        {
            var auth = RequireSession();
            if (auth != null) return ChatSendResponse.Fail(auth.message);

            if (string.IsNullOrWhiteSpace(peerUserId))
                return ChatSendResponse.Fail("Select a member to chat.");

            string text = (messageText ?? "").Trim();
            if (text.Length == 0)
                return ChatSendResponse.Fail("Type a message to send.");
            if (text.Length > 2000)
                return ChatSendResponse.Fail("Message is too long (max 2000 characters).");

            clsLiveChat chat = new clsLiveChat();
            DataTable peerDt = chat.GetPeerInfo(peerUserId.Trim());
            if (peerDt == null || peerDt.Rows.Count == 0)
                return ChatSendResponse.Fail("Member not found.");

            DataRow peer = peerDt.Rows[0];
            bool isActive = GetBool(peer, "IsActive") || string.Equals(GetString(peer, "Status"), "Active", StringComparison.OrdinalIgnoreCase);
            if (!isActive)
                return ChatSendResponse.Inactive();

            int newId = chat.SendMessage(CurrentUserId(), peerUserId.Trim(), text);
            if (newId <= 0)
                return ChatSendResponse.Fail("Message could not be sent. Please try again.");

            return ChatSendResponse.Ok(newId, DateTime.Now.ToString("dd/MM/yyyy hh:mm tt", CultureInfo.InvariantCulture));
        }
        catch (Exception ex)
        {
            return ChatSendResponse.Fail("Send failed: " + ex.Message);
        }
    }

    [WebMethod(EnableSession = true)]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static ChatSendResponse SendMessageWithAttachment(string peerUserId, string messageText, string fileName, string fileData)
    {
        try
        {
            var auth = RequireSession();
            if (auth != null) return ChatSendResponse.Fail(auth.message);

            if (string.IsNullOrWhiteSpace(peerUserId))
                return ChatSendResponse.Fail("Select a member to chat.");

            string text = (messageText ?? "").Trim();
            if (text.Length > 2000)
                return ChatSendResponse.Fail("Message is too long (max 2000 characters).");

            if (string.IsNullOrWhiteSpace(fileData))
                return ChatSendResponse.Fail("Choose a file to send.");

            string safeName = Path.GetFileName(fileName ?? "").Trim();
            if (string.IsNullOrWhiteSpace(safeName))
                return ChatSendResponse.Fail("Invalid file name.");

            string ext = Path.GetExtension(safeName).ToLowerInvariant();
            if (!AllowedExtensions.Contains(ext))
                return ChatSendResponse.Fail("Invalid file type. Allowed: images, PDF, DOC, DOCX, TXT (max 2 MB).");

            string base64 = fileData.Trim();
            int comma = base64.IndexOf(',');
            if (comma >= 0)
                base64 = base64.Substring(comma + 1);

            byte[] bytes;
            try
            {
                bytes = Convert.FromBase64String(base64);
            }
            catch
            {
                return ChatSendResponse.Fail("Invalid file data.");
            }

            if (bytes.Length == 0)
                return ChatSendResponse.Fail("Choose a file to send.");
            if (bytes.Length > MaxAttachmentBytes)
                return ChatSendResponse.Fail("File size must be 2 MB or less.");

            string savedFile = SaveAttachmentBytes(safeName, bytes);
            if (string.IsNullOrWhiteSpace(savedFile))
                return ChatSendResponse.Fail("Unable to save attachment.");

            clsLiveChat chat = new clsLiveChat();
            DataTable peerDt = chat.GetPeerInfo(peerUserId.Trim());
            if (peerDt == null || peerDt.Rows.Count == 0)
            {
                TryDeleteAttachment(savedFile);
                return ChatSendResponse.Fail("Member not found.");
            }

            DataRow peer = peerDt.Rows[0];
            bool isActive = GetBool(peer, "IsActive") || string.Equals(GetString(peer, "Status"), "Active", StringComparison.OrdinalIgnoreCase);
            if (!isActive)
            {
                TryDeleteAttachment(savedFile);
                return ChatSendResponse.Inactive();
            }

            int newId = chat.SendMessage(CurrentUserId(), peerUserId.Trim(), text, savedFile);
            if (newId <= 0)
            {
                TryDeleteAttachment(savedFile);
                return ChatSendResponse.Fail("Attachment could not be sent. Please try again.");
            }

            return ChatSendResponse.Ok(newId, DateTime.Now.ToString("dd/MM/yyyy hh:mm tt", CultureInfo.InvariantCulture), savedFile, safeName);
        }
        catch (Exception ex)
        {
            return ChatSendResponse.Fail("Upload failed: " + ex.Message);
        }
    }

    static string SaveAttachmentBytes(string originalFileName, byte[] bytes)
    {
        string savedFileName = DateTime.Now.Ticks + "_" + SanitizeFileName(originalFileName);
        string folder = HttpContext.Current.Server.MapPath("~/ProductImage/");
        if (!Directory.Exists(folder))
            Directory.CreateDirectory(folder);

        File.WriteAllBytes(Path.Combine(folder, savedFileName), bytes);
        return savedFileName;
    }

    static string SanitizeFileName(string name)
    {
        foreach (char c in Path.GetInvalidFileNameChars())
            name = name.Replace(c, '_');
        return name;
    }

    static void TryDeleteAttachment(string savedFileName)
    {
        if (string.IsNullOrWhiteSpace(savedFileName)) return;
        try
        {
            string path = HttpContext.Current.Server.MapPath("~/ProductImage/" + savedFileName);
            if (File.Exists(path)) File.Delete(path);
        }
        catch { /* ignore */ }
    }

    static string GetString(DataRow row, string col)
    {
        if (row == null || !row.Table.Columns.Contains(col) || row[col] == DBNull.Value) return "";
        return row[col].ToString();
    }

    static int GetInt(DataRow row, string col)
    {
        int val;
        if (int.TryParse(GetString(row, col), out val)) return val;
        return 0;
    }

    static long GetLong(DataRow row, string col)
    {
        long val;
        if (long.TryParse(GetString(row, col), out val)) return val;
        return 0;
    }

    static bool GetBool(DataRow row, string col)
    {
        string s = GetString(row, col);
        return s == "1" || s.Equals("true", StringComparison.OrdinalIgnoreCase);
    }

    static string FormatDate(object value)
    {
        if (value == null || value == DBNull.Value) return "";
        DateTime dt;
        if (DateTime.TryParse(value.ToString(), out dt))
            return dt.ToString("dd/MM/yyyy hh:mm tt", CultureInfo.InvariantCulture);
        return value.ToString();
    }
}

public class ChatApiResponse
{
    public bool success { get; set; }
    public string message { get; set; }

    public static ChatApiResponse Fail(string msg)
    {
        return new ChatApiResponse { success = false, message = msg };
    }
}

public class ChatUserDto
{
    public string userId { get; set; }
    public string userName { get; set; }
    public string mobile { get; set; }
    public string status { get; set; }
    public bool isActive { get; set; }
}

public class ChatSearchResponse
{
    public bool success { get; set; }
    public string message { get; set; }
    public string resultType { get; set; }
    public ChatUserDto user { get; set; }

    public static ChatSearchResponse Found(ChatUserDto user)
    {
        return new ChatSearchResponse { success = true, resultType = "found", user = user, message = "Member found." };
    }

    public static ChatSearchResponse Inactive(ChatUserDto user)
    {
        return new ChatSearchResponse { success = false, resultType = "inactive", user = user, message = "This member is not active. Chat is unavailable." };
    }

    public static ChatSearchResponse NotFound(string msg)
    {
        return new ChatSearchResponse { success = false, resultType = "not_found", message = msg };
    }

    public static ChatSearchResponse FromFail(string msg)
    {
        return new ChatSearchResponse { success = false, resultType = "error", message = msg };
    }
}

public class ChatConversationDto
{
    public string peerId { get; set; }
    public string userName { get; set; }
    public string mobile { get; set; }
    public string status { get; set; }
    public string lastMessage { get; set; }
    public string lastDate { get; set; }
    public int unreadCount { get; set; }
}

public class ChatListResponse
{
    public bool success { get; set; }
    public string message { get; set; }
    public List<ChatConversationDto> conversations { get; set; }

    public static ChatListResponse Ok(List<ChatConversationDto> items)
    {
        return new ChatListResponse { success = true, conversations = items ?? new List<ChatConversationDto>() };
    }

    public static ChatListResponse Fail(string msg)
    {
        return new ChatListResponse { success = false, message = msg, conversations = new List<ChatConversationDto>() };
    }
}

public class ChatMessageDto
{
    public long id { get; set; }
    public string fromUserId { get; set; }
    public string toUserId { get; set; }
    public string messageText { get; set; }
    public string sentDate { get; set; }
    public bool isMine { get; set; }
    public string senderName { get; set; }
    public string attachment { get; set; }
    public string attachmentUrl { get; set; }
    public string attachmentName { get; set; }
    public string attachmentType { get; set; }
    public bool isImage { get; set; }
}

public class ChatMessagesResponse
{
    public bool success { get; set; }
    public string message { get; set; }
    public string resultType { get; set; }
    public List<ChatMessageDto> messages { get; set; }
    public ChatUserDto peer { get; set; }

    public static ChatMessagesResponse Ok(List<ChatMessageDto> messages, ChatUserDto peer)
    {
        return new ChatMessagesResponse { success = true, resultType = "ok", messages = messages ?? new List<ChatMessageDto>(), peer = peer };
    }

    public static ChatMessagesResponse Inactive(string peerId)
    {
        return new ChatMessagesResponse { success = false, resultType = "inactive", message = "This member is not active." };
    }

    public static ChatMessagesResponse Fail(string msg)
    {
        return new ChatMessagesResponse { success = false, resultType = "error", message = msg, messages = new List<ChatMessageDto>() };
    }
}

public class ChatSendResponse
{
    public bool success { get; set; }
    public string message { get; set; }
    public string resultType { get; set; }
    public long messageId { get; set; }
    public string sentDate { get; set; }
    public string attachment { get; set; }
    public string attachmentUrl { get; set; }
    public string attachmentName { get; set; }
    public string attachmentType { get; set; }
    public bool isImage { get; set; }

    public static ChatSendResponse Ok(int id, string sentDate)
    {
        return new ChatSendResponse { success = true, messageId = id, sentDate = sentDate, message = "Sent." };
    }

    public static ChatSendResponse Ok(int id, string sentDate, string savedFileName, string originalFileName)
    {
        return new ChatSendResponse
        {
            success = true,
            messageId = id,
            sentDate = sentDate,
            message = "Sent.",
            attachment = savedFileName,
            attachmentUrl = LiveChatPage.BuildAttachmentUrl(savedFileName),
            attachmentName = string.IsNullOrWhiteSpace(originalFileName) ? savedFileName : originalFileName,
            attachmentType = LiveChatPage.GetAttachmentType(savedFileName),
            isImage = LiveChatPage.IsImageAttachment(savedFileName)
        };
    }

    public static ChatSendResponse Inactive()
    {
        return new ChatSendResponse { success = false, resultType = "inactive", message = "This member is not active." };
    }

    public static ChatSendResponse Fail(string msg)
    {
        return new ChatSendResponse { success = false, message = msg };
    }
}

public class ChatNotificationResponse
{
    public bool success { get; set; }
    public string message { get; set; }
    public int totalUnread { get; set; }
    public long latestUnreadId { get; set; }
    public string latestPeerId { get; set; }
    public string latestSenderName { get; set; }
    public string latestPreview { get; set; }
    public string latestSentDate { get; set; }

    public static ChatNotificationResponse Ok(int totalUnread, long latestUnreadId, string peerId, string senderName, string preview, string sentDate)
    {
        return new ChatNotificationResponse
        {
            success = true,
            totalUnread = totalUnread,
            latestUnreadId = latestUnreadId,
            latestPeerId = peerId ?? "",
            latestSenderName = senderName ?? "",
            latestPreview = preview ?? "",
            latestSentDate = sentDate ?? ""
        };
    }

    public static ChatNotificationResponse Fail(string msg)
    {
        return new ChatNotificationResponse { success = false, message = msg, totalUnread = 0 };
    }
}
