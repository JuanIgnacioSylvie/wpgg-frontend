import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:wpgg/ui/common/widgets/wpgg_logo.dart';

class LoadingWidget extends StatefulWidget {
  final double progress;
  const LoadingWidget({super.key, required this.progress});

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..repeat(reverse: true);
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final progressColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.black;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ScaleTransition(
              scale: _scaleAnimation,
              child: const WpggLogo(width: 150),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 20,
              child: AnimatedTextKit(
                repeatForever: true,
                pause: const Duration(milliseconds: 300),
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Cargando... ',
                    speed: const Duration(milliseconds: 100),
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: 200,
              child: LinearProgressIndicator(
                value: widget.progress,
                color: progressColor,
                backgroundColor: progressColor.withOpacity(0.3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
