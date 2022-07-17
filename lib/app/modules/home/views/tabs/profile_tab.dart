import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:teste_dev_flutter/app/data/global/components/customTextField.dart';
import 'package:teste_dev_flutter/app/data/global/constants.dart';
import 'package:teste_dev_flutter/app/data/appData.dart' as appData;
import 'package:teste_dev_flutter/app/data/models/user_model.dart';
import 'package:teste_dev_flutter/app/routes/app_pages.dart';
import 'package:teste_dev_flutter/main.dart' as initialpage;

class ProfileTab extends StatefulWidget {
  UserModel user = UserModel();
  ProfileTab({super.key, required this.user});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  final storageUser = GetStorage('user');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appForegroundColor,
        title: Text(
          "Perfil do Usuário",
          style: TextStyle(color: Colors.black54),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.offAllNamed(Routes.LOGIN);
              },
              icon: Icon(Icons.logout, color: Colors.black54))
        ],
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(16, 32, 16, 16),
        physics: BouncingScrollPhysics(),
        children: [
          //email
          CustomTextField(
              readOnly: true,
              initialValue: widget.user.email,
              icon: Icon(Icons.email),
              label: Text("Email")),
          //nome
          CustomTextField(
              readOnly: true,
              initialValue: widget.user.name,
              icon: Icon(Icons.person),
              label: Text("Nome")),
          //celular
          CustomTextField(
              readOnly: true,
              initialValue: widget.user.phone,
              icon: Icon(Icons.phone),
              label: Text("Celular")),
          //cpf
          CustomTextField(
            readOnly: true,
            initialValue: widget.user.cpf,
            icon: Icon(Icons.file_copy),
            label: Text("CPF"),
            isObscure: true,
          ),
          //botao para atualizar senha
          CustomTextField(
            readOnly: true,
            initialValue: widget.user.password,
            icon: Icon(Icons.lock),
            label: Text("Senha"),
            isObscure: true,
          ),
        ],
      ),
    );
  }
}
