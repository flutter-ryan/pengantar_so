import 'package:flutter/material.dart';

class BuildTextField extends StatelessWidget {
  BuildTextField({Key key, this.title, this.icon, this.param, this.paddingIcon})
      : super(key: key);

  final String title, icon;
  final bool param;
  final EdgeInsets paddingIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 8.0,
          )
        ],
      ),
      child: TextFormField(
        obscureText: param,
        validator: (value) {
          if (value.isEmpty) {
            return 'Field is required';
          }
          return null;
        },
        style: TextStyle(fontSize: 18.0),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 0.0, color: Colors.white),
            borderRadius: BorderRadius.circular(9.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 0.0, color: Colors.white),
            borderRadius: BorderRadius.circular(9.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 0.0, color: Colors.red),
            borderRadius: BorderRadius.circular(9.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 0.0, color: Colors.red),
            borderRadius: BorderRadius.circular(9.0),
          ),
          hintText: title,
          prefixIcon: Padding(
            padding: paddingIcon,
            child: Image.asset(
              icon,
              scale: 1.2,
            ),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
