// Safely delete the "To Be Deleted" movie and all its relationships
MATCH (m:Movie {title: "To Be Deleted"})
DETACH DELETE m;
