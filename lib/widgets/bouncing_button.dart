import 'package:flutter/material.dart';

class BouncingButton extends StatefulWidget {
  final Widget child;
  final void Function() onPressed;

  BouncingButton({@required this.child, @required this.onPressed});

  @override
  State<StatefulWidget> createState() => _BouncingButton();
}

class _BouncingButton extends State<BouncingButton>
    with TickerProviderStateMixin {
  double _scale;
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 10),
      lowerBound: 0.0,
      upperBound: 0.1,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    return GestureDetector(
      onTapDown: _onTap,
      onTapCancel: _onTapCancel,
      onDoubleTap: _onDoubleTap,
      child: Transform.scale(
        scale: _scale,
        child: widget.child,
      ),
    );
  }

  void _onTap(_) async {
    await _controller.forward();
    await _controller.reverse();
    widget.onPressed();
  }

  void _onTapCancel() {
    _controller.reverse();
  }

  void _onDoubleTap() async {
    await _controller.forward().then((_) => _controller.reverse());
    await _controller.forward().then((_) => _controller.reverse());
  }
}
