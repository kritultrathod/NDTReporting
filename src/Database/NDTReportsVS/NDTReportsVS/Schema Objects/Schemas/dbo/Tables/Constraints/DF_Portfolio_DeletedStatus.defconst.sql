ALTER TABLE [dbo].[Portfolio]
    ADD CONSTRAINT [DF_Portfolio_DeletedStatus] DEFAULT ((0)) FOR [DeletedStatus];

