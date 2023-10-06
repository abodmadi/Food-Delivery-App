class SignInModel {
  final String phone;
  final String password;

  SignInModel({
    required this.phone,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['phone'] = this.phone;
    data['password'] = this.password;
    return data;
  }
}
