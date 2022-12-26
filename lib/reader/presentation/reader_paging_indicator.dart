import 'package:flutter/material.dart';

class ReaderPagingIndicator extends StatelessWidget {
  final String label;

  const ReaderPagingIndicator({
    Key? key,
    required this.controller,
    required this.label,
  }) : super(key: key);

  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(
          color: Colors.white,
          value: controller.value,
        ),
        const SizedBox(width: 14),
        SizedBox(
          width: 120,
          child: Text(label),
        ),
      ],
    );
  }
}
