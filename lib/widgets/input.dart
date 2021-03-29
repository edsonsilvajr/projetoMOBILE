import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  final String textInput;
  final bool isPassword;
  final Function validationCallback;
  final Function onSave;

  Input(
      {this.textInput,
      this.isPassword = false,
      this.validationCallback,
      this.onSave});

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  bool view;
  @override
  void initState() {
    super.initState();
    this.view = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: TextFormField(
        maxLines: view ? 1 : null,
        onChanged: widget.onSave,
        autovalidateMode: widget.validationCallback != null
            ? AutovalidateMode.onUserInteraction
            : null,
        validator: widget.validationCallback != null
            ? widget.validationCallback
            : null,
        obscureText: view,
        keyboardType: TextInputType.visiblePassword,
        cursorColor: Colors.white,
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          //error styling
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(
              color: Colors.white,
              width: 2.3,
            ),
          ),
          errorStyle: TextStyle(
            color: Colors.red[200],
          ),
          //----------------------------------------------------------------
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(Icons.remove_red_eye),
                  color: view ? Colors.white24 : Colors.white,
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
              width: 2.3,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
