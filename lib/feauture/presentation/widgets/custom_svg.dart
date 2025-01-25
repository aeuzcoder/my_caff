import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSvg extends StatelessWidget {
  final String iconSvg;
  final double? size;
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit fit;

  const CustomSvg({
    super.key,
    required this.iconSvg,
    this.size,
    this.height,
    this.width,
    this.color,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      iconSvg,
      height: size ?? height,
      width: size ?? width,
      fit: fit,
      colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
    );
  }
}
