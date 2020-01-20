ALTER TABLE [MiEFW].[LayoutTxn]
    ADD CONSTRAINT [FK_LayoutTxn_ComponentTxn] FOREIGN KEY ([ComponentTxnID]) REFERENCES [MiEFW].[ComponentTxn] ([autoid]) ON DELETE NO ACTION ON UPDATE NO ACTION;

