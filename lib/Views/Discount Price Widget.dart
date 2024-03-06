import 'package:flutter/material.dart';

class DiscountProduct extends StatelessWidget {
  String price;

  DiscountProduct(this.price);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Stack(
        alignment: Alignment.center,
        children: [
          Text(
            price,
            style: Theme.of(context).textTheme.headline2,
          ),
          Container(
            color: Theme.of(context).accentColor,
            width: 70,
            height: 2,
          )
        ],
      ),
      Text('\$', style: Theme.of(context).textTheme.headline2)
    ]);
  }
}
