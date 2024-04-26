import 'package:flutter/material.dart';

class LinkLabel extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? textColor;
  final double? fontSize;

  const LinkLabel({
    Key? key,
    required this.text,
    this.onPressed,
    this.textColor,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        text,
        style: TextStyle(
          decoration: TextDecoration.underline,
          color: onPressed != null
              ? (textColor ?? const Color.fromARGB(255, 33, 222, 243))
              : (textColor ?? const Color.fromARGB(255, 33, 222, 243)),
          fontSize: fontSize ?? 13, // Tamanho da fonte
          letterSpacing: 0.5, // Espaçamento entre as letras
          decorationColor: textColor ??
              const Color.fromARGB(
                  255, 33, 222, 243), // Defina a cor do sublinhado
          shadows: onPressed != null
              ? [
                  Shadow(
                    color:
                        (textColor ?? const Color.fromARGB(255, 33, 222, 243))
                            .withOpacity(0.5),
                    blurRadius: 1,
                    offset: const Offset(0, 1),
                  ),
                ]
              : null, // Adiciona uma sombra sutil quando pressionado
        ),
      ),
    );
  }
}
