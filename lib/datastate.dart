sealed class Datastate {}

class Success extends Datastate {
  final String name;

  Success({required this.name});
}

class Error extends Datastate {
  final String error;

  Error({required this.error});
}

class Initial extends Datastate {}

class Loading extends Datastate {}
