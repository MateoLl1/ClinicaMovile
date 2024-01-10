

import 'package:flutter/material.dart';


class CustomTextFormField extends StatefulWidget {
  final String label;
  final String? hintText;
  final IconData icon;
  final bool obscureText;
  final bool keyboardTypeNumber;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  const CustomTextFormField({
    super.key, 
    required this.label, 
    required this.icon, 
    this.hintText, 
    this.keyboardTypeNumber = false, 
    this.obscureText = false, 
    this.validator,
    this.onChanged
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}
bool textView = true;

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20)
  );

  final _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardTypeNumber 
        ? TextInputType.number 
        : TextInputType.emailAddress,
      focusNode: _focusNode,
      decoration: InputDecoration(
        border: border,
        isDense: true,
        label: Text(widget.label),
        hintText: widget.hintText,
        prefixIcon: Icon(widget.icon),
        suffixIcon: widget.obscureText 
          ? IconButton(
          icon: textView 
            ? const Icon(Icons.visibility_off)
            : const Icon(Icons.visibility),
          onPressed: () {
          textView = !textView;
            setState(() {
              
            });
          }, 
        ) : null
      ), 
      obscureText: widget.obscureText ? textView : false,

      onTapOutside: (event) {
        _focusNode.unfocus();
      },
      validator: widget.validator,
      onChanged: widget.onChanged
    );
  }
}