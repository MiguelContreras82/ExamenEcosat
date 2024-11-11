import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class InputTextC {
  Widget customTextInput(String hint, TextEditingController controller,
      bool isPassword, InkWell? inkWell) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.white),
          suffixIcon: inkWell,
          enabledBorder: _border(),
          focusedBorder: _border()),
    );
  }

  OutlineInputBorder _border() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(18)),
        borderSide: const BorderSide(color: Colors.white));
  }
}
