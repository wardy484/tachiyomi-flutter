import 'dart:math';

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RefreshIconButton extends HookConsumerWidget {
  final Future<void> Function() onPressed;
  final String alertMessage;

  const RefreshIconButton({
    Key? key,
    required this.onPressed,
    required this.alertMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final controller = useAnimationController(
      lowerBound: 0.0,
      upperBound: 1.0,
      duration: const Duration(seconds: 2),
    ); // start the animation

    return AnimatedBuilder(
      animation: controller,
      child: IconButton(
        onPressed: () async {
          CoolAlert.show(
            context: context,
            type: CoolAlertType.loading,
            text: alertMessage,
          );
          await onPressed();
          Navigator.pop(context);
        },
        icon: const Icon(Icons.refresh),
      ),
      builder: (context, child) {
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationZ(2 * pi * controller.value),
          child: child,
        );
      },
    );
  }
}
