import 'package:counterprovider/Pages/product_detail.dart';
import 'package:counterprovider/Store/my_store.dart';
import 'package:counterprovider/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Products extends StatelessWidget {
  const Products({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //register for listener
    final store = Provider.of<MyStore>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('ምርቶች'),
          actions: [
            InkWell(
              onTap: () => Navigator.pushNamed(context, BASKET),
              child: Column(
                children: [
                  Expanded(
                      child: CircleAvatar(
                    child: Text(store.baskets.length > 0
                        ? store.baskets.length.toString()
                        : '0'),
                    backgroundColor: Colors.red,
                  )),
                  Expanded(child: Icon(Icons.add_shopping_cart))
                ],
              ),
            ),
          ],
        ),
        body: GridView.builder(
          itemCount: store.products.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, i) {
            return InkWell(
              onTap: () {
                store.setActiveProduct(store.products[i]);
                Navigator.pushNamed(context, PRODUCT_DETAIL);
              },
              child: Card(
                elevation: 10,
                child: Column(
                  children: [
                    Flexible(
                      child: Container(
                        child: Image(
                          image: AssetImage('images/${store.products[i].pic}'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                        child: Text(
                      store.products[i].name,
                      style: Theme.of(context).textTheme.headline6,
                    ))
                  ],
                ),
              ),
            );
          },
        ));
  }
}
