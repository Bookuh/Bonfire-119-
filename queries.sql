SELECT Count("Name")
FROM "Titanic" 
-- 887 rows returned


SELECT Count("Survived")
FROM "Titanic" 
WHERE "Survived" = 1
-- 342 passengers survived 


SELECT COUNT("Pclass")
FROM "Titanic"
GROUP BY "Pclass"
ORDER BY COUNT("Pclass")
--184
--216
--487
--3rd class is the most populous