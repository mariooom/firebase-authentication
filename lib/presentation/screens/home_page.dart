import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shoppingapp/presentation/widgets/grid_view.dart';
import 'package:shoppingapp/presentation/widgets/hot_offers.dart';
import 'package:shoppingapp/presentation/widgets/page_view.dart';
import 'package:shoppingapp/data/item.dart'; // Import the item.dart file

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFd6ccc2),
        title: Text(
          'Welcome'.tr(),
          style: TextStyle(
            fontFamily: 'Pacifico',
            fontWeight: FontWeight.bold,
            fontSize: MediaQuery.of(context).size.width * 0.08,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.language,
              color: Colors.black,
            ),
            onPressed: () {
              if (context.locale == Locale('en', 'US')) {
                context.setLocale(Locale('ar', 'EG'));
              } else {
                context.setLocale(Locale('en', 'US'));
              }
            },
          ),
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
                  child: Text(
                    'Our Products'.tr(),
                    style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: MediaQuery.of(context).size.width * 0.08,
                    ),
                  ),
                ),
                ProductsPageView(),
                Divider(
                  indent: MediaQuery.of(context).size.width * 0.05,
                  endIndent: MediaQuery.of(context).size.width * 0.05,
                ),
                Padding(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
                  child: Text(
                    'Hot Offers'.tr(),
                    style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: MediaQuery.of(context).size.width * 0.08,
                    ),
                  ),
                ),
                ProductsListView(),
                Divider(
                  indent: MediaQuery.of(context).size.width * 0.05,
                  endIndent: MediaQuery.of(context).size.width * 0.05,
                ),
                ProductsGridView(items: items),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
