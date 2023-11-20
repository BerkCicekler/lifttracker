import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// widget for getting string data from user
/// [title] title of the alert box
/// return type will be String or null
class TextInputDialog extends StatelessWidget {
  /// widget for getting string data from user
  /// [title] title of the alert box
  /// [okText] accept/ok text label for localization support
  /// [cancelText] cancel text label for localization support
  /// return type will be String or null
  TextInputDialog({
    required this.title,
    required this.okText,
    required this.cancelText,
    super.key,
  });

  /// title of the alert box
  final String title;

  final TextEditingController _controller = TextEditingController();

  /// accept text for localization support
  final String okText;

  /// cancel text for localization support
  final String cancelText;

  /// this function will show the TextInput automatic
  /// [context] BuildContext
  /// [title] title of the alert box
  /// [okText] accept/ok text label for localization support
  /// [cancelText] cancel text label for localization support
  /// return type will be String or null
  static Future<String?> show({
    required BuildContext context,
    required String title,
    required String okText,
    required String cancelText,
  }) async {
    return showDialog<String?>(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return TextInputDialog(
          title: title,
          okText: okText,
          cancelText: cancelText,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: CupertinoTextField(
        controller: _controller,
        decoration: BoxDecoration(
          color: const Color.fromARGB(50, 255, 255, 255),
          borderRadius: BorderRadius.circular(6),
        ),
        style: const TextStyle(color: Colors.white),
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(cancelText),
        ),
        CupertinoDialogAction(
          onPressed: () {
            Navigator.pop(context, _controller.text);
          },
          child: Text(okText),
        ),
      ],
    );
  }
}
