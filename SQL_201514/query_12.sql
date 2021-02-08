SELECT DISTINCT "stadium", "date", "time"
FROM "Match"
WHERE ("date", "time") = (
	SELECT DISTINCT "date", "time"
	FROM "Match"
	ORDER BY "date" DESC, "time" DESC
	OFFSET 1
	LIMIT 1
);