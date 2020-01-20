ALTER TABLE [MiEFW].[ComponentTxn]
    ADD CONSTRAINT [FK_ComponentTxn_MstDevComponents_Attributes] FOREIGN KEY ([AttributeID]) REFERENCES [MiEFW].[MstDevComponents_Attributes] ([AutoID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

