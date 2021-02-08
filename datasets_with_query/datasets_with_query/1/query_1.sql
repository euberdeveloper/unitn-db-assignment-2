SELECT DISTINCT S.city
FROM "Stadium" AS S, "Match" AS M, "Nationality" AS N
WHERE (
	S.name = M.stadium 
	AND N.group IN ('A', 'B', 'C') 
	AND (
		M.home = N.country 
		OR M.guest = N.country
	)
);