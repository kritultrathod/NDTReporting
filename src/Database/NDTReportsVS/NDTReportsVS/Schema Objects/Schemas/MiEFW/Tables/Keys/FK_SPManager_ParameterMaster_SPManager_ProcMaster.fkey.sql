ALTER TABLE [MiEFW].[SPManager_ParameterMaster]
    ADD CONSTRAINT [FK_SPManager_ParameterMaster_SPManager_ProcMaster] FOREIGN KEY ([storeID]) REFERENCES [MiEFW].[SPManager_ProcMaster] ([StoreID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

