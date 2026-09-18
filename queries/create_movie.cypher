// Create "V for Vendetta" and connect it to existing people
MERGE (v:Movie {title: "V for Vendetta"})
  ON CREATE SET v.released = 2005,
                v.tagline  = "People should not be afraid of their governments.";

// Connect Hugo Weaving as an actor
MATCH (hugo:Person {name: "Hugo Weaving"}), (v:Movie {title: "V for Vendetta"})
MERGE (hugo)-[:ACTED_IN {roles: ["V"]}]->(v);

// Connect the Wachowskis as producers
MATCH (lana:Person {name: "Lana Wachowski"}), (v:Movie {title: "V for Vendetta"})
MERGE (lana)-[:PRODUCED]->(v);

MATCH (lilly:Person {name: "Lilly Wachowski"}), (v:Movie {title: "V for Vendetta"})
MERGE (lilly)-[:PRODUCED]->(v);

// Add genre
MATCH (v:Movie {title: "V for Vendetta"}), (g:Genre {name: "Action"})
MERGE (v)-[:HAS_GENRE]->(g);

MATCH (v:Movie {title: "V for Vendetta"}), (g:Genre {name: "Thriller"})
MERGE (v)-[:HAS_GENRE]->(g);
