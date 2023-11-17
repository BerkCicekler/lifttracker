import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// widget for getting string data from user
/// [title] title of the alert box
/// return type will be String or null
class TextInputDialog extends StatelessWidget {
  /// widget for getting string data from user
  /// [title] title of the alert box
  /// return type will be String or null
  TextInputDialog({required this.title, super.key});

  /// title of the alert box
  final String title;

  final TextEditingController _controller = TextEditingController();

  /// this function will show the TextInput automatic
  /// [context] BuildContext
  /// [title] title of the alert box
  /// return type will be String or null
  static Future<String?> show({
    required BuildContext context,
    required String title,
  }) async {
    return showDialog<String?>(
      context: context,
      builder: (_) {
        return TextInputDialog(
          title: title,
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
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
        CupertinoDialogAction(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Ok'),
        ),
      ],
    );
  }
}
