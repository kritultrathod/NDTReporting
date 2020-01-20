ALTER TABLE [MiEFW].[mstuserinfo]
    ADD CONSTRAINT [FK_mstuserinfo_ContactInfo] FOREIGN KEY ([ContactID]) REFERENCES [MiEFW].[ContactInfo] ([AutoID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

