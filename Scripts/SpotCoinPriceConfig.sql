-- Spot trading coin price configuration (UWC+)
IF NOT EXISTS (SELECT 1 FROM sys.tables WHERE name = 'SpotCoinPriceConfig')
BEGIN
    CREATE TABLE SpotCoinPriceConfig (
        Id INT IDENTITY(1,1) PRIMARY KEY,
        CoinSymbol NVARCHAR(20) NOT NULL CONSTRAINT DF_SpotCoinPriceConfig_CoinSymbol DEFAULT ('UWC+'),
        StartPrice DECIMAL(18,8) NOT NULL,
        TargetPrice DECIMAL(18,8) NOT NULL,
        DurationMonths INT NOT NULL,
        DailyIncreasePercent DECIMAL(9,4) NOT NULL CONSTRAINT DF_SpotCoinPriceConfig_DailyIncreasePercent DEFAULT (0),
        StartDate DATETIME NOT NULL,
        EndDate DATETIME NULL,
        IsActive BIT NOT NULL CONSTRAINT DF_SpotCoinPriceConfig_IsActive DEFAULT (1),
        UpdatedBy NVARCHAR(50) NULL,
        UpdatedOn DATETIME NOT NULL CONSTRAINT DF_SpotCoinPriceConfig_UpdatedOn DEFAULT (GETDATE())
    );
END
GO

IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_id = OBJECT_ID('SpotCoinPriceConfig') AND name = 'EndDate')
BEGIN
    ALTER TABLE SpotCoinPriceConfig ADD EndDate DATETIME NULL;
END
GO

-- Optional default row (only if table is empty)
IF NOT EXISTS (SELECT 1 FROM SpotCoinPriceConfig)
BEGIN
    INSERT INTO SpotCoinPriceConfig (CoinSymbol, StartPrice, TargetPrice, DurationMonths, DailyIncreasePercent, StartDate, EndDate, IsActive, UpdatedBy, UpdatedOn)
    VALUES ('UWC+', 0.00013900, 0.00040000, 6, 1.0000, '2026-06-15 00:00:00', '2026-12-15 00:00:00', 1, 'system', GETDATE());
END
GO
