import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  final String textInput;
  final bool isPassword;

  Input({this.textInput, this.isPassword = false});

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  bool view = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: TextFormField(
        obscureText: view,
        keyboardType: TextInputType.visiblePassword,
        cursorColor: Colors.white,
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(Icons.remove_red_eye),
                  onPressed: () {
                    setState(() {
                      view = !view;
                    });
                  })
              : null,
          labelText: widget.textInput,
          fillColor: Colors.white,
          labelStyle: TextStyle(
            color: Colors.white,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(
              color: Colors.white,
              width: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}
