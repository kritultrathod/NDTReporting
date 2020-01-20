ALTER TABLE [NDTUAT].[RadiographicWeldTestResult]
    ADD CONSTRAINT [FK_RadiographicWeldTestResult_RadiographicWeld] FOREIGN KEY ([ReportId]) REFERENCES [NDTUAT].[RadiographicWeld] ([ReportId]) ON DELETE NO ACTION ON UPDATE NO ACTION;

