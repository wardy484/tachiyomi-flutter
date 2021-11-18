import 'package:flutter/material.dart';

class HeaderDetail extends StatelessWidget {
  final String label;
  final String? value;

  const HeaderDetail({Key? key, required this.label, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 7),
        Text(
          value ?? "Unknown",
          overflow: TextOverflow.clip,
          maxLines: 1,
          softWrap: false,
        ),
      ],
    );
  }
}
