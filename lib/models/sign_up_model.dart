class SignUpModel {
  String? name;
  String? email;
  String? phone;
  String? password;

  SignUpModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
  });

  SignUpModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['f_name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['password'] = this.password;
    return data;
  }
}
