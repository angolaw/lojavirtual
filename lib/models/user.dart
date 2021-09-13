class User {
  String email;
  String password;
  String? confirmPassword;
  String? name;
  User(this.email, this.password, [this.confirmPassword, this.name]);
}
