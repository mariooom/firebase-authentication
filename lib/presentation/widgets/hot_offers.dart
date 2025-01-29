import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shoppingapp/data/item.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Item> items = [
      Item(name: '15% Off', imagePath: 'assets/images/men.jpeg'),
      Item(name: '20% Off', imagePath: 'assets/images/jacket_women.jpeg'),
      Item(name: '20% Off', imagePath: 'assets/images/jacket_men.jpeg'),
      Item(name: '45% Off', imagePath: 'assets/images/kids.jpeg'),
    ];

    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double containerHeight = screenHeight * 0.3;
    final double containerWidth = screenWidth * 0.3;

    return Container(
      height: containerHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Card(
              borderOnForeground: true,
              color: const Color(0xFFf5ebe0),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      item.imagePath,
                      height: containerHeight * 0.5,
                      width: containerWidth * 1.1,
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item.name.tr(),
                      style: const TextStyle(
                        fontFamily: 'Padauk',
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
