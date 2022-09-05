-- View all from lli_geo_dev.terminal_dev
SELECT * FROM lli_geo_dev.terminal_dev;

SELECT terminal_id, terminal_type FROM lli_geo_dev.terminal_dev
	WHERE terminal_id = 'TML-00011';
	
-- Count of already classified terminals
SELECT COUNT (*) FROM lli_geo_dev.terminal_dev
WHERE terminal_type IS NOT NULL

-- View all terminals where terminal type is null
SELECT * FROM lli_geo_dev.terminal_dev
	WHERE terminal_type IS NULL
	ORDER BY  terminal_id ASC;

-- Begin transaction
BEGIN;

-- Add manually classified terminals
UPDATE lli_geo_dev.terminal_dev as t1
SET terminal_type = t2.terminal_type FROM testing.terminal_less_than_20 as t2
WHERE t1.terminal_id = t2.terminal_id
AND t1.terminal_type IS NULL;

-- View changes made to see if query is successful
SELECT terminal_id, terminal_type FROM lli_geo_dev.terminal_dev
	WHERE terminal_id = 'TML-00011';
	
-- Commit changes in transaction
COMMIT;

-- Rollback transaction if needed
ROLLBACK;