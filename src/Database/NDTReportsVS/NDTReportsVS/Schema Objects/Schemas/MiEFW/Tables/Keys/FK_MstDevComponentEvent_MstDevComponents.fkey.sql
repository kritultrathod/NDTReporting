ALTER TABLE [MiEFW].[MstDevComponentEvent]
    ADD CONSTRAINT [FK_MstDevComponentEvent_MstDevComponents] FOREIGN KEY ([ComponentID]) REFERENCES [MiEFW].[MstDevComponents] ([AutoID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

