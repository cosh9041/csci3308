SELECT name, statecode FROM states;
SELECT * FROM counties WHERE name LIKE 'Prince%' ORDER BY statecode;
SELECT population_2010 FROM states st, senators se WHERE se.name='Richard Lugar' AND st.statecode=se.statecode;
SELECT COUNT(c.name) FROM counties c, states s WHERE s.name='Maryland' AND s.statecode=c.statecode;
SELECT name FROM states ORDER BY admitted_to_union DESC LIMIT 1;
SELECT name FROM senators WHERE affiliation='D' AND name NOT IN (SELECT chairman FROM committees) ORDER BY name;
