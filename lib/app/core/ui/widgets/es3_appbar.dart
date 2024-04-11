import 'package:flutter/material.dart';

class ES3AppBar extends AppBar {
  ES3AppBar({ super.key, double elevation = 1 }) : super(
    elevation: elevation,
    title: Image.asset('assets/images/logo.png', width: 80)
  );
}