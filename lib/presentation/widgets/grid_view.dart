import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shoppingapp/data/item.dart';

class ProductsGridView extends StatelessWidget {
  final List<Item> items;

  ProductsGridView({required this.items});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight * 0.3,
      child: GridView.builder(
        shrinkWrap: true,
        controller: ScrollController(initialScrollOffset: 200.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (screenWidth / 2) / (screenHeight * 0.3),
          mainAxisSpacing: 0.1,
          crossAxisSpacing: 0.6,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return _buildProductCard(context, items[index], screenWidth);
        },
      ),
    );
  }

  Widget _buildProductCard(
      BuildContext context, Item item, double screenWidth) {
    return Card(
      color: Color(0xFFf5ebe0),
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.01),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              item.imagePath,
              height: screenWidth * 0.4,
              width: screenWidth * 0.5,
              fit: BoxFit.cover,
            ),
            Text(
              item.name.tr(),
              style: TextStyle(
                fontFamily: 'Padauk',
                fontSize: screenWidth * 0.05,
              ),
            ),
            IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Item added to cart'.tr())),
                );
              },
              icon: Icon(Icons.add_shopping_cart),
            ),
          ],
        ),
      ),
    );
  }
}
