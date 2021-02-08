SELECT DISTINCT N1.continent, COUNT(*)
FROM "Match" M, "Nationality" N1, "Nationality" N2, "Nationality" N3, "Stadium" S
WHERE (
	M.stadium = S.name
	AND S.country = N3.country
	AND M.home = N1.country AND M.guest = N2.country
	AND N1.continent = N2.continent
	AND N2.continent = N3.continent
)
GROUP BY N1.continent
UNION
SELECT DISTINCT N.continent, 0
FROM "Nationality" N
WHERE N.continent <> ALL (
	SELECT DISTINCT N1.continent
	FROM "Match" M, "Nationality" N1, "Nationality" N2, "Nationality" N3, "Stadium" S
	WHERE (
		M.stadium = S.name
		AND S.country = N3.country
		AND M.home = N1.country AND M.guest = N2.country
		AND N1.continent = N2.continent
		AND N2.continent = N3.continent
	)
	GROUP BY N1.continent
)