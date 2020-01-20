ALTER TABLE [MiEFW].[ComponentTxn]
    ADD CONSTRAINT [FK_ComponentTxn_MstDevComponents] FOREIGN KEY ([ComponentID]) REFERENCES [MiEFW].[MstDevComponents] ([AutoID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

