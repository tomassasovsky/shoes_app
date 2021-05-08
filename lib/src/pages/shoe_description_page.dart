import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/src/helpers/helpers.dart';
import 'package:shoes_app/src/models/shoe_model.dart';
import 'package:shoes_app/src/widgets/custom_widgets.dart';

class ShoeDescriptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    changeStatusLight();
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Hero(tag: 'shoe_1', child: ShoeSizePreview(fullscreen: true)),
              Positioned(
                top: 80,
                child: FloatingActionButton(
                  onPressed: () {
                    changeStatusDark();
                    Navigator.of(context).pop();
                  },
                  child: Icon(Icons.chevron_left, color: Colors.white, size: 60),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  highlightElevation: 0,
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Description(title: 'Nike Air Max 720', description: 'The Nike Air Max 720 goes bigger than ever before with Nike\'s taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort.\nHas Air Max gone too far? We hope so.'),
                  _BuyNowPrice(),
                  _ColorsPLUS(),
                  _CartButtons(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CartButtons extends StatelessWidget {
  const _CartButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _ShadowedButton(icon: Icon(Icons.star, color: Colors.red, size: 25)),
          _ShadowedButton(icon: Icon(Icons.add_shopping_cart, color: Colors.grey.withOpacity(.4), size: 25)),
          _ShadowedButton(icon: Icon(Icons.settings, color: Colors.grey.withOpacity(.4), size: 25)),
        ],
      ),
    );
  }
}

class _ShadowedButton extends StatelessWidget {
  final Icon icon;
  const _ShadowedButton({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.icon,
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: Colors.black45, spreadRadius: -8, blurRadius: 20, offset: Offset(0, 10)),
        ],
      ),
    );
  }
}

class _ColorsPLUS extends StatelessWidget {
  const _ColorsPLUS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(left: 105, child: _ColorButton(4, color: Color(0xffc6d642), image: 'assets/verde.png')),
                Positioned(left: 70, child: _ColorButton(3, color: Color(0xffffad29), image: 'assets/amarillo.png')),
                Positioned(left: 35, child: _ColorButton(2, color: Color(0xff2099f1), image: 'assets/azul.png')),
                _ColorButton(1, color: Color(0xff364d56), image: 'assets/negro.png'),
              ],
            ),
          ),
          BuyButton(
            text: 'More related items',
            height: 30,
            width: 170,
            color: Color(0xffffc675),
          ),
        ],
      ),
    );
  }
}

class _ColorButton extends StatelessWidget {
  final Color color;
  final int index;
  final String image;

  const _ColorButton(this.index, {Key? key, required this.color, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shoeModel = Provider.of<ShoeModel>(context);
    return FadeInLeft(
      delay: Duration(milliseconds: this.index * 200),
      duration: Duration(milliseconds: 100),
      child: GestureDetector(
        onTap: () {
          Provider.of<ShoeModel>(context, listen: false).assetImage = this.image;
        },
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: this.color,
            shape: BoxShape.circle,
          ),
          child: shoeModel.assetImage == this.image ? Icon(Icons.check, color: Colors.white) : null,
        ),
      ),
    );
  }
}

class _BuyNowPrice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30).add(EdgeInsets.only(top: 20)),
      child: Row(
        children: [
          Text('\$180.0', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          Spacer(),
          Bounce(delay: Duration(seconds: 1), from: 20, child: BuyButton(text: 'Buy Now', width: 120, height: 40)),
        ],
      ),
    );
  }
}
