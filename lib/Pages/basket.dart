import 'package:counterprovider/Store/my_store.dart';
import 'package:counterprovider/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class BasketPage extends StatelessWidget {
  const BasketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<MyStore>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Basket'),
        actions: [
          InkWell(
            onTap: ()=>Navigator.pushNamed(context, BASKET),
            child: Column(
              children: [
                Expanded(child: CircleAvatar(child: Text(store.baskets.length>0?store.baskets.length.toString():'0'),backgroundColor: Colors.red,)),
                Expanded(child: Icon(Icons.add_shopping_cart))
              ],
            ),
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: store.baskets.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 15,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Image.asset(
                        'images/${store.baskets[index].pic}',
                        height: 150,
                      ),
                    ),
                    Expanded(
                        child: Text(
                      store.baskets[index].name,
                      style: Theme.of(context).textTheme.headline4,
                    )),
                    Flexible(
                      child:Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Flexible(
                                child: BasketButton(
                                  store: store,
                                  color: Colors.green,
                                  icon: Icons.add,
                                  index: index,
                                  onPressed: () {
                                    store.addToBasket(store.baskets[index])
                                        ? ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                            content: Text(
                                                "The Item is successfully Added."),
                                            duration: Duration(seconds: 5),
                                            backgroundColor: Colors.pink,
                                            action: SnackBarAction(
                                                label: 'Ok',
                                                onPressed: () =>
                                                    Navigator.pop(context)),
                                          ))
                                        : Alert(
                                                context: context,
                                                type: AlertType.warning,
                                                title: "Notice",
                                                desc:
                                                    'No more quantity for this item')
                                            .show();
                                  },
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  '${store.baskets[index].qty}',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              Flexible(
                                child: BasketButton(
                                  store: store,
                                  color: Colors.redAccent,
                                  icon: Icons.remove,
                                  index: index,
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Are You Sure?'),
                                        action: SnackBarAction(
                                          label: 'Yes',
                                          onPressed: () {
                                              store.removeFromBasket(
                                                  store.baskets[index]);
                                              if(store.baskets.length==0)Navigator.pop(context);
                                          }
                                        ),
                                        duration: Duration(seconds: 2),
                                        backgroundColor: Colors.pink,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          )),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class BasketButton extends StatelessWidget {
  const BasketButton({
    Key? key,
    required this.store,
    required this.color,
    required this.icon,
    required this.index,
    required this.onPressed,
  }) : super(key: key);

  final MyStore store;
  final Color color;
  final IconData icon;
  final int index;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      child: Icon(icon),
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(color)),
    );
  }
}

/*
*/