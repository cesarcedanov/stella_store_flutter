import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './app_drawer.dart';
import '../providers/orders.dart' show Orders;
import '../organisms/order_item.dart';

class OrdersPage extends StatelessWidget {
  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    final ordersData = Provider.of<Orders>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Orders'),
        ),
        drawer: AppDrawer(),
        body: FutureBuilder(
          future: Provider.of<Orders>(context, listen: false)
              .fetchDataAndSetOrders(),
          builder: (ctx, dataSnapshot) {
            if (dataSnapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (dataSnapshot.error != null) {
                return Center(
                  child: Text('AN error ocurred'),
                );
              } else {
                return Consumer<Orders>(
                    builder: (ctx, orderData, child) => ListView.builder(
                          itemCount: ordersData.orders.length,
                          itemBuilder: (ctx, index) =>
                              OrderItem(ordersData.orders[index]),
                        ));
              }
            }
          },
        ));
  }
}
