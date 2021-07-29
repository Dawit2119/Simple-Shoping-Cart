import 'package:counterprovider/Pages/basket.dart';
import 'package:counterprovider/Pages/product_detail.dart';
import 'package:counterprovider/Pages/products_page.dart';
import 'package:counterprovider/Store/my_store.dart';
import 'package:counterprovider/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main()=>runApp(
  ChangeNotifierProvider(
    create: (BuildContext context)  =>MyStore(),
    child: MaterialApp(
      title: "shopping cart",
      debugShowCheckedModeBanner: false,
      initialRoute: HOMEPAGE,
      routes: {
       HOMEPAGE:(BuildContext context)=>Products(),
       PRODUCT_DETAIL:(BuildContext context)=>ProdcutDetail(),
       BASKET:(BuildContext context)=>BasketPage(),

      },
    ),
  ),
);