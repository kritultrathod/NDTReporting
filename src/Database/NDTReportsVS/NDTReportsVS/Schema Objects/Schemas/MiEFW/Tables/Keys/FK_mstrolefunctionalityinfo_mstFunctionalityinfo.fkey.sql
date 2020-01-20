ALTER TABLE [MiEFW].[mstrolefunctionalityinfo]
    ADD CONSTRAINT [FK_mstrolefunctionalityinfo_mstFunctionalityinfo] FOREIGN KEY ([functionalityid]) REFERENCES [MiEFW].[mstFunctionalityinfo] ([functionalityid]) ON DELETE NO ACTION ON UPDATE NO ACTION;

