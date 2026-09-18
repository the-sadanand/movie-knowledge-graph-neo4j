// Find all co-actors of Hugo Weaving in The Matrix (excluding Hugo himself)
MATCH (hugo:Person {name: "Hugo Weaving"})-[:ACTED_IN]->(m:Movie {title: "The Matrix"})<-[:ACTED_IN]-(coActor:Person)
WHERE coActor.name <> "Hugo Weaving"
RETURN coActor.name AS name;
