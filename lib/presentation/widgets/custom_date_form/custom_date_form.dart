
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

class CustomDateForm extends StatelessWidget {
  final String label;
  final DateTimeFieldPickerMode mode;
  final void Function(DateTime?)? onChanged;
  final String? Function(DateTime?)? validator;
  const CustomDateForm({
    super.key, 
    required this.label, 
    required this.mode, 
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return DateTimeFormField(
      mode: mode,
      lastDate: DateTime.now(),
      decoration:  InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5)
        ),
        label: Text(label),
        isDense: true
      ),
      onChanged: onChanged,
      validator: validator,
    );
  }
}