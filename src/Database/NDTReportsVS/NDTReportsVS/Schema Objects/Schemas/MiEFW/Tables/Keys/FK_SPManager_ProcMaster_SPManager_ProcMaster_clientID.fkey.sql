ALTER TABLE [MiEFW].[SPManager_ProcMaster]
    ADD CONSTRAINT [FK_SPManager_ProcMaster_SPManager_ProcMaster_clientID] FOREIGN KEY ([ClientAppMapID]) REFERENCES [MiEFW].[Archive_mst_Clientbase] ([AutoID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

