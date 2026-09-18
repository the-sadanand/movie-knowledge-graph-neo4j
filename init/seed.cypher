// Seed Script - Movie knowledge graph

// 1 . Uniqueness Constraints

CREATE CONSTRAINT movie_title_unique IF NOT EXISTS FOR (m:Movie) REQUIRE m.title IS UNIQUE ;

CREATE CONSTRAINT preson_name_unique IF NOT EXISTS FOR(p:Person) REQUIRE p.name IS UNIQUE;

CREATE CONSTRAINT genre_name_unique IF NOT EXISTS FOR (g:Genre) REQUIRE g.name IS UNIQUE;

//  2 . Genre Nodes 

MERGE (:Genre {name : "Sci-Fi"});
MERGE (:Genre {name : "Action" });
MERGE (:Genre {name : "Thriller"});
MERGE (:Genre {name : "Drama"});

//  3 . the Matrix

MERGE (matrix : Movie {title: "The Matrix"})
    ON CREATE SET matrix.released = 199,
                  matrix.tagline = "Welcome To The Real World";
MERGE (keanu:Person{name:"Keanu Reevs"});
    ON CREATE SET keanu.born = 1964;

MERGE (carrie:Person{name:"carrie-ann moss"});
    ON CREATE SET carrie.born = 1967;

MERGE (laurence:Person {name: "Laurence Fishburne"})
  ON CREATE SET laurence.born = 1961;
MERGE (hugo:Person {name: "Hugo Weaving"})
  ON CREATE SET hugo.born = 1960;
MERGE (lana:Person {name: "Lana Wachowski"})
  ON CREATE SET lana.born = 1965;
MERGE (lilly:Person {name: "Lilly Wachowski"})
  ON CREATE SET lilly.born = 1967;
MERGE (joel:Person {name: "Joel Silver"})
  ON CREATE SET joel.born = 1952;


// Relationships for The Matrix
MATCH (matrix:Movie {title: "The Matrix"}), (g:Genre {name: "Sci-Fi"})
MERGE (matrix)-[:HAS_GENRE]->(g);
MATCH (matrix:Movie {title: "The Matrix"}), (g:Genre {name: "Action"})
MERGE (matrix)-[:HAS_GENRE]->(g);
MATCH (keanu:Person {name: "Keanu Reeves"}), (matrix:Movie {title: "The Matrix"})
MERGE (keanu)-[:ACTED_IN {roles: ["Neo"]}]->(matrix);
MATCH (carrie:Person {name: "Carrie-Anne Moss"}), (matrix:Movie {title: "The Matrix"})
MERGE (carrie)-[:ACTED_IN {roles: ["Trinity"]}]->(matrix);
MATCH (laurence:Person {name: "Laurence Fishburne"}), (matrix:Movie {title: "The Matrix"})
MERGE (laurence)-[:ACTED_IN {roles: ["Morpheus"]}]->(matrix);
MATCH (hugo:Person {name: "Hugo Weaving"}), (matrix:Movie {title: "The Matrix"})
MERGE (hugo)-[:ACTED_IN {roles: ["Agent Smith"]}]->(matrix);
MATCH (lana:Person {name: "Lana Wachowski"}), (matrix:Movie {title: "The Matrix"})
MERGE (lana)-[:DIRECTED]->(matrix);
MATCH (lilly:Person {name: "Lilly Wachowski"}), (matrix:Movie {title: "The Matrix"})
MERGE (lilly)-[:DIRECTED]->(matrix);
MATCH (joel:Person {name: "Joel Silver"}), (matrix:Movie {title: "The Matrix"})
MERGE (joel)-[:PRODUCED]->(matrix);


// 4. John Wick (2014) 
MERGE (wick:Movie {title: "John Wick"})
  ON CREATE SET wick.released = 2014,
                wick.tagline  = "Don't set him off.";
MATCH (wick:Movie {title: "John Wick"}), (g:Genre {name: "Action"})
MERGE (wick)-[:HAS_GENRE]->(g);
MATCH (keanu:Person {name: "Keanu Reeves"}), (wick:Movie {title: "John Wick"})
MERGE (keanu)-[:ACTED_IN {roles: ["John Wick"]}]->(wick);