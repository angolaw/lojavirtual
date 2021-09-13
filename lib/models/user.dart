class User {
  final String email;
  final String password;
  String? name;
  User(this.email, this.password, this.name);
  User.login({required this.email, required this.password});

  User.withInfo(
      {required this.email, required this.password, required this.name});
}
