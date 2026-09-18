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
