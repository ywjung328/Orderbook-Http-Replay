import 'dart:math';

import 'package:flutter/material.dart';
import 'package:orderbook_replay_flutter/global_variables.dart';
import 'package:orderbook_replay_flutter/widgets/orderbook_bar.dart';

class OrderBook extends StatefulWidget {
  const OrderBook({super.key});

  @override
  State<OrderBook> createState() => _OrderBookState();
}

class _OrderBookState extends State<OrderBook> {
  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    for (int i = 0; i < kOrderbookModel.prices.length ~/ 2; i++) {
      children.add(OrderbookBar(
        price: kOrderbookModel.prices[i],
        quantity: kOrderbookModel.quantities[i],
        isSell: true,
        isBold: i == kOrderbookModel.prices.length ~/ 2 - 1,
      ));
    }

    for (int i = kOrderbookModel.prices.length ~/ 2;
        i < kOrderbookModel.prices.length;
        i++) {
      children.add(OrderbookBar(
        price: kOrderbookModel.prices[i],
        quantity: kOrderbookModel.quantities[i],
        isSell: false,
        isBold: i == kOrderbookModel.prices.length ~/ 2,
      ));
    }

    // children.add(
    //   Row(
    //     children:[
    //     Text(${}),
    //     SizedBox()],
    //   ),
    // );

    return Column(children: children);
  }
}
