﻿ALTER TABLE [MiEFW].[User2Role2AppMap]
    ADD CONSTRAINT [FK_Table1_mstClientAppMap] FOREIGN KEY ([ClAppIDMap]) REFERENCES [MiEFW].[mstClientAppMap] ([AutoID]) ON DELETE NO ACTION ON UPDATE NO ACTION;
