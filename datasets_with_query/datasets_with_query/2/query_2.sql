SELECT DISTINCT S.city
FROM "Stadium" AS S, "Match" AS M, "Nationality" AS N1, "Nationality" AS N2 
WHERE (
	S.name = M.stadium 
	AND N1.continent = 'South America' 
	AND N2.continent = 'South America' 
	AND M.home = N1.country 
	AND M.guest = N2.country
);