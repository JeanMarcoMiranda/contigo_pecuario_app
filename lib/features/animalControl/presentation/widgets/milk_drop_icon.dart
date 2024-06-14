
import 'package:contigo_pecuario/features/animalControl/presentation/widgets/milk_drop_clipper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MilkDropIcon extends StatelessWidget {
  final Widget icon;
  final Color color;

  const MilkDropIcon({super.key, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MilkDropClipper(),
      child: Container(
        color: color,
        padding: const EdgeInsets.all(12),
        child: icon,
      ),
    );
  }
}