import 'package:flutter/material.dart';

class EralpNotificationWidget extends StatefulWidget {
  final BuildContext context;
  final Widget child;
  final Duration progressAnimationDuration;
  final bool showProgressIndicator;
  final Color progressBackgroundColor;
  final Color progressValueColor;
  EralpNotificationWidget({
    Key key,
    @required this.child,
    @required this.context,
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
  AnimationController controller;
  Animation animation;
  @override
  void initState() {
    super.initState();
    if (widget.progressAnimationDuration != null) {
      _startAnimation(widget.progressAnimationDuration);
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _mq = MediaQuery.of(context);
    return Positioned(
      top: _mq.padding.top * 2 + kToolbarHeight,
      left: 0,
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: _mq.size.width,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                widget.showProgressIndicator
                    ? Container(
                        width: _mq.size.width,
                        child: LinearProgressIndicator(
                          value: animation.value,
                          valueColor: AlwaysStoppedAnimation<Color>(
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
    );
  }

  void _startAnimation(Duration duration) {
    controller = AnimationController(duration: duration, vsync: this);
    animation = Tween<double>(begin: 0, end: 1).animate(controller)
      ..addListener(() {
        setState(() {});
      });

    controller.forward();
  }
}
