using System;
using System.Data;
using System.Globalization;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using BusinessLogicTier;
using DataTier;

public partial class user_SpotTrading : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] == null)
        {
            Response.Redirect("index.aspx");
            return;
        }

        if (!IsPostBack)
        {
            hdnUserId.Value = Session["userid"].ToString();
            hdnUsdtBalance.Value = GetUsdtBalance(Session["userid"].ToString());

            if (Session["spot_uwc_balance"] == null)
                Session["spot_uwc_balance"] = 0m;
        }
    }

    static string CurrentUserId()
    {
        var session = HttpContext.Current.Session;
        if (session == null || session["userid"] == null) return null;
        return session["userid"].ToString();
    }

    static string Esc(string value)
    {
        return (value ?? "").Replace("'", "''").Trim();
    }

    static string GetUsdtBalance(string userId)
    {
        Data objData = new Data();
        string safeId = Esc(userId);
        string sql = "SELECT ISNULL(utilitybalance, 0) AS utilitybalance FROM UserDetail WITH (NOLOCK) WHERE UserId = '" + safeId + "'";
        DataTable dt = null;
        objData.StartConnection();
        try
        {
            dt = objData.RunDataTable(sql);
        }
        finally
        {
            objData.EndConnection();
        }

        if (dt == null || dt.Rows.Count == 0) return "0";
        return dt.Rows[0]["utilitybalance"].ToString();
    }

    static decimal GetUwcBalance()
    {
        var session = HttpContext.Current.Session;
        if (session == null || session["spot_uwc_balance"] == null) return 0m;
        decimal val;
        if (decimal.TryParse(session["spot_uwc_balance"].ToString(), NumberStyles.Any, CultureInfo.InvariantCulture, out val))
            return val;
        return 0m;
    }

    static void SetUwcBalance(decimal balance)
    {
        if (HttpContext.Current.Session != null)
            HttpContext.Current.Session["spot_uwc_balance"] = balance;
    }

    static bool UpdateUsdtBalance(string userId, decimal delta)
    {
        Data objData = new Data();
        string safeId = Esc(userId);
        string deltaText = delta.ToString(CultureInfo.InvariantCulture);
        string sql = "UPDATE UserDetail SET utilitybalance = ISNULL(utilitybalance, 0) + (" + deltaText + ") " +
                     "WHERE UserId = '" + safeId + "' AND ISNULL(utilitybalance, 0) + (" + deltaText + ") >= 0";

        objData.StartConnection();
        try
        {
            objData.RunInsUpDelQuery(sql);
        }
        finally
        {
            objData.EndConnection();
        }

        string updated = GetUsdtBalance(userId);
        decimal bal;
        if (!decimal.TryParse(updated, NumberStyles.Any, CultureInfo.InvariantCulture, out bal) || bal < 0)
            return false;
        return true;
    }

    [WebMethod(EnableSession = true)]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static SpotApiResponse GetSpotState()
    {
        try
        {
            string userId = CurrentUserId();
            if (string.IsNullOrEmpty(userId))
                return SpotApiResponse.Fail("Session expired. Please login again.");

            return SpotApiResponse.Ok(GetUsdtBalance(userId), GetUwcBalance());
        }
        catch (Exception ex)
        {
            return SpotApiResponse.Fail("Unable to load balances: " + ex.Message);
        }
    }

    [WebMethod(EnableSession = true)]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static SpotApiResponse ExecuteSpotTrade(string side, decimal amount, decimal price)
    {
        try
        {
            string userId = CurrentUserId();
            if (string.IsNullOrEmpty(userId))
                return SpotApiResponse.Fail("Session expired. Please login again.");

            if (price <= 0)
                return SpotApiResponse.Fail("Invalid market price.");

            if (amount <= 0)
                return SpotApiResponse.Fail("Enter a valid amount.");

            string tradeSide = (side ?? "").Trim().ToLowerInvariant();
            decimal usdtBal;
            if (!decimal.TryParse(GetUsdtBalance(userId), NumberStyles.Any, CultureInfo.InvariantCulture, out usdtBal))
                usdtBal = 0m;

            decimal uwcBal = GetUwcBalance();

            if (tradeSide == "buy")
            {
                if (amount > usdtBal)
                    return SpotApiResponse.Fail("Insufficient USDT balance.");

                decimal uwcReceived = amount / price;
                if (!UpdateUsdtBalance(userId, -amount))
                    return SpotApiResponse.Fail("Unable to deduct USDT balance.");

                uwcBal += uwcReceived;
                SetUwcBalance(uwcBal);

                return SpotApiResponse.TradeOk(
                    "Buy order filled successfully.",
                    GetUsdtBalance(userId),
                    uwcBal,
                    "buy",
                    price,
                    uwcReceived,
                    amount);
            }

            if (tradeSide == "sell")
            {
                if (amount > uwcBal)
                    return SpotApiResponse.Fail("Insufficient UWC+ balance.");

                decimal usdtReceived = amount * price;
                if (!UpdateUsdtBalance(userId, usdtReceived))
                    return SpotApiResponse.Fail("Unable to credit USDT balance.");

                uwcBal -= amount;
                SetUwcBalance(uwcBal);

                return SpotApiResponse.TradeOk(
                    "Sell order filled successfully.",
                    GetUsdtBalance(userId),
                    uwcBal,
                    "sell",
                    price,
                    amount,
                    usdtReceived);
            }

            return SpotApiResponse.Fail("Invalid order side.");
        }
        catch (Exception ex)
        {
            return SpotApiResponse.Fail("Trade failed: " + ex.Message);
        }
    }
}

public class SpotApiResponse
{
    public bool success { get; set; }
    public string message { get; set; }
    public string usdtBalance { get; set; }
    public string uwcBalance { get; set; }
    public string side { get; set; }
    public string price { get; set; }
    public string coinAmount { get; set; }
    public string totalUsdt { get; set; }

    public static SpotApiResponse Fail(string message)
    {
        return new SpotApiResponse { success = false, message = message };
    }

    public static SpotApiResponse Ok(string usdtBalance, decimal uwcBalance)
    {
        return new SpotApiResponse
        {
            success = true,
            usdtBalance = usdtBalance,
            uwcBalance = uwcBalance.ToString("0.########", CultureInfo.InvariantCulture)
        };
    }

    public static SpotApiResponse TradeOk(string message, string usdtBalance, decimal uwcBalance, string side, decimal price, decimal coinAmount, decimal totalUsdt)
    {
        return new SpotApiResponse
        {
            success = true,
            message = message,
            usdtBalance = usdtBalance,
            uwcBalance = uwcBalance.ToString("0.########", CultureInfo.InvariantCulture),
            side = side,
            price = price.ToString("0.########", CultureInfo.InvariantCulture),
            coinAmount = coinAmount.ToString("0.########", CultureInfo.InvariantCulture),
            totalUsdt = totalUsdt.ToString("0.########", CultureInfo.InvariantCulture)
        };
    }
}
