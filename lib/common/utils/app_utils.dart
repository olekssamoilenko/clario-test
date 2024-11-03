import 'package:flutter/material.dart';
import 'package:simple_grid/simple_grid.dart';

//wrapper for grid cell
SpGridItem buildSpGridItem(
  BuildContext context, {
  required Widget child,
  required String label,
}) {
  return SpGridItem(
    md: 6,
    lg: 3,
    padding: const EdgeInsets.symmetric(horizontal: 40),
    order: const SpOrder(sm: 0, xs: 0),
    child: Column(
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 24),
        ),
        const SizedBox(height: 30),
        child,
      ],
    ),
  );
}
