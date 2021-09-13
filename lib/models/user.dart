class User {
  final String email;
  final String password;
  User(this.email, this.password);

  User.withInfo({required this.email, required this.password});
}
