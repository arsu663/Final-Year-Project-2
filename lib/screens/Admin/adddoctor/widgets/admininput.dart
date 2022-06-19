import 'package:flutter/material.dart';

class AdminInput extends StatelessWidget {
  final TextEditingController adminInput;
  final String hintTitle;
  final TextInputType keyboardType;
  final bool password;

  const AdminInput(
      {Key key,
      this.hintTitle,
      this.keyboardType,
      this.adminInput,
      this.password})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          color: Colors.blueGrey.shade200,
          borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0, top: 15, right: 25),
        child: TextField(
          
          obscureText: password,
          controller: adminInput,
          autocorrect: false,
          enableSuggestions: false,
          autofocus: false,
          decoration: InputDecoration.collapsed(
            hintText: hintTitle,
            // hintStyle:
            //     Theme.of(context).textTheme.headline6?.copyWith(fontSize: 18),
          ),
          keyboardType: keyboardType,
        ),
      ),
    );
  }
}
