import 'package:flutter/material.dart';

class ContentContainer extends StatefulWidget {
  final List<Widget> leftContent;
  final List<Widget> rightContent;
  final dynamic callbackFunction;
  final String buttonTitle;

  const ContentContainer(
      {super.key,
      required this.leftContent,
      required this.rightContent,
      required this.callbackFunction,
      required this.buttonTitle});

  @override
  State<ContentContainer> createState() => _ContentContainerState();
}

class _ContentContainerState extends State<ContentContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.black,
              width: 1,
            ),
          ),
          padding: const EdgeInsets.all(15.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [...widget.leftContent],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [...widget.rightContent],
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: ElevatedButton(
              onPressed: widget.callbackFunction,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[900],
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
              ),
              child: Text(widget.buttonTitle),
            ),
          ),
        )
      ],
    );
  }
}
