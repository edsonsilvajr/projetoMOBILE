import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String buttonLabel;
  final IconData buttonIcon;
  final Function callback;

  Button({this.buttonLabel, this.buttonIcon, this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      margin: EdgeInsets.only(top: 50),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: Color(0xFFB82121),
          primary: Colors.white,
        ),
        onPressed: callback,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(buttonIcon),
            SizedBox(
              width: 10,
            ),
            Text(buttonLabel),
          ],
        ),
      ),
    );
  }
}
