import 'package:flutter/material.dart';

class CustomSnackbar {
  CustomSnackbar._();

  static void show(BuildContext context, String message,
      {Color? backgroundColor, required IconData icon, Color? iconColor}) {
    backgroundColor ??= Colors.black.withOpacity(0.8);
    final snackBar = SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon, color: iconColor),
          const SizedBox(
              width:
                  8.0), // Adiciona um pequeno espaço entre o ícone e a mensagem
          Expanded(child: Text(message)),
        ],
      ),
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void alert(BuildContext context, String message,
      {Color? backgroundColor}) {
    backgroundColor ??= Colors.black.withOpacity(0.7);
    show(context, message,
        backgroundColor: backgroundColor,
        icon: Icons.error,
        iconColor: Colors.red);
  }

  static void info(BuildContext context, String message,
      {Color? backgroundColor}) {
    backgroundColor ??= Colors.black.withOpacity(0.8);
    show(context, message,
        backgroundColor: backgroundColor,
        icon: Icons.info,
        iconColor: Colors.blue);
  }

  static void success(BuildContext context, String message,
      {Color? backgroundColor}) {
    backgroundColor ??= Colors.black.withOpacity(0.8);
    show(context, message,
        backgroundColor: backgroundColor,
        icon: Icons.check_circle,
        iconColor: Colors.green);
  }

  static void warning(BuildContext context, String message,
      {Color? backgroundColor}) {
    backgroundColor ??= Colors.black.withOpacity(0.8);
    show(context, message,
        backgroundColor: backgroundColor,
        icon: Icons.warning,
        iconColor: Colors.yellow);
  }
}
