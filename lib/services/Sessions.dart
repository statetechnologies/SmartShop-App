class Session {
  final String username;
  final String password;
  final accessKey;
  final refreshkey;

  Session(
      {required this.username,
      required this.password,
      required this.accessKey,
      required this.refreshkey});
}
