module default {
  abstract type Person {
    required property name -> str { constraint exclusive };
  }

  type Hero extending Person {
    property secret_identity -> str;
    multi link villains := .<nemesis[is Villain];
  }

  type Villain extending Person {
    link nemesis -> Hero;
  }

  type Movie {
    required property title -> str { constraint exclusive };
    required property release_year -> int64;
    multi link characters -> Person;
  }
}