import 'dart:html';

import 'package:fashio_app/widgets/dimension.dart';
import 'package:flutter/cupertino.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overflow;

  BigText({
    Key? key,
    required this.text,
    this.size = 0,
    this.overflow = TextOverflow.ellipsis,
    this.color = const Color(0xFF332d2b),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      style: TextStyle(
          fontFamily: 'Roboto',
          color: color,
          fontSize: size==0?Dimensions.font20:size,
          fontWeight: FontWeight.w400),
      overflow: overflow,
    );
  }
}
