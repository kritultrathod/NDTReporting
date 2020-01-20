ALTER TABLE [MiEFW].[MiDBTool_ReportMaster]
    ADD CONSTRAINT [FK_MiDBTool_ReportMaster_mstClientAppMap] FOREIGN KEY ([ClAppMapID]) REFERENCES [MiEFW].[mstClientAppMap] ([AutoID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

