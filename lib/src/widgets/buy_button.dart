import 'package:flutter/material.dart';

class BuyButton extends StatelessWidget {
  final String text;
  final double height;
  final double width;
  final Color color;

  const BuyButton({Key? key, required this.text, this.height = 50, this.width = 150, this.color = Colors.orange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: this.color,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        '$text',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
