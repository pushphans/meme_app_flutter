import 'package:flutter/material.dart';

class MyCard extends StatefulWidget {
  String url;
  MyCard({super.key, required this.url});

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return Card(child: Column(children: [Image.network(widget.url)]));
  }
}
