using System;
using System.Data;
using System.Globalization;
using System.Web.UI;

public partial class admin_SpotCoinPrice : Page
{
    readonly clsSpotCoinPrice _spotPrice = new clsSpotCoinPrice();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["useradmin"] == null || string.IsNullOrEmpty(Session["useradmin"].ToString()))
        {
            Response.Redirect("logout.aspx");
            return;
        }

        if (!IsPostBack)
        {
            BindForm();
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        decimal startPrice;
        decimal targetPrice;
        decimal dailyIncreasePercent;
        int durationMonths;

        if (!decimal.TryParse(txtStartPrice.Text.Trim(), NumberStyles.Any, CultureInfo.InvariantCulture, out startPrice) || startPrice <= 0)
        {
            ShowAlert("Enter a valid starting price.");
            return;
        }

        if (!decimal.TryParse(txtTargetPrice.Text.Trim(), NumberStyles.Any, CultureInfo.InvariantCulture, out targetPrice) || targetPrice <= 0)
        {
            ShowAlert("Enter a valid target price.");
            return;
        }

        if (!int.TryParse(txtDurationMonths.Text.Trim(), out durationMonths) || durationMonths <= 0)
        {
            ShowAlert("Enter duration in months (minimum 1).");
            return;
        }

        if (!decimal.TryParse(txtDailyIncreasePercent.Text.Trim(), NumberStyles.Any, CultureInfo.InvariantCulture, out dailyIncreasePercent) || dailyIncreasePercent < 0)
        {
            ShowAlert("Enter a valid daily increase % (0 or greater).");
            return;
        }

        DateTime startDate;
        if (!DateTime.TryParse(txtStartDate.Text.Trim(), CultureInfo.InvariantCulture, DateTimeStyles.None, out startDate) &&
            !DateTime.TryParse(txtStartDate.Text.Trim(), out startDate))
        {
            ShowAlert("Enter a valid start date.");
            return;
        }

        DateTime endDate;
        if (!DateTime.TryParse(txtEndDate.Text.Trim(), CultureInfo.InvariantCulture, DateTimeStyles.None, out endDate) &&
            !DateTime.TryParse(txtEndDate.Text.Trim(), out endDate))
        {
            ShowAlert("Enter a valid end date.");
            return;
        }

        if (endDate <= startDate)
        {
            ShowAlert("End date must be after start date.");
            return;
        }

        string adminId = Session["useradmin"].ToString();
        bool saved = _spotPrice.SaveConfig(startPrice, targetPrice, durationMonths, dailyIncreasePercent, startDate, endDate, adminId);
        if (!saved)
        {
            ShowAlert("Unable to save configuration. Please try again.");
            return;
        }

        ShowAlert("Spot coin price configuration saved successfully.");
        BindForm();
    }

    void BindForm()
    {
        SpotCoinPriceConfig config = _spotPrice.GetActiveConfig();
        decimal currentPrice = clsSpotCoinPrice.ComputeCurrentPrice(config);

        txtStartPrice.Text = config.StartPrice.ToString("0.########", CultureInfo.InvariantCulture);
        txtTargetPrice.Text = config.TargetPrice.ToString("0.########", CultureInfo.InvariantCulture);
        txtDurationMonths.Text = config.DurationMonths.ToString();
        txtDailyIncreasePercent.Text = config.DailyIncreasePercent.ToString("0.##", CultureInfo.InvariantCulture);
        txtStartDate.Text = config.StartDate.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture);
        txtEndDate.Text = config.EndDate.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture);

        lblCurrentPrice.Text = "$" + currentPrice.ToString("0.########", CultureInfo.InvariantCulture);
        lblPriceRange.Text = "$" + config.StartPrice.ToString("0.########", CultureInfo.InvariantCulture) +
                             " to $" + config.TargetPrice.ToString("0.########", CultureInfo.InvariantCulture);
        lblDailyIncrease.Text = config.DailyIncreasePercent.ToString("0.##", CultureInfo.InvariantCulture) + "% per day";
        lblStartDate.Text = config.StartDate.ToString("dd-MMM-yyyy HH:mm");
        lblEndDate.Text = config.EndDate.ToString("dd-MMM-yyyy HH:mm");
        lblUpdatedOn.Text = string.IsNullOrEmpty(config.UpdatedBy)
            ? config.UpdatedOn.ToString("dd-MMM-yyyy HH:mm")
            : config.UpdatedOn.ToString("dd-MMM-yyyy HH:mm") + " by " + config.UpdatedBy;

        double totalMs = (config.EndDate - config.StartDate).TotalMilliseconds;
        double elapsedMs = (DateTime.Now - config.StartDate).TotalMilliseconds;
        double progress = totalMs <= 0 ? 1 : Math.Max(0, Math.Min(1, elapsedMs / totalMs));
        lblProgress.Text = (progress * 100).ToString("0.0") + "%";

        DataTable history = _spotPrice.GetConfigHistory();
        gvHistory.DataSource = history;
        gvHistory.DataBind();
    }

    void ShowAlert(string message)
    {
        string popupScript = "alert('" + message.Replace("'", "\\'") + "');";
        ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
    }
}
