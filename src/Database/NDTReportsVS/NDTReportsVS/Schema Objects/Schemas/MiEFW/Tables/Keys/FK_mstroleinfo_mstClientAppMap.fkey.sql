ALTER TABLE [MiEFW].[mstroleinfo]
    ADD CONSTRAINT [FK_mstroleinfo_mstClientAppMap] FOREIGN KEY ([ClAppIDMap]) REFERENCES [MiEFW].[mstClientAppMap] ([AutoID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

