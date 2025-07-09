import 'package:flutter/material.dart';

class WpggLogo extends StatelessWidget {
  final double? width;
  final double? height;
  const WpggLogo({super.key, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final asset = isDark ? 'WPGG_blackmode_500_200.png' : 'WPGG_w_500_200.png';
    return Image.asset(asset, width: width, height: height);
  }
}
