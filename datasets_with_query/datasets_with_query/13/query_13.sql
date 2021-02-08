SELECT DISTINCT S.name, COUNT(M.stadium)
FROM "Stadium" S
LEFT JOIN "Match" M
ON (
	S.name = M.stadium
	AND M.time >= '6:00'
	AND M.time < '12:00'
)
GROUP BY S.name;
