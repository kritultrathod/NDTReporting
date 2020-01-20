ALTER TABLE [MiEFW].[mstrolefunctionalityinfo]
    ADD CONSTRAINT [FK_mstrolefunctionalityinfo_mstClientAppMap] FOREIGN KEY ([ClAppMapID]) REFERENCES [MiEFW].[mstClientAppMap] ([AutoID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

