﻿ALTER TABLE [dbo].[Stock]
    ADD CONSTRAINT [PK_Stock] PRIMARY KEY CLUSTERED ([StockId] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);
