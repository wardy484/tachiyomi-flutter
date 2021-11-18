// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

const HEADER_TRIGGER_DISTANCE = 120.0;
const FOOTER_TRIGGER_DISTANCE = -100.0;

class RefreshConfig extends StatelessWidget {
  final Widget child;

  const RefreshConfig({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration(
      dragSpeedRatio: 0.5,
      headerTriggerDistance: HEADER_TRIGGER_DISTANCE,
      footerTriggerDistance: FOOTER_TRIGGER_DISTANCE,
      bottomHitBoundary: 10,
      enableBallisticRefresh: false,
      enableBallisticLoad: false,
      child: child,
    );
  }
}
