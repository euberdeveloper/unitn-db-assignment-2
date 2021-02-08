SELECT DISTINCT N1.country, N2.country
FROM "Match" M, "Nationality" N1, "Nationality" N2
WHERE (
	M.home = N1.country
	AND M.guest = N2.country
	AND 0 = (
		SELECT COUNT(*)
		FROM "Match" MM
		WHERE MM.home = N2.country AND MM.guest = N1.country
	)
);