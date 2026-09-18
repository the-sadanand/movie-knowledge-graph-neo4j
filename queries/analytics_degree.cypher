// Find the top 5 most connected people (highest degree centrality)
MATCH (p:Person)
RETURN p.name AS name, COUNT{ (p)--() } AS degree
ORDER BY degree DESC
LIMIT 5;
