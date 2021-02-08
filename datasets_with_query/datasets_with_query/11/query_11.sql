SELECT DISTINCT N1."group"
FROM "Nationality" N1
WHERE NOT EXISTS (
	SELECT DISTINCT N2.continent
	FROM "Nationality" N2
	WHERE continent <> ALL (
		SELECT DISTINCT N3.continent
		FROM "Nationality" N3
		WHERE N3.group = N1.group
	)
);