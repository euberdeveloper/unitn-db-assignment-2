SELECT DISTINCT S.name
FROM "Stadium" S
WHERE (
	(
		'Europe' = ALL (
			SELECT continent
			FROM "Nationality" N, "Match" M
			WHERE M.stadium = S.name AND (N.country = M.home OR N.country = M.GUEST)
		)
	)
	AND (
		EXISTS (
			SELECT *
			FROM "Match" M
			WHERE M.stadium = S.name
		)
	)
);