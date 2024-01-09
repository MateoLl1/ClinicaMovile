import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {
  final String label;
  final void Function()? onPressed;
  const CustomFilledButton({
    super.key, 
    required this.label, 
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return FilledButton(
      style: FilledButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)
          )
        )
      ),
      onPressed: onPressed,
      child: Text(label,style: textStyle.bodySmall),
    );
  }
}