ALTER TABLE [MiEFW].[MiDBTool_ParameterMaster]
    ADD CONSTRAINT [FK_MiDBTool_ParameterMaster_MiDBTool_ReportMaster] FOREIGN KEY ([storeID]) REFERENCES [MiEFW].[MiDBTool_ReportMaster] ([StoreID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

