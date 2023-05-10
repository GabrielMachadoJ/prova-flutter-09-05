import 'package:flutter/material.dart';

class VariationBadge extends StatefulWidget {
  final String variationValue;
  const VariationBadge({super.key, required this.variationValue});

  @override
  State<VariationBadge> createState() => _VariationBadgeState();
}

class _VariationBadgeState extends State<VariationBadge> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: double.tryParse(widget.variationValue) != null &&
                double.tryParse(widget.variationValue)! >= 0
            ? Colors.blue[400]
            : Colors.red[400],
        borderRadius: BorderRadius.circular(2),
      ),
      padding: const EdgeInsets.all(2),
      child: Text(
        widget.variationValue,
        style: const TextStyle(
          fontSize: 10,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
