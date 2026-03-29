import 'package:flutter/material.dart';

Future<void> showNetworkErrorDialog(BuildContext context) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      title: const Text('通信エラー'),
      content: const Text('通信に失敗しました。\nログイン画面に戻ります。'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('OK'),
        ),
      ],
    ),
  );
}
