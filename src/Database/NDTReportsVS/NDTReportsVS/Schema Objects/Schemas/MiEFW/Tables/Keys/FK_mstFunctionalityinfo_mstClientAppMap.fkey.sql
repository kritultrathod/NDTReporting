ALTER TABLE [MiEFW].[mstFunctionalityinfo]
    ADD CONSTRAINT [FK_mstFunctionalityinfo_mstClientAppMap] FOREIGN KEY ([ClAppMapID]) REFERENCES [MiEFW].[mstClientAppMap] ([AutoID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

