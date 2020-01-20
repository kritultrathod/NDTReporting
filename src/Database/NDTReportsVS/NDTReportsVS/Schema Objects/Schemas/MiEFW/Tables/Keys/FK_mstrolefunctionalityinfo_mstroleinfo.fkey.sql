ALTER TABLE [MiEFW].[mstrolefunctionalityinfo]
    ADD CONSTRAINT [FK_mstrolefunctionalityinfo_mstroleinfo] FOREIGN KEY ([roleid]) REFERENCES [MiEFW].[mstroleinfo] ([roleid]) ON DELETE NO ACTION ON UPDATE NO ACTION;

