import 'package:flutter/material.dart';

class DefaultTextFormField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final bool obscureText;
  final IconData? prefixIconData;
  final Color? prefixIconColor; // Adiciona o parâmetro de cor do prefixIcon
  final IconButton? suffixIconButton;
  final Function(String)? onChanged;

  const DefaultTextFormField({
    Key? key,
    this.hintText,
    required this.labelText,
    this.controller,
    this.validator,
    this.keyboardType,
    this.obscureText = false,
    this.prefixIconData,
    this.prefixIconColor, // Inclui o parâmetro de cor do prefixIcon
    this.suffixIconButton,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: TextFormField(
        onChanged: onChanged,
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          prefixIcon: prefixIconData != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        prefixIconData,
                        color: prefixIconColor, // Define a cor do prefixIcon
                      ),
                      const SizedBox(width: 8.0),
                      const VerticalDivider(
                        color: Colors.blue,
                        width: 2,
                      ),
                    ],
                  ),
                )
              : null,
          suffixIcon: suffixIconButton,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
        ),
      ),
    );
  }
}
