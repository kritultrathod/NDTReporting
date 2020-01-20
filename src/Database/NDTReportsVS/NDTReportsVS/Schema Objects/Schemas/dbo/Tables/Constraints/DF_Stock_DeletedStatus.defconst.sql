ALTER TABLE [dbo].[Stock]
    ADD CONSTRAINT [DF_Stock_DeletedStatus] DEFAULT ((0)) FOR [DeletedStatus];

