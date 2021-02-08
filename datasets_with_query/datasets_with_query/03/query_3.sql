SELECT DISTINCT N.country
FROM "Nationality" AS N, "Stadium" S1, "Stadium" S2, "Match" M1, "Match" M2
WHERE (
	NOT (M1.stadium = M2.stadium AND M1.time = M2.time)
	AND (M1.date = M2.date)
	AND (S1.name = M1.stadium) AND (S2.name = M2.stadium)
	AND (
		(
			(N.country = M1.home OR N.country = M1.guest) AND (N.country = M2.home OR N.country = M2.guest)
			AND (S1.name <> S2.name)
			AND (M1.time - M2.time) > '-2 hours' AND (M1.time - M2.time) < '2 hours'
		)
		OR (
			(N.country = M1.home OR N.country = M1.guest) AND (N.country = M2.home OR N.country = M2.guest)
			AND (S1.country <> S2.country)
		)
		OR (
			(N.country = M1.home OR N.country = M1.guest OR N.country = M2.home OR N.country = M2.guest)
			AND (S1.name = S2.name)
			AND (M1.time - M2.time) > '-2 hours' AND (M1.time - M2.time) < '2 hours'
		)
	)
)

