import 'package:flutter/material.dart';
import 'package:prova/components/variation_badge.dart';

class ContentInfo extends StatefulWidget {
  final String title;
  final String firstValue;
  final String variationValue;
  const ContentInfo(
      {super.key,
      required this.title,
      required this.firstValue,
      required this.variationValue});

  @override
  State<ContentInfo> createState() => _ContentInfoState();
}

class _ContentInfoState extends State<ContentInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w100,
              color: Colors.grey[600]),
        ),
        const SizedBox(
          height: 1,
        ),
        Row(
          children: [
            Text(
              widget.firstValue,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            VariationBadge(variationValue: '${widget.variationValue}')
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
