-- Reduce lightning frequency on Fulgora, from 0.001667 to 0.0001 (So 16.7x less frequent)
-- Lightning is constant on Fulgora now, from 40% of the day in vanilla. So this is really just a 6.5x ish nerf.
-- This change is so accumulators are still needed to power the base between infrequent lightning strikes, and so steam is a likely requirement.
data.raw["planet"]["fulgora"].lightning_properties.lightnings_per_chunk_per_tick = 0.0001 -- Vanilla is 0.00166...

-- Lightning damage buff (Funny)
data.raw["lightning"]["lightning"].damage = 290 -- Player hp is 250, shields are 50. !!! Warn players that they will get one shot without some sort of extra health.

-- Changes to lightning power density text on space map in locale files.

