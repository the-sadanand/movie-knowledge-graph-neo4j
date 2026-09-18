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

