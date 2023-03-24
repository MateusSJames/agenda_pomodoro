import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Box extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final Decoration? decoration;
  final Color? color;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final Widget? child;

  const Box({
    Key? key,
    required this.child,
    this.padding,
    this.decoration,
    this.color,
    this.width,
    this.height,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: padding ?? EdgeInsets.all(15.px),
        decoration: decoration,
        color: decoration == null ? color : null,
        width: width,
        height: height,
        margin: margin ?? EdgeInsets.zero,
        constraints: const BoxConstraints(
          maxHeight: double.infinity,
          maxWidth: double.maxFinite,
        ),
        child: child,
      ),
    );
  }
}
