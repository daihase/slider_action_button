library slider_action_button;

import 'dart:ui';

import 'package:flutter/material.dart';

class SliderActionButton extends StatefulWidget {
  final Color sliderColor;
  final Color sliderDoneColor;
  final Widget icon;
  final Color iconColor;
  final double height;
  final VoidCallback action;
  final Text? label;
  final EdgeInsetsGeometry margin;
  final double padding;
  final List<BoxShadow>? boxShadow;

  const SliderActionButton({
    Key? key,
    required this.sliderColor,
    required this.sliderDoneColor,
    required this.icon,
    required this.iconColor,
    required this.height,
    required this.action,
    this.label,
    this.margin = EdgeInsets.zero,
    this.padding = 4,
    this.boxShadow = const [
      BoxShadow(
        color: Colors.black26,
        spreadRadius: 1,
        blurRadius: 2,
        offset: Offset(0, 2),
      )
    ],
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => SliderActionButtonState();
}

class SliderActionButtonState extends State<SliderActionButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  Animation<double>? _animation;
  double slidingValue = 0.0;
  bool doneFlag = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 50),
    )
      ..addListener(() {
        setState(() {
          slidingValue = _animation?.value ?? 0;
        });
      })
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed && doneFlag) {
          widget.action();
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  reset() {
    setState(() {
      slidingValue = 0.0;
      doneFlag = false;
    });
  }

  _onDragStart(DragStartDetails details) {
    _controller.reset();
    slidingValue = 0.0;
  }

  _onDragUpdate(DragUpdateDetails details) {
    setState(
      () {
        slidingValue = details.globalPosition.dx / MediaQuery.of(context).size.width;
        if (slidingValue > 0.20) doneFlag = true;
      },
    );
  }

  _onDragEnd(DragEndDetails details) {
    if (slidingValue > 0.20 || doneFlag) {
      _animation = Tween<double>(begin: slidingValue, end: 1).animate(_controller);
    } else {
      _animation = Tween<double>(end: 0, begin: slidingValue).animate(_controller);
    }
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      width: MediaQuery.of(context).size.width - widget.margin.horizontal,
      child: Stack(
        clipBehavior: Clip.antiAlias,
        children: <Widget>[
          Container(
            height: widget.height,
            decoration: BoxDecoration(
              color: widget.sliderColor,
              borderRadius: BorderRadius.all(Radius.circular(widget.height)),
              boxShadow: widget.boxShadow,
            ),
          ),
          Opacity(
            opacity: lerpDouble(0, 1, slidingValue)!,
            child: Container(
              height: widget.height,
              decoration: BoxDecoration(
                color: widget.sliderDoneColor,
                borderRadius: BorderRadius.all(Radius.circular(widget.height)),
              ),
            ),
          ),
          SizedBox(
            height: widget.height,
            child: Center(
              child: widget.label,
            ),
          ),
          Positioned(
            left: lerpDouble(
              widget.padding,
              MediaQuery.of(context).size.width - widget.margin.horizontal - widget.height + widget.padding,
              slidingValue,
            ),
            child: AbsorbPointer(
              absorbing: doneFlag,
              child: GestureDetector(
                onHorizontalDragStart: _onDragStart,
                onHorizontalDragUpdate: _onDragUpdate,
                onHorizontalDragEnd: _onDragEnd,
                child: Opacity(
                  opacity: 1,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    height: widget.height,
                    width: widget.height - (widget.padding * 2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: widget.iconColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(9),
                      child: widget.icon,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
