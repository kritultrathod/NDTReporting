﻿ALTER TABLE [dbo].[Portfolio]
    ADD CONSTRAINT [PK_Portfolio] PRIMARY KEY CLUSTERED ([PortfolioID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);

