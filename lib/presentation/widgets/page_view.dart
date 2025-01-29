import 'package:flutter/material.dart';
import 'package:shoppingapp/data/item.dart';

class ProductsPageView extends StatelessWidget {
  const ProductsPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * 0.56,
            width: MediaQuery.of(context).size.width * 0.9,
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Color(0xFFedede9),
            ),
            child: PageView(
              scrollDirection: Axis.horizontal,
              children: items.map((item) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        item.imagePath,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
