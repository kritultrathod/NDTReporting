ALTER TABLE [MiEFW].[sysconfigtbl]
    ADD CONSTRAINT [FK_sysconfigtbl_mstClientAppMap] FOREIGN KEY ([ClappIDMap]) REFERENCES [MiEFW].[mstClientAppMap] ([AutoID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

