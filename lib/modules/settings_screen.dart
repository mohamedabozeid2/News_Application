// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Setting Screen",
        style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }

}