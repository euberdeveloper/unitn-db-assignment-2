SELECT DISTINCT S.country
FROM "Stadium" S, "Match" M
WHERE (
	S.name = M.stadium
	AND S.capacity < (
		SELECT MAX(capacity)
		FROM "Stadium"
		WHERE country = S.country
	)
);