import 'package:asuka/asuka.dart';

class Messages {
  Messages._();

  static void alert(String messages) {
    AsukaSnackbar.alert(messages).show();
  }

  static void info(String messages) {
    AsukaSnackbar.info(messages).show();
  }

  static void success(String messages) {
    AsukaSnackbar.success(messages).show();
  }

  static void warning(String messages) {
    AsukaSnackbar.warning(messages).show();
  }
}
