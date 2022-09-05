CREATE MIGRATION m1xhitebgtp7eny3w3vt5gouvsqyryat6jim525gud6ijyeqnypy6q
    ONTO initial
{
  CREATE ABSTRACT TYPE default::Person {
      CREATE REQUIRED PROPERTY name -> std::str {
          CREATE CONSTRAINT std::exclusive;
      };
  };
  CREATE TYPE default::Hero EXTENDING default::Person {
      CREATE PROPERTY secret_identity -> std::str;
  };
  CREATE TYPE default::Villain EXTENDING default::Person {
      CREATE LINK nemesis -> default::Hero;
  };
  ALTER TYPE default::Hero {
      CREATE MULTI LINK villains := (.<nemesis[IS default::Villain]);
  };
  CREATE TYPE default::Movie {
      CREATE MULTI LINK characters -> default::Person;
      CREATE REQUIRED PROPERTY release_year -> std::int64;
      CREATE REQUIRED PROPERTY title -> std::str {
          CREATE CONSTRAINT std::exclusive;
      };
  };
};
