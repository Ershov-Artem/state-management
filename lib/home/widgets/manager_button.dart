import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ManagerButton extends StatelessWidget {
  const ManagerButton(
      {super.key, required this.title, required this.onPressed});

  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.fromBorderSide(
            BorderSide(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        child: Text(title),
      ),
    );
  }
}
