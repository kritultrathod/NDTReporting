ALTER TABLE [MiEFW].[mstClientAppMap]
    ADD CONSTRAINT [FK_mstClientAppMap_mst_Clientbase] FOREIGN KEY ([ClientID]) REFERENCES [MiEFW].[Archive_mst_Clientbase] ([AutoID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

