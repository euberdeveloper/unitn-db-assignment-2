SELECT DISTINCT continent, COALESCE(MAX(capacity), 0), ROUND(COALESCE(AVG(capacity), 0), 2)
FROM "Nationality" N
LEFT JOIN "Stadium" S
ON N.country = S.country
GROUP BY continent;

