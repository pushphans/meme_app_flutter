// ignore_for_file: must_be_immutable

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Card(
        elevation: 20,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Image.network(widget.url, fit: BoxFit.cover),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
