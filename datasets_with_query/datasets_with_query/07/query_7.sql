SELECT DISTINCT country
FROM "Nationality" N
WHERE (
	N.continent = 'Europe'
	AND NOT EXISTS (
		SELECT *
		FROM "Stadium" S, "Match" M
		WHERE (
			S.name = M.stadium
			AND (M.home = N.country OR M.guest = N.country)
			AND S.country = N.country
		)
	)
);