import 'package:flutter/material.dart';

class FullPageLoadingIndicator extends StatelessWidget {
  const FullPageLoadingIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(
          child: const CircularProgressIndicator(),
        ),
        const SizedBox(height: 21),
        const Center(
          child: Text("Loading"),
        ),
      ],
    );
  }
}
