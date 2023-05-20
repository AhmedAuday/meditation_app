import 'package:ahmed_meditation_app/constatnts.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomWillPopScope extends StatelessWidget {
  CustomWillPopScope(
      {super.key,
      required this.onPressed,
      required this.onPressedNo,
      required this.child,
      this.content,
      this.title});

  Widget child;
  Text? title;
  Text? content;
  Function() onPressed;
  Function() onPressedNo;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: child,
      onWillPop: () async {
        return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: kPink,
            titleTextStyle: kHeadline,
            contentTextStyle: kParaghraph,
            title: title,
            content: content,
            actions: [
              TextButton(
                onPressed: onPressedNo,
                child: const Text(
                  'No',
                  style: kParaghraph,
                ),
              ),
              TextButton(
                onPressed: onPressed,
                child: const Text(
                  'Yes',
                  style: kParaghraph,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
