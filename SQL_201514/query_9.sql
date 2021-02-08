SELECT DISTINCT country
FROM "Stadium"
WHERE capacity = (
	SELECT MAX(capacity)
	FROM "Stadium"
);