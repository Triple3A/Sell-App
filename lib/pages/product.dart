import 'dart:async';
import 'package:flutter/material.dart';

import '../widget/ui_elements/title_default.dart';

// ignore: must_be_immutable
class ProductPage extends StatelessWidget {
  final Map<String, dynamic> product;

  ProductPage(this.product);

  Widget _buildTitleTextField() {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: TitleDefault(product['title']),
    );
  }

  Widget _buildAddressPriceRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Tehran, Iran',
          style: TextStyle(
            color: Theme.of(context).accentColor,
            fontFamily: 'Oswald',
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          child: Text(
            '|',
            style: TextStyle(
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
        Text(
          '\$${product['price'].toString()}',
          style: TextStyle(
            color: Theme.of(context).accentColor,
            fontFamily: 'Oswald',
          ),
        )
      ],
    );
  }

  Widget _buildDescriptionTextField() {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Text(
        product['description'],
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(product['title']),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Image.asset(product['image']),
              _buildTitleTextField(),
              _buildAddressPriceRow(context),
              _buildDescriptionTextField(),
            ],
          ),
        ),
      ),
    );
  }
}
