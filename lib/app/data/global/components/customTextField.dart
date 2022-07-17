import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';

class CustomTextField extends StatelessWidget {
  final Widget icon;
  final Widget label;
  bool isObscure;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? inputType;
  final String? initialValue;
  bool readOnly;
  TextEditingController? customTextController = TextEditingController();
  String? Function(String?)? validator;

  CustomTextField(
      {super.key,
      required this.icon,
      required this.label,
      this.isObscure = false,
      this.inputFormatters,
      this.inputType,
      this.initialValue,
      this.readOnly = false,
      this.customTextController,
      this.validator});
  @override
  Widget build(BuildContext context) {
    RxBool obscureText = isObscure.obs;

    return Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Obx(
          () => TextFormField(
            validator: validator,
            controller: customTextController,
            readOnly: readOnly,
            initialValue: initialValue,
            keyboardType: inputType,
            inputFormatters: inputFormatters,
            obscureText: obscureText.value,
            decoration: InputDecoration(
                isDense: true,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
                prefixIcon: icon,
                suffixIcon: isObscure == true
                    ? IconButton(
                        onPressed: () {
                          obscureText.value = !obscureText.value;
                        },
                        icon: obscureText.value == true
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off))
                    : null,
                label: label),
          ),
        ));
  }
}
