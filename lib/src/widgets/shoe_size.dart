import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/src/models/shoe_model.dart';
import 'package:shoes_app/src/pages/shoe_description_page.dart';

class ShoeSizePreview extends StatelessWidget {
  final bool fullscreen;

  const ShoeSizePreview({Key? key, this.fullscreen = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (this.fullscreen) return;
        Navigator.push(context, CupertinoPageRoute(builder: (context) => ShoeDescriptionPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: fullscreen ? 3 : 30,
          vertical: fullscreen ? 3 : 0,
        ),
        width: double.infinity,
        height: fullscreen ? 410 : 430,
        decoration: BoxDecoration(
          color: Color(0xffffcf53),
          borderRadius: fullscreen
              ? BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                )
              : BorderRadius.circular(35),
        ),
        child: Column(
          children: [
            _ShadowedShoe(image: 'assets/azul.png'),
            if (!fullscreen) _ShoeSizes(),
          ],
        ),
      ),
    );
  }
}

class _ShadowedShoe extends StatelessWidget {
  final String image;

  const _ShadowedShoe({Key? key, required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final shoeModel = Provider.of<ShoeModel>(context);
    return Container(
      margin: EdgeInsets.all(50),
      child: Stack(
        children: [
          Positioned(
            bottom: 10,
            right: 0,
            child: _Shadow(),
          ),
          Image.asset(shoeModel.assetImage),
        ],
      ),
    );
  }
}

class _Shadow extends StatelessWidget {
  const _Shadow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -.50,
      child: Container(
        width: 230,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(color: Color(0xffeaa14e), blurRadius: 40),
          ],
        ),
      ),
    );
  }
}

class _ShoeSizes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _ShoeSizeBackground(size: 7),
          _ShoeSizeBackground(size: 7.5),
          _ShoeSizeBackground(size: 8),
          _ShoeSizeBackground(size: 8.5),
          _ShoeSizeBackground(size: 9),
          _ShoeSizeBackground(size: 9.5),
        ],
      ),
    );
  }
}

class _ShoeSizeBackground extends StatelessWidget {
  final double size;
  const _ShoeSizeBackground({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shoeModel = Provider.of<ShoeModel>(context);
    final selected = (shoeModel.size == size);

    return GestureDetector(
      onTap: () {
        Provider.of<ShoeModel>(context, listen: false).size = size;
      },
      child: Container(
        child: Text(
          '${size.toString().replaceAll('.0', '')}',
          style: TextStyle(
            color: selected ? Colors.white : Color(0xfff1a23a),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        alignment: Alignment.center,
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: selected ? Color(0xfff1a23a) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            if (selected) BoxShadow(color: Color(0xfff1a23a), blurRadius: 10, offset: Offset(0, 5)),
          ],
        ),
      ),
    );
  }
}
