
import 'package:flutter/material.dart';

void showToast(context, {required String text}) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: SelectableText(
        text,
        textAlign: TextAlign.center,
      ),
    ),
  );
}