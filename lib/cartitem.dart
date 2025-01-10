import 'package:flutter/material.dart';
import 'package:shopping_cart/item.dart';

class CartItem extends StatelessWidget {
  final Item items;
  final VoidCallback onQuantityChanged;

  CartItem({
    required this.items,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              items.name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Price: ${items.price} ฿',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                if (items.amount > 0) {
                  items.amount--;
                  onQuantityChanged();
                }
              },
            ),
            Text('${items.amount}'),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                items.amount++;
                onQuantityChanged();
              },
            ),
          ],
        ),
      ],
    );
  }
}
