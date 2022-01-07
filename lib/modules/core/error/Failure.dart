class Failure implements Exception {
  Failure.log(e, StackTrace s) {
    print("""
      #finfacil - ${DateTime.now()} 
      ${e.toString()} 
      StackTrace: ${s.toString()}
      #finfacil
    """);
  }
}
