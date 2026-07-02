using System;
using System.Data;
using System.Globalization;
using DataTier;

public class SpotCoinPriceConfig
{
    public int Id { get; set; }
    public string CoinSymbol { get; set; }
    public decimal StartPrice { get; set; }
    public decimal TargetPrice { get; set; }
    public int DurationMonths { get; set; }
    public decimal DailyIncreasePercent { get; set; }
    public DateTime StartDate { get; set; }
    public DateTime EndDate { get; set; }
    public bool IsActive { get; set; }
    public string UpdatedBy { get; set; }
    public DateTime UpdatedOn { get; set; }

    public decimal MinPrice
    {
        get { return Math.Min(StartPrice, TargetPrice); }
    }

    public decimal MaxPrice
    {
        get { return Math.Max(StartPrice, TargetPrice); }
    }

    public decimal FloorPrice
    {
        get { return MinPrice * 0.98m; }
    }

    public decimal CeilingPrice
    {
        get { return MaxPrice * 1.02m; }
    }
}

public class clsSpotCoinPrice
{
    readonly Data _objData = new Data();

    static string Esc(string value)
    {
        return (value ?? string.Empty).Replace("'", "''").Trim();
    }

    public void EnsureTable()
    {
        const string sql =
            "IF NOT EXISTS (SELECT 1 FROM sys.tables WHERE name = 'SpotCoinPriceConfig') " +
            "BEGIN " +
            "CREATE TABLE SpotCoinPriceConfig (" +
            "Id INT IDENTITY(1,1) PRIMARY KEY, " +
            "CoinSymbol NVARCHAR(20) NOT NULL CONSTRAINT DF_SpotCoinPriceConfig_CoinSymbol DEFAULT ('UWC+'), " +
            "StartPrice DECIMAL(18,8) NOT NULL, " +
            "TargetPrice DECIMAL(18,8) NOT NULL, " +
            "DurationMonths INT NOT NULL, " +
            "DailyIncreasePercent DECIMAL(9,4) NOT NULL CONSTRAINT DF_SpotCoinPriceConfig_DailyIncreasePercent DEFAULT (0), " +
            "StartDate DATETIME NOT NULL, " +
            "EndDate DATETIME NULL, " +
            "IsActive BIT NOT NULL CONSTRAINT DF_SpotCoinPriceConfig_IsActive DEFAULT (1), " +
            "UpdatedBy NVARCHAR(50) NULL, " +
            "UpdatedOn DATETIME NOT NULL CONSTRAINT DF_SpotCoinPriceConfig_UpdatedOn DEFAULT (GETDATE())" +
            "); " +
            "END; " +
            "IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_id = OBJECT_ID('SpotCoinPriceConfig') AND name = 'DailyIncreasePercent') " +
            "ALTER TABLE SpotCoinPriceConfig ADD DailyIncreasePercent DECIMAL(9,4) NOT NULL CONSTRAINT DF_SpotCoinPriceConfig_DailyIncreasePercent2 DEFAULT (0); " +
            "IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_id = OBJECT_ID('SpotCoinPriceConfig') AND name = 'EndDate') " +
            "ALTER TABLE SpotCoinPriceConfig ADD EndDate DATETIME NULL;";

        _objData.StartConnection();
        try
        {
            _objData.RunInsUpDelQuery(sql);
        }
        finally
        {
            _objData.EndConnection();
        }
    }

    public SpotCoinPriceConfig GetActiveConfig()
    {
        EnsureTable();

        const string sql =
            "SELECT TOP 1 Id, CoinSymbol, StartPrice, TargetPrice, DurationMonths, DailyIncreasePercent, StartDate, EndDate, IsActive, UpdatedBy, UpdatedOn " +
            "FROM SpotCoinPriceConfig WITH (NOLOCK) WHERE IsActive = 1 ORDER BY Id DESC";

        DataTable dt = null;
        _objData.StartConnection();
        try
        {
            dt = _objData.RunDataTable(sql);
        }
        finally
        {
            _objData.EndConnection();
        }

        if (dt == null || dt.Rows.Count == 0)
            return GetDefaultConfig();

        return MapRow(dt.Rows[0]);
    }

    public DataTable GetConfigHistory()
    {
        EnsureTable();

        const string sql =
            "SELECT Id, CoinSymbol, StartPrice, TargetPrice, DurationMonths, DailyIncreasePercent, StartDate, EndDate, IsActive, UpdatedBy, UpdatedOn " +
            "FROM SpotCoinPriceConfig WITH (NOLOCK) ORDER BY Id DESC";

        DataTable dt = null;
        _objData.StartConnection();
        try
        {
            dt = _objData.RunDataTable(sql);
        }
        finally
        {
            _objData.EndConnection();
        }

        return dt ?? new DataTable();
    }

