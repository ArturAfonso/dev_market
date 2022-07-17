/* class UserModel {
  String name;
  String email;
  String phone;
  String cpf;
  String password;
  UserModel(
      {required this.name,
      required this.email,
      required this.phone,
      required this.cpf,
      required this.password});
} */

class UserModel {
  String? name;
  String? cpf;
  String? email;
  String? password;
  String? phone;

  UserModel({
    this.name,
    this.cpf,
    this.email,
    this.password,
    this.phone,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['nome'];
    cpf = json['cpfcnpj'];
    email = json['email'];
    password = json['senha'];
    phone = json['celular'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['nome'] = name;
    data['cpfcnpj'] = cpf;
    data['email'] = email;
    data['senha'] = password;
    data['celular'] = phone;

    return data;
  }
}
