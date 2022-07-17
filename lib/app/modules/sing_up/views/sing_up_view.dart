import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:teste_dev_flutter/app/data/global/components/customTextField.dart';
import 'package:teste_dev_flutter/app/data/global/constants.dart';
import 'package:validatorless/validatorless.dart';

import '../controllers/sing_up_controller.dart';

class SingUpView extends GetView<SingUpController> {
  final cpfFormatter = MaskTextInputFormatter(
      mask: '###.###.###-##', filter: {'#': RegExp(r'[0-9]')});
  final phoneFormatter = MaskTextInputFormatter(
      mask: '## # ####-####', filter: {'#': RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formkey,
      child: Scaffold(
          backgroundColor: appForegroundColor,
          body: SingleChildScrollView(
            child: SizedBox(
              height: Get.size.height,
              child: Stack(
                children: [
                  Column(
                    children: [
                      //Titulo da pagina
                      Expanded(
                        child: Center(
                          child: Text(
                            "Cadastro",
                            style:
                                TextStyle(color: Colors.black54, fontSize: 35),
                          ),
                        ),
                      ),

                      //Formulario
                      Container(
                        decoration: const BoxDecoration(
                          color: appBackgroundColor,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(46)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              CustomTextField(
                                  validator: Validatorless.multiple([
                                    Validatorless.required("Email obrigatorio"),
                                    Validatorless.email(
                                        "Formato de email invalido")
                                  ]),
                                  customTextController:
                                      controller.emailController,
                                  icon: Icon(Icons.email),
                                  label: Text("Email")),
                              CustomTextField(
                                validator:
                                    Validatorless.required("Senha obrigatoria"),
                                customTextController:
                                    controller.passwordController,
                                icon: Icon(Icons.lock),
                                label: Text("Senha"),
                                isObscure: true,
                              ),
                              CustomTextField(
                                  validator: Validatorless.required(
                                      "Nome obrigatorio"),
                                  customTextController:
                                      controller.nameController,
                                  icon: Icon(Icons.person),
                                  label: Text("Nome")),
                              CustomTextField(
                                  validator: Validatorless.required(
                                      "Telefone obrigatorio"),
                                  customTextController:
                                      controller.phoneController,
                                  inputType: TextInputType.number,
                                  inputFormatters: [phoneFormatter],
                                  icon: Icon(Icons.phone),
                                  label: Text("Telefone")),
                              CustomTextField(
                                  validator: Validatorless.multiple([
                                    Validatorless.required("Cpf obrigatorio"),
                                  ]),
                                  customTextController:
                                      controller.cpfController,
                                  inputType: TextInputType.number,
                                  inputFormatters: [cpfFormatter],
                                  icon: Icon(Icons.file_copy),
                                  label: Text("CPF")),
                              SizedBox(
                                height: 50,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18))),
                                  onPressed: () {
                                    if (controller.formkey.currentState!
                                        .validate()) {
                                      controller.cadastrarUsuario(
                                        controller.emailController.text,
                                        controller.passwordController.text,
                                        controller.nameController.text,
                                        controller.phoneController.text,
                                        controller.cpfController.text,
                                      );
                                    }
                                  },
                                  child: Text("Cadastrar",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18)),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Positioned(
                    left: 10,
                    top: 10,
                    child: SafeArea(
                        child: IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: Colors.black54,
                            ))),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
