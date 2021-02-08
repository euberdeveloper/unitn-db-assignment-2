SELECT DISTINCT S.name, S.capacity
FROM "Stadium" AS S, "Nationality" AS N, "Match" AS M
WHERE (
	M.stadium = S.name
	AND (M.home = N.country OR M.guest = N.country)
	AND (N.group = 'A')
	AND (N.continent = 'Europe')
);
