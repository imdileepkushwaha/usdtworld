using System;
using System.Data;
using System.Data.SqlClient;
using DataTier;

namespace BusinessLogicTier
{
    public class clsLiveChat
    {
        Data ObjData = new Data();

        static string Esc(string value)
        {
            return (value ?? "").Replace("'", "''").Trim();
        }

        static string NormalizeMobile(string mobile)
        {
            if (string.IsNullOrWhiteSpace(mobile)) return "";
            return mobile.Replace(" ", "").Replace("-", "").Replace("+", "").Trim();
        }

        public void EnsureTable()
        {
            string sql = @"
IF NOT EXISTS (SELECT 1 FROM sys.tables WHERE name = 'LiveChatDetail')
BEGIN
    CREATE TABLE LiveChatDetail (
        Id INT NOT NULL PRIMARY KEY,
        FromUserId NVARCHAR(50) NOT NULL,
        ToUserId NVARCHAR(50) NOT NULL,
        MessageText NVARCHAR(MAX) NOT NULL,
        SentDate DATETIME NOT NULL DEFAULT GETDATE(),
        IsRead BIT NOT NULL DEFAULT 0,
        Attachment NVARCHAR(260) NULL
    );
    CREATE INDEX IX_LiveChatDetail_FromTo ON LiveChatDetail(FromUserId, ToUserId, SentDate);
    CREATE INDEX IX_LiveChatDetail_ToFrom ON LiveChatDetail(ToUserId, FromUserId, SentDate);
END
IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'LiveChatDetail')
   AND NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_id = OBJECT_ID('LiveChatDetail') AND name = 'Attachment')
BEGIN
    ALTER TABLE LiveChatDetail ADD Attachment NVARCHAR(260) NULL;
END";
            ObjData.StartConnection();
            try
            {
                ObjData.RunInsUpDelQuery(sql);
            }
            finally
            {
                ObjData.EndConnection();
            }
        }

        public DataTable SearchUserByMobile(string mobile, string currentUserId)
        {
            return SearchMember(mobile, currentUserId);
        }

        public DataTable SearchMember(string query, string currentUserId)
        {
            EnsureTable();
            string term = Esc((query ?? "").Trim());
            string normalized = Esc(NormalizeMobile(query));
            if (string.IsNullOrEmpty(term)) return null;

            string matchSql = "LTRIM(RTRIM(ud.UserId)) = '" + term + "'";
            if (!string.IsNullOrEmpty(normalized))
                matchSql += " OR REPLACE(REPLACE(REPLACE(ISNULL(ud.Mobile, ''), ' ', ''), '-', ''), '+', '') = '" + normalized + "'";

            string sql = @"SELECT TOP 1 ud.UserId, ud.UserName, ud.Mobile,
                CASE WHEN ISNULL(ud.Status, 0) = 1 THEN 'Active' ELSE 'Deactive' END AS Status,
                CASE WHEN ISNULL(ud.Status, 0) = 1 THEN 1 ELSE 0 END AS IsActive
                FROM UserDetail ud
                WHERE ud.UserId <> '" + Esc(currentUserId) + @"'
                AND (" + matchSql + @")";

            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(sql);
            }
            catch
            {
                dt = null;
            }
            finally
            {
                ObjData.EndConnection();
            }
            return dt;
        }

        public DataTable GetConversations(string userId)
        {
            EnsureTable();
            string uid = Esc(userId);
            string sql = @";WITH threads AS (
                SELECT
                    CASE WHEN FromUserId = '" + uid + @"' THEN ToUserId ELSE FromUserId END AS PeerId,
                    MAX(SentDate) AS LastDate
                FROM LiveChatDetail
                WHERE FromUserId = '" + uid + @"' OR ToUserId = '" + uid + @"'
                GROUP BY CASE WHEN FromUserId = '" + uid + @"' THEN ToUserId ELSE FromUserId END
            )
            SELECT
                t.PeerId,
                ud.UserName,
                ud.Mobile,
                CASE WHEN ISNULL(ud.Status, 0) = 1 THEN 'Active' ELSE 'Deactive' END AS Status,
                t.LastDate,
                (
                    SELECT TOP 1
                        CASE
                            WHEN ISNULL(lcd.Attachment, '') <> '' AND LTRIM(RTRIM(ISNULL(lcd.MessageText, ''))) = '' THEN 'Attachment'
                            ELSE lcd.MessageText
                        END
                    FROM LiveChatDetail lcd
                    WHERE (lcd.FromUserId = '" + uid + @"' AND lcd.ToUserId = t.PeerId)
                       OR (lcd.FromUserId = t.PeerId AND lcd.ToUserId = '" + uid + @"')
                    ORDER BY lcd.SentDate DESC
                ) AS LastMessage,
                (
                    SELECT COUNT(*)
                    FROM LiveChatDetail lcd
                    WHERE lcd.FromUserId = t.PeerId
                      AND lcd.ToUserId = '" + uid + @"'
                      AND ISNULL(lcd.IsRead, 0) = 0
                ) AS UnreadCount
            FROM threads t
            INNER JOIN UserDetail ud ON ud.UserId = t.PeerId
            ORDER BY t.LastDate DESC";

            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(sql);
            }
            catch
            {
                dt = null;
            }
            finally
            {
                ObjData.EndConnection();
            }
            return dt;
        }

        public DataTable GetMessages(string userId, string peerUserId, long afterId)
        {
            EnsureTable();
            string uid = Esc(userId);
            string peer = Esc(peerUserId);
            string afterFilter = afterId > 0 ? " AND lcd.Id > " + afterId : "";

            string sql = @"SELECT lcd.Id, lcd.FromUserId, lcd.ToUserId, lcd.MessageText, lcd.SentDate, lcd.IsRead,
                ISNULL(lcd.Attachment, '') AS Attachment,
                ud.UserName AS SenderName
                FROM LiveChatDetail lcd
                LEFT JOIN UserDetail ud ON ud.UserId = lcd.FromUserId
                WHERE ((LTRIM(RTRIM(lcd.FromUserId)) = '" + uid + @"' AND LTRIM(RTRIM(lcd.ToUserId)) = '" + peer + @"')
                    OR (LTRIM(RTRIM(lcd.FromUserId)) = '" + peer + @"' AND LTRIM(RTRIM(lcd.ToUserId)) = '" + uid + @"'))
                " + afterFilter + @"
                ORDER BY lcd.SentDate ASC, lcd.Id ASC";

            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(sql);
            }
            catch
            {
                dt = null;
            }
            finally
            {
                ObjData.EndConnection();
            }
            return dt;
        }

        public DataTable GetUnreadNotifications(string userId)
        {
            EnsureTable();
            string uid = Esc(userId);
            string sql = @"SELECT
                (SELECT COUNT(*) FROM LiveChatDetail WHERE ToUserId = '" + uid + @"' AND ISNULL(IsRead, 0) = 0) AS TotalUnread,
                (SELECT TOP 1 lcd.Id FROM LiveChatDetail lcd WHERE lcd.ToUserId = '" + uid + @"' AND ISNULL(lcd.IsRead, 0) = 0 ORDER BY lcd.SentDate DESC, lcd.Id DESC) AS LatestUnreadId,
                (SELECT TOP 1 lcd.FromUserId FROM LiveChatDetail lcd WHERE lcd.ToUserId = '" + uid + @"' AND ISNULL(lcd.IsRead, 0) = 0 ORDER BY lcd.SentDate DESC, lcd.Id DESC) AS LatestPeerId,
                (SELECT TOP 1 ISNULL(ud.UserName, lcd.FromUserId) FROM LiveChatDetail lcd LEFT JOIN UserDetail ud ON ud.UserId = lcd.FromUserId WHERE lcd.ToUserId = '" + uid + @"' AND ISNULL(lcd.IsRead, 0) = 0 ORDER BY lcd.SentDate DESC, lcd.Id DESC) AS LatestSenderName,
                (SELECT TOP 1 CASE WHEN ISNULL(lcd.Attachment, '') <> '' AND LTRIM(RTRIM(ISNULL(lcd.MessageText, ''))) = '' THEN 'Sent an attachment' ELSE lcd.MessageText END FROM LiveChatDetail lcd WHERE lcd.ToUserId = '" + uid + @"' AND ISNULL(lcd.IsRead, 0) = 0 ORDER BY lcd.SentDate DESC, lcd.Id DESC) AS LatestPreview,
                (SELECT TOP 1 lcd.SentDate FROM LiveChatDetail lcd WHERE lcd.ToUserId = '" + uid + @"' AND ISNULL(lcd.IsRead, 0) = 0 ORDER BY lcd.SentDate DESC, lcd.Id DESC) AS LatestSentDate";

            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(sql);
            }
            catch
            {
                dt = null;
            }
            finally
            {
                ObjData.EndConnection();
            }
            return dt;
        }

        public int SendMessage(string fromUserId, string toUserId, string messageText, string attachment)
        {
            EnsureTable();
            string text = (messageText ?? "").Trim();
            string fileName = (attachment ?? "").Trim();
            if (string.IsNullOrWhiteSpace(text) && string.IsNullOrWhiteSpace(fileName)) return 0;

            int result = 0;
            SqlConnection cn = null;
            SqlTransaction tr = null;
            try
            {
                cn = ObjData.StartConnectionInTransaction();
                tr = cn.BeginTransaction(IsolationLevel.Serializable);

                string sql = "DECLARE @id INT; " +
                    "SELECT @id = ISNULL(MAX(Id), 0) + 1 FROM LiveChatDetail; " +
                    "INSERT INTO LiveChatDetail (Id, FromUserId, ToUserId, MessageText, SentDate, IsRead, Attachment) " +
                    "VALUES (@id, '" + Esc(fromUserId) + "', '" + Esc(toUserId) + "', '" + Esc(text) + "', GETDATE(), 0, '" + Esc(fileName) + "'); " +
                    "SELECT @id AS NewId;";

                DataTable dt = ObjData.RunSelectQueryTTrans(sql, tr);
                if (dt != null && dt.Rows.Count > 0)
                    result = Convert.ToInt32(dt.Rows[0]["NewId"]);

                tr.Commit();
            }
            catch
            {
                if (tr != null) tr.Rollback();
                result = 0;
            }
            finally
            {
                ObjData.EndConnection();
                if (tr != null) tr.Dispose();
            }
            return result;
        }

        public int SendMessage(string fromUserId, string toUserId, string messageText)
        {
            return SendMessage(fromUserId, toUserId, messageText, "");
        }

        public void MarkAsRead(string userId, string peerUserId)
        {
            EnsureTable();
            string sql = @"UPDATE LiveChatDetail SET IsRead = 1
                WHERE FromUserId = '" + Esc(peerUserId) + @"'
                  AND ToUserId = '" + Esc(userId) + @"'
                  AND ISNULL(IsRead, 0) = 0";

            ObjData.StartConnection();
            try
            {
                ObjData.RunInsUpDelQuery(sql);
            }
            finally
            {
                ObjData.EndConnection();
            }
        }

        public DataTable GetPeerInfo(string peerUserId)
        {
            string sql = @"SELECT TOP 1 UserId, UserName, Mobile,
                CASE WHEN ISNULL(Status, 0) = 1 THEN 'Active' ELSE 'Deactive' END AS Status,
                CASE WHEN ISNULL(Status, 0) = 1 THEN 1 ELSE 0 END AS IsActive
                FROM UserDetail WHERE UserId = '" + Esc(peerUserId) + "'";

            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(sql);
            }
            catch
            {
                dt = null;
            }
            finally
            {
                ObjData.EndConnection();
            }
            return dt;
        }
    }
}
