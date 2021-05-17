import 'dart:io';

import 'package:flutter/material.dart';

class Anexo extends StatelessWidget {
  final File arquivo;

  Anexo({Key key, this.arquivo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Image.file(
          arquivo,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
