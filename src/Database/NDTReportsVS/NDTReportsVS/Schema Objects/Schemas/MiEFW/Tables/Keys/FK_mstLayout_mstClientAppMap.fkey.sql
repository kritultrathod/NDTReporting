﻿ALTER TABLE [MiEFW].[mstLayout]
    ADD CONSTRAINT [FK_mstLayout_mstClientAppMap] FOREIGN KEY ([ClAppIDMap]) REFERENCES [MiEFW].[mstClientAppMap] ([AutoID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

