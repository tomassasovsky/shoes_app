import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final String title;
  final String description;

  const Description({Key? key, required this.title, required this.description}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text(this.title, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30)),
          SizedBox(height: 20),
          Text(this.description, style: TextStyle(color: Colors.black54, height: 1.6)),
        ],
      ),
    );
  }
}
