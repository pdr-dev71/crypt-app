import 'package:flutter/material.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final String? initialValue;
  final Color? fillcolor;
  final bool? enabled;
  final TextInputType? keyboardtype;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? hintText;
  final FloatingLabelBehavior? floatingLabelBehavior;

  const CustomTextFormFieldWidget({
    Key? key,
    required this.labelText,
    required this.controller,
    this.initialValue,
    this.fillcolor,
    this.keyboardtype,
    this.validator,
    this.autovalidateMode,
    this.suffixIcon,
    this.prefixIcon,
    this.hintText,
    this.enabled,
    this.floatingLabelBehavior,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      autovalidateMode: autovalidateMode,
      enabled: enabled,
      validator: validator,
      controller: controller,
      keyboardType: keyboardtype,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(color: Colors.black54),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(
            width: 1.75,
            color: Colors.black,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        fillColor: fillcolor,
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        labelText: labelText,
        border: InputBorder.none,
      ),
    );
  }
}
