ALTER TABLE [MiEFW].[User2Role2AppMap]
    ADD CONSTRAINT [FK_Table1_mstuserinfo] FOREIGN KEY ([LoginID]) REFERENCES [MiEFW].[mstuserinfo] ([loginid]) ON DELETE NO ACTION ON UPDATE NO ACTION;