    public bool SaveConfig(decimal startPrice, decimal targetPrice, int durationMonths, decimal dailyIncreasePercent, DateTime startDate, DateTime endDate, string updatedBy)
    {
        if (startPrice <= 0 || targetPrice <= 0)
            return false;

        if (endDate <= startDate)
            return false;

        if (durationMonths <= 0)
            durationMonths = CalcDurationMonths(startDate, endDate);

        if (dailyIncreasePercent < 0)
            dailyIncreasePercent = 0;

        EnsureTable();

        string safeUser = Esc(updatedBy);
        string startText = startPrice.ToString(CultureInfo.InvariantCulture);
        string targetText = targetPrice.ToString(CultureInfo.InvariantCulture);
        string dailyText = dailyIncreasePercent.ToString(CultureInfo.InvariantCulture);
        string startDateText = startDate.ToString("yyyy-MM-dd HH:mm:ss", CultureInfo.InvariantCulture);
        string endDateText = endDate.ToString("yyyy-MM-dd HH:mm:ss", CultureInfo.InvariantCulture);

        string sql =
            "UPDATE SpotCoinPriceConfig SET IsActive = 0 WHERE IsActive = 1; " +
            "INSERT INTO SpotCoinPriceConfig (CoinSymbol, StartPrice, TargetPrice, DurationMonths, DailyIncreasePercent, StartDate, EndDate, IsActive, UpdatedBy, UpdatedOn) " +
            "VALUES ('UWC+', " + startText + ", " + targetText + ", " + durationMonths + ", " + dailyText + ", '" + startDateText + "', '" + endDateText + "', 1, '" + safeUser + "', GETDATE())";

        _objData.StartConnection();
        try
        {
            _objData.RunInsUpDelQuery(sql);
            return true;
        }
        finally
        {
            _objData.EndConnection();
        }
    }

    public static int CalcDurationMonths(DateTime startDate, DateTime endDate)
    {
        int months = ((endDate.Year - startDate.Year) * 12) + endDate.Month - startDate.Month;
        if (endDate.Day < startDate.Day) months--;
        if (months < 1) months = 1;
        return months;
    }

    public static DateTime GetDefaultStartDate()
    {
        int year = DateTime.Now.Year;
        return new DateTime(year, 6, 15, 0, 0, 0);
    }

    public static DateTime GetDefaultEndDate()
    {
        return GetDefaultStartDate().AddMonths(6);
    }

    public static DateTime ResolveEndDate(DateTime startDate, int durationMonths, DateTime storedEndDate)
    {
        if (storedEndDate > startDate)
            return storedEndDate;

        return startDate.AddMonths(durationMonths <= 0 ? 1 : durationMonths);
    }

    public static SpotCoinPriceConfig GetDefaultConfig()
    {
        var startDate = GetDefaultStartDate();
        return new SpotCoinPriceConfig
        {
            Id = 0,
            CoinSymbol = "UWC+",
            StartPrice = 0.000139m,
            TargetPrice = 0.00040m,
            DurationMonths = 6,
            DailyIncreasePercent = 1.0m,
            StartDate = startDate,
            EndDate = GetDefaultEndDate(),
            IsActive = true,
            UpdatedBy = "system",
            UpdatedOn = DateTime.Now
        };
    }

    public static decimal ComputePriceAt(SpotCoinPriceConfig config, DateTime at)
    {
        if (config == null)
            config = GetDefaultConfig();

        DateTime endDate = config.EndDate;

        if (at <= config.StartDate)
            return config.StartPrice;

        if (at >= endDate)
            return config.TargetPrice;

        double daysElapsed = (at - config.StartDate).TotalDays;
        if (daysElapsed < 0) daysElapsed = 0;

        decimal price;
        if (config.DailyIncreasePercent > 0)
        {
            double rate = (double)(config.DailyIncreasePercent / 100m);
            bool rising = config.TargetPrice >= config.StartPrice;
            double factor = rising ? (1d + rate) : (1d - rate);
            if (factor < 0.0001d) factor = 0.0001d;

            price = config.StartPrice * (decimal)Math.Pow(factor, daysElapsed);

            if (rising)
                price = Math.Min(price, config.TargetPrice);
            else
                price = Math.Max(price, config.TargetPrice);
        }
        else
        {
            double totalDays = (endDate - config.StartDate).TotalDays;
            if (totalDays <= 0)
                return config.TargetPrice;

            double progress = daysElapsed / totalDays;
            if (progress < 0) progress = 0;
            if (progress > 1) progress = 1;

            decimal delta = config.TargetPrice - config.StartPrice;
            price = config.StartPrice + (delta * (decimal)progress);
        }

        return price;
    }

    public static decimal ComputeCurrentPrice(SpotCoinPriceConfig config)
    {
        return ComputePriceAt(config, DateTime.Now);
    }

    static SpotCoinPriceConfig MapRow(DataRow row)
    {
        decimal dailyPercent = 0m;
        if (row.Table.Columns.Contains("DailyIncreasePercent") && row["DailyIncreasePercent"] != DBNull.Value)
            dailyPercent = Convert.ToDecimal(row["DailyIncreasePercent"]);

        DateTime startDate = Convert.ToDateTime(row["StartDate"]);
        int durationMonths = Convert.ToInt32(row["DurationMonths"]);

        DateTime storedEnd = DateTime.MinValue;
        if (row.Table.Columns.Contains("EndDate") && row["EndDate"] != DBNull.Value)
            storedEnd = Convert.ToDateTime(row["EndDate"]);

        return new SpotCoinPriceConfig
        {
            Id = Convert.ToInt32(row["Id"]),
            CoinSymbol = row["CoinSymbol"].ToString(),
            StartPrice = Convert.ToDecimal(row["StartPrice"]),
            TargetPrice = Convert.ToDecimal(row["TargetPrice"]),
            DurationMonths = durationMonths,
            DailyIncreasePercent = dailyPercent,
            StartDate = startDate,
            EndDate = ResolveEndDate(startDate, durationMonths, storedEnd),
            IsActive = Convert.ToBoolean(row["IsActive"]),
            UpdatedBy = row["UpdatedBy"] == DBNull.Value ? "" : row["UpdatedBy"].ToString(),
            UpdatedOn = Convert.ToDateTime(row["UpdatedOn"])
        };
    }
}
