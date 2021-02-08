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
	AND NOT EXISTS (
		SELECT name
		FROM "Stadium"
		WHERE country = N1.country AND capacity <= 100000
	)
	AND NOT EXISTS (
		SELECT name
		FROM "Stadium"
		WHERE country = N2.country AND capacity >= 10000
	)
)