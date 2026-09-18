// Find all movies that Keanu Reeves has acted in
MATCH (p:Person {name: "Keanu Reeves"})-[:ACTED_IN]->(m:Movie)
RETURN m.title AS title;
