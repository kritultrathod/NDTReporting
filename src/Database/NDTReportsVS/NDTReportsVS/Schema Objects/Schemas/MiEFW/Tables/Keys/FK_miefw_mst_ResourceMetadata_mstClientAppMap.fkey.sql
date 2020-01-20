ALTER TABLE [MiEFW].[mst_ResourceMetadata]
    ADD CONSTRAINT [FK_miefw_mst_ResourceMetadata_mstClientAppMap] FOREIGN KEY ([ClAppMapID]) REFERENCES [MiEFW].[mstClientAppMap] ([AutoID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

