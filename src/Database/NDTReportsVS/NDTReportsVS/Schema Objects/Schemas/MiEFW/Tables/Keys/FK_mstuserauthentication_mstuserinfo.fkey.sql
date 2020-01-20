ALTER TABLE [MiEFW].[mstuserauthentication]
    ADD CONSTRAINT [FK_mstuserauthentication_mstuserinfo] FOREIGN KEY ([loginid]) REFERENCES [MiEFW].[mstuserinfo] ([loginid]) ON DELETE NO ACTION ON UPDATE NO ACTION;

