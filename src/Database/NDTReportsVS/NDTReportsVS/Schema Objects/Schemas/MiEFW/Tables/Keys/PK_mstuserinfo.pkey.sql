﻿ALTER TABLE [MiEFW].[mstuserinfo]
    ADD CONSTRAINT [PK_mstuserinfo] PRIMARY KEY CLUSTERED ([loginid] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);

