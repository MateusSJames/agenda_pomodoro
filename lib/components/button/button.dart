import 'package:agenda/components/box/index.dart';
import 'package:agenda/comum/styles/consts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class Button extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final double titleFontSize;
  final double margin;
  final double width;
  final double height;
  final double borderRadius;
  final double borderWidth;
  final bool loading;
  final bool disabled;

  const Button({
    Key? key,
    required this.onPressed,
    required this.title,
    this.titleFontSize = 2.4,
    this.margin = 3,
    this.width = 90,
    this.height = 6.5,
    this.borderRadius = 2,
    this.borderWidth = 0.1,
    this.loading = false,
    this.disabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      activeOpacity: 0.4,
      child: Box(
        margin: EdgeInsets.symmetric(vertical: margin.vmax),
        padding: EdgeInsets.zero,
        height: height.vmax,
        width: width.w,
        child: OutlinedButton(
          onPressed: disabled == true ? null : onPressed,
          child: loading
              ? Box(
                  height: 5.vmax,
                  width: 5.vmax,
                  padding: EdgeInsets.zero,
                  child: CircularProgressIndicator(
                    color: const Color(0xFFF84F6B),
                    strokeWidth: 0.15.vmax,
                  ),
                )
              : Text(
                  title,
                  style: GoogleFonts.getFont(
                    'Montserrat',
                    textStyle: TextStyle(
                      color: colorAppBar,
                      fontSize: titleFontSize.vmax,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(borderRadius.vmax)),
            ),
            side: BorderSide(
              color: colorAppBar!,
              width: borderWidth.vmax,
            ),
          ),
        ),
      ),
    );
  }
}
