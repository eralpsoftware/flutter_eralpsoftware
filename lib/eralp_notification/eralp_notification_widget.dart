import 'package:flutter/material.dart';

class EralpNotificationWidget extends StatefulWidget {
  final BuildContext context;
  final Widget child;
  final Duration? progressAnimationDuration;
  final bool? showProgressIndicator;
  final Color? progressBackgroundColor;
  final Color? progressValueColor;
  EralpNotificationWidget({
    Key? key,
    required this.child,
    required this.context,
    this.progressAnimationDuration,
    this.showProgressIndicator,
    this.progressBackgroundColor = Colors.grey,
    this.progressValueColor = Colors.blue,
  }) : super(key: key);

  @override
  _EralpNotificationWidgetState createState() =>
      _EralpNotificationWidgetState();
}

class _EralpNotificationWidgetState extends State<EralpNotificationWidget>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  late AnimationController _opacityController;
  late Animation _opacityAnimation;
  double _opacityValue = 0;

  late AnimationController _scaleController;
  late Animation _scaleAnimation;
  double _scaleValue = 0;

  @override
  void initState() {
    super.initState();
    if (widget.progressAnimationDuration != null) {
      _startAnimation(widget.progressAnimationDuration);
      _startOpacityAnimation();
      _startScaleAnimation();
    }
  }

  @override
  void dispose() {
    _opacityController.dispose();
    _scaleController.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _mq = MediaQuery.of(context);
    return Positioned(
      top: _mq.padding.top,
      left: 0,
      child: Transform.scale(
        scale: _scaleValue,
        child: Opacity(
          opacity: _opacityValue,
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: _mq.size.width,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    widget.showProgressIndicator!
                        ? Container(
                            width: _mq.size.width,
                            child: LinearProgressIndicator(
                              value: animation.value,
                              valueColor: AlwaysStoppedAnimation<Color?>(
                                  widget.progressValueColor),
                              backgroundColor: widget.progressBackgroundColor,
                            ),
                          )
                        : Container(
                            height: 1,
                            width: 1,
                          ),
                    widget.child,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _startAnimation(Duration? duration) {
    controller = AnimationController(duration: duration, vsync: this);
    animation = Tween<double>(begin: 0, end: 1).animate(controller)
      ..addListener(() {
        setState(() {});
      });

    controller.forward();
  }

  void _startOpacityAnimation() {
    _opacityController = AnimationController(
        duration: Duration(
          milliseconds: widget.progressAnimationDuration!.inMilliseconds > 999
              ? 250
              : widget.progressAnimationDuration!.inMilliseconds / 4 as int,
        ),
        vsync: this);
    _opacityAnimation =
        Tween<double>(begin: 0, end: 1).animate(_opacityController)
          ..addListener(() {
            _opacityValue = _opacityAnimation.value;
            setState(() {});
          });
    _opacityController.forward();
  }

  void _startScaleAnimation() {
    _scaleController = AnimationController(
        duration: Duration(
          milliseconds: widget.progressAnimationDuration!.inMilliseconds > 999
              ? 250
              : widget.progressAnimationDuration!.inMilliseconds / 4 as int,
        ),
        vsync: this);
    _scaleAnimation = Tween<double>(begin: 0, end: 1).animate(_scaleController)
      ..addListener(() {
        _scaleValue = _scaleAnimation.value;
        setState(() {});
      });
    _scaleController.forward();
  }
}
