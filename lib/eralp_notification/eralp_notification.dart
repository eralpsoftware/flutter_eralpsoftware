import 'package:eralpsoftware/eralp_notification/eralp_notification_widget.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class ShowEralpNotification {
  final Widget child;
  final Duration duration;
  final bool showProgressIndicator;
  final Color progressBackgroundColor;
  final Color progressValueColor;

  ShowEralpNotification({
    @required this.child,
    this.duration,
    this.showProgressIndicator,
    this.progressBackgroundColor,
    this.progressValueColor,
  });
  void show(BuildContext context) async {
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = new OverlayEntry(
      builder: (ctx) {
        return EralpNotificationWidget(
          child: this.child,
          context: ctx,
          progressAnimationDuration: duration ?? Duration(seconds: 2),
          showProgressIndicator: this.showProgressIndicator,
          progressBackgroundColor: progressBackgroundColor,
          progressValueColor: progressValueColor,
        );
      },
    );

    overlayState.insert(overlayEntry);

    await new Future.delayed(duration ?? Duration(seconds: 2));

    overlayEntry.remove();
  }
}
