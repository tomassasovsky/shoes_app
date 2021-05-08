import 'package:flutter/material.dart';
import 'package:shoes_app/src/widgets/custom_widgets.dart';

class AddToCart extends StatelessWidget {
  final double price;

  const AddToCart({Key? key, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.15),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        children: [
          SizedBox(width: 20),
          Text('\$$price', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          Spacer(),
          BuyButton(text: 'Add To Cart'),
          SizedBox(width: 20),
        ],
      ),
    );
  }
}
