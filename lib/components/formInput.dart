import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  double inputHeight, inputWidth;
  Function validator;
  double marginRight = 0;
  bool hideInputValue = false;
  Icon icon;
  var prefixIcon,
      placeHolderStyle,
      placeHolder = '',
      margin = {},
      controller,
      contentPadding;
  FormInput(
      {this.controller,
      this.validator,
      this.placeHolder,
      this.icon,
      this.inputHeight,
      this.inputWidth,
      this.marginRight,
      this.hideInputValue,
      this.prefixIcon,
      this.placeHolderStyle,
      this.contentPadding});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.brown[200],
        borderRadius: BorderRadius.circular(8.0),
      ),
      width: inputWidth,
      height: inputHeight,
      margin: EdgeInsets.only(right: marginRight),
      child: TextFormField(
        obscureText: hideInputValue,
        controller: controller,
        decoration: new InputDecoration(
          hintText: placeHolder,
          hintStyle: placeHolderStyle,
          contentPadding: contentPadding,
          prefixIcon: icon,
        ),
        validator: validator,
      ),
    );
  }
}
