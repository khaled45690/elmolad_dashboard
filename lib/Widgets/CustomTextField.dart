import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final Function onChangeFunction;
  final String? text, errorText;
  final bool? obscureText;
  final TextInputType? textInputType;
  final int? maxLines;
  const CustomTextField(this.text, this.errorText, this.onChangeFunction,
      {this.obscureText, this.textInputType, this.maxLines});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: TextField(
          maxLines: maxLines == null ? 1 : maxLines,
          keyboardType:
              textInputType == null ? TextInputType.text : textInputType,
          obscureText: obscureText == null ? false : obscureText!,
          onChanged: onChangeFunction as void Function(String)?,
          decoration: InputDecoration(
            labelText: text,
            errorText: errorText,
          ),
        ),
      ),
    );
  }
}
