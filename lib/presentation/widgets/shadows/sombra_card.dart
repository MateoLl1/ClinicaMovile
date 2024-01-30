import 'package:flutter/material.dart';

class SombraCard extends StatelessWidget {
  final double width;
  final double height;
  const SombraCard({super.key, required this.width,required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: const DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.black45
        )
      ),
    );
  }
}