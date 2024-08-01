import 'dart:async';

import 'package:baca_buku_app1/common/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Common TextField //
class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.text,
      required this.icon,
      required this.controller});

  String text;
  IconData icon;
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: CustomColor.first,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 17),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(13)),
          borderSide: BorderSide(color: CustomColor.first, width: 3),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(13)),
            borderSide: BorderSide(color: CustomColor.first, width: 2)),
        label: Text(
          text,
          style: TextStyle(
            color: CustomColor.first,
          ),
        ),
        prefixIcon: Icon(icon, color: CustomColor.first),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter the right format";
        }
        return null;
      },
      controller: controller,
    );
  }
}

// Password TextField //
class CustomPasswordTextField extends StatefulWidget {
  final String text;
  final TextEditingController controller;

  const CustomPasswordTextField(
      {super.key, required this.text, required this.controller});

  @override
  State<CustomPasswordTextField> createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: CustomColor.first,
      obscureText: passwordVisible,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 17),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(13)),
            borderSide: BorderSide(color: CustomColor.first, width: 3),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(13)),
              borderSide: BorderSide(color: CustomColor.first, width: 2)),
          label: Text(
            widget.text,
            style: TextStyle(
              color: CustomColor.first,
            ),
          ),
          prefixIcon: const Icon(Icons.lock_outlined),
          prefixIconColor: CustomColor.first,
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                passwordVisible = !passwordVisible;
              });
            },
            icon:
                Icon(passwordVisible ? Icons.visibility : Icons.visibility_off),
          ),
          suffixIconColor: CustomColor.first),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter the right format";
        }
        return null;
      },
      controller: widget.controller,
    );
  }
}
