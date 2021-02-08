SELECT DISTINCT N1.country, N2.country
FROM "Nationality" N1, "Nationality" N2, "Match" M
WHERE (
	(
		(
			M.home = N1.country
			AND M.guest = N2.country
		)
		OR
		(
			M.home = N2.country
			AND M.guest = N1.country
		)
	)
	AND 100000 < (
		SELECT MIN(capacity)
		FROM "Stadium"
		WHERE country = N1.country
	)
	AND 100000 > (
		SELECT MAX(capacity)
		FROM "Stadium"
		WHERE country = N2.country
	)
)