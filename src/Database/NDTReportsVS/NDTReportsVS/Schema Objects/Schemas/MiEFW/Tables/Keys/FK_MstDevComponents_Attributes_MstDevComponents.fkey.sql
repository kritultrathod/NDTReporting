ALTER TABLE [MiEFW].[MstDevComponents_Attributes]
    ADD CONSTRAINT [FK_MstDevComponents_Attributes_MstDevComponents] FOREIGN KEY ([ComponentID]) REFERENCES [MiEFW].[MstDevComponents] ([AutoID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

