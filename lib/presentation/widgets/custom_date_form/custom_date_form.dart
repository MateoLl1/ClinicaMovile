
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

class CustomDateForm extends StatelessWidget {
  final String label;
  final DateTimeFieldPickerMode mode;
  final void Function(DateTime?)? onChanged;
  const CustomDateForm({
    super.key, 
    required this.label, 
    required this.mode, 
    this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return DateTimeFormField(
      mode: mode,
      lastDate: DateTime.now(),
      decoration:  InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.zero
        ),
        label: Text(label),
        isDense: true
      ),
      onChanged: onChanged,
    );
  }
}