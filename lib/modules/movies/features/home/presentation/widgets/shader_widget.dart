import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../../../core/resources/colors_manager.dart';
import '../../../../../../core/resources/values_manager.dart';

class ShaderWidget extends StatelessWidget {
  final Widget child;
  const ShaderWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
          shaderCallback: (rect) => const LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [
              ColorsManager.tffBackground,
              Colors.transparent,
              Colors.transparent,
              ColorsManager.tffBackground,
            ],
            stops: [
              DoubleManager.d_0,
              DoubleManager.d_03,
              DoubleManager.d_05,
              DoubleManager.d_1,
            ],
          ).createShader(
            Rect.fromLTRB(
              rect.right,
              rect.left,
              DoubleManager.d_0,
              DoubleManager.d_0,
            ),
          ),
          blendMode: BlendMode.overlay,
          child: child,
          );
  }
}