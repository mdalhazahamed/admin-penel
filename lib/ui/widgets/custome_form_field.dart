import 'package:flutter/material.dart';

Widget customFormField(
  keyboardtype,
  controller,
  context,
  hinttext,
  validator, {
  bool obscureText = false,
  suffixIcon,
  prefixIcon,
  prefixStyle,
  readOnly = false,
}) {
  return Padding(
    padding: EdgeInsets.only(bottom: 10),
    child: Column(
      children: [
        TextFormField(
          keyboardType: keyboardtype,
          readOnly: readOnly,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
          controller: controller,
          obscureText: obscureText,
          textInputAction: TextInputAction.next,
          validator: validator,
          maxLines: 1,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(15, 15, 20, 15),
            suffixIcon: suffixIcon,
            prefix: prefixIcon,
            prefixStyle: prefixStyle,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.amber),
              borderRadius: BorderRadius.circular(6),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.amber),
            ),
            hintText: hinttext,
            hintStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    ),
  );
}
