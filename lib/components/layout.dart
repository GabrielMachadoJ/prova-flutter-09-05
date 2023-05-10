import 'package:flutter/material.dart';

class Layout extends StatefulWidget {
  final String pageTitle;
  final List<Widget> pageContent;

  const Layout({super.key, required this.pageTitle, required this.pageContent});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Finanças de Hoje'),
        backgroundColor: Colors.green[900],
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              widget.pageTitle,
              style:
                  const TextStyle(fontSize: 24.0, fontWeight: FontWeight.w100),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: widget.pageContent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
