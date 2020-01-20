ALTER TABLE [MiEFW].[mstClientAppMap]
    ADD CONSTRAINT [FK_mstClientAppMap_mst_Appbase] FOREIGN KEY ([AppID]) REFERENCES [MiEFW].[mst_Appbase] ([AutoID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

