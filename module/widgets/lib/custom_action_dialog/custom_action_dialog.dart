import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Custom action dialog widget and manager
class CustomActionDialog extends StatelessWidget {
  /// its a custom action dialog for getting user's choice
  /// the return type will be bool or null
  const CustomActionDialog({
    required this.title,
    required this.contextText,
    super.key,
  });

  /// this function will show the custom action dialog automatic
  /// use for get choice of the user
  /// [context] BuildContext
  /// [title] title of the alert box
  /// [contextText] title of the alert box
  /// return type will be bool or null
  static Future<bool?> show({
    required BuildContext context,
    required String title,
    required String contextText,
  }) async {
    return showDialog<bool?>(
      context: context,
      builder: (_) {
        return CustomActionDialog(
          title: title,
          contextText: contextText,
        );
      },
    );
  }

  /// title string will show up in the title text
  final String title;

  /// context string will show up in the context text
  final String contextText;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(contextText),
      actions: [
        CupertinoDialogAction(
          onPressed: () {
            Navigator.pop(context, false);
          },
          child: const Text('Cancel'),
        ),
        CupertinoDialogAction(
          onPressed: () {
            Navigator.pop(context, true);
          },
          child: const Text('Ok'),
        ),
      ],
    );
  }
}
