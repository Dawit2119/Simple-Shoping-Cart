import 'package:counterprovider/Store/my_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ProdcutDetail extends StatelessWidget {
  const ProdcutDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<MyStore>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(""),
              Column(
                children: [
                  Text(
                    store.activeProduct.name,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Image.asset('images/${store.activeProduct.pic}'),
                  Text(
                    'Price: ${store.activeProduct.price}',
                    style: Theme.of(context).textTheme.headline4,
                  )
                ],
              ),
              Text(
                "Quantity",
                style: Theme.of(context).textTheme.headline5,
              )
            ]),
      ),
      bottomNavigationBar: Card(
        color: Color(0xffffffaa),
        elevation: 10.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                store.addToBasket(store.activeProduct)?
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("The Item is successfully Added."),
                    duration: Duration(seconds: 5),
                    backgroundColor: Colors.pink,
                    action: SnackBarAction(
                        label: 'Ok', onPressed: () => Navigator.pop(context)),
                  )):
                  Alert(
                          context: context,
                          type: AlertType.warning,
                          title: "Notice",
                          desc: 'No more quantity for this item')
                      .show();
              },
              child: Icon(Icons.add),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green)),
            ),
            Text(
              '${store.activeProduct.qty}',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                store.removeFromBasket(store.activeProduct)?
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('The item is removed'),
                      backgroundColor: Colors.pink,
                      action: SnackBarAction(
                        label: 'Ok',
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ):
                  Alert(
                          context: context,
                          type: AlertType.warning,
                          title: "Notice",
                          desc: 'The item is not in the basket')
                      .show();
              },
              child: Icon(
                Icons.remove,
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.red)),
            )
          ],
        ),
      ),
    );
  }
}
