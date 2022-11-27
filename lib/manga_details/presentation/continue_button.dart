import 'package:flutter/material.dart';

class ContinueButton extends StatelessWidget {
  final String mangaId;

  const ContinueButton({
    Key? key,
    required this.mangaId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton.icon(
        onPressed: () async {
          // TODO: Implment continue reading manga button
        },
        label: const Text("Continue"),
        icon: const Icon(Icons.play_arrow),
      ),
    );
  }
}
