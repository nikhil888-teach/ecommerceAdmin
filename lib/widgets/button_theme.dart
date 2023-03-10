import 'package:flutter/material.dart';

// ignore: camel_case_types
class Button_Style {
  // ignore: non_constant_identifier_names
  static Container button_Theme(String name) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(25)),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Center(
          child: Text(
            name,
            style: const TextStyle(
                fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
