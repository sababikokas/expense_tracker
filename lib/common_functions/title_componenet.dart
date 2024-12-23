import 'package:flutter/material.dart';

class TitleCompomnent extends StatelessWidget {
  final String title;
  final TextStyle? style;
  final int? fontSize;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;

  const TitleCompomnent(
      {super.key,
      required this.title,
      this.style,
      this.fontSize,
      this.textOverflow,
      this.color,
      this.textAlign,
      this.fontWeight,
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign ?? TextAlign.start,
      overflow: textOverflow,
      maxLines: maxLines,
      style: Theme.of(context)
          .textTheme
          .displayLarge!
          .copyWith(
            fontSize: fontSize != null ? fontSize!.toDouble() : 24,
            color: color ?? const Color(0xff1A1A1A),
            fontWeight: fontWeight ?? FontWeight.w500,
          )
          .merge(style),
    );
  }
}
