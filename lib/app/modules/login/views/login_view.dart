import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teste_dev_flutter/app/data/appData.dart';
import 'package:teste_dev_flutter/app/data/global/components/customTextField.dart';
import 'package:teste_dev_flutter/app/data/global/constants.dart';
import 'package:teste_dev_flutter/app/routes/app_pages.dart';
import 'package:validatorless/validatorless.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formkey,
      child: Scaffold(
          backgroundColor: appForegroundColor,
          body: SingleChildScrollView(
            child: SizedBox(
              height: Get.size.height,
              child: Column(
                children: [
                  // App logotipo

                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SizedBox(
                            width: Get.size.width / 2,
                            child: Image.asset("assets/compras-online.png")),
                      ),
                      Text(
                        "Dev Market",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )),

                  // Login formulario
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 40),
                    decoration: const BoxDecoration(
                        color: appBackgroundColor,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(46))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomTextField(
                          validator: Validatorless.multiple([
                            Validatorless.required("E-mail Obrigatório"),
                            Validatorless.email("E-mail Inválido"),
                          ]),
                          customTextController: controller.emailController,
                          icon: Icon(Icons.email),
                          label: Text("Email"),
                        ),
                        CustomTextField(
                          validator:
                              Validatorless.required("Senha obrigatória"),
                          customTextController: controller.passwordController,
                          icon: Icon(Icons.lock),
                          label: Text("Senha"),
                          isObscure: true,
                        ),

                        //     BOTAO  ENTRAR
                        SizedBox(
                            height: 50,
                            width: 120,
                            child: ElevatedButton(
                              onPressed: () {
                                //Get.offAllNamed(Routes.HOME);
                                if (controller.formkey.currentState!
                                    .validate()) {
                                  controller.login();
                                }
                              },
                              child: Text(
                                "Entrar",
                                style: TextStyle(fontSize: 18),
                              ),
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18))),
                            )),
                        //ESQUECEU A SENHA
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Esqueceu a senha?",
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ),
                        //         DIVIDER
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  color: Colors.grey.withAlpha(90),
                                  thickness: 2,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: Text("Ou"),
                              ),
                              Expanded(
                                child: Divider(
                                  color: Colors.grey.withAlpha(90),
                                  thickness: 2,
                                ),
                              ),
                            ],
                          ),
                        ),

                        //    BOTAO CRIAR CONTA

                        SizedBox(
                          height: 50,
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18)),
                                  side:
                                      BorderSide(width: 2, color: Colors.blue)),
                              onPressed: () {
                                //optei neste projeto por utilizar o sistema de gerenciamento de rotas do GETX ao inves do nativo Navigator.of(context).push...
                                //por entender que esse é melhor compativel com o GETX PAttern em termos de organização

                                Get.toNamed(Routes.SING_UP);
                              },
                              child: Text(
                                "Criar conta",
                                style: TextStyle(fontSize: 18),
                              )),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
