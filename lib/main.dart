import 'package:flutter/material.dart';
import 'package:shopping_cart/cartitem.dart';
import 'package:shopping_cart/item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Item> items = <Item>[
    Item(name: 'iPhone 15', price: 1500),
    Item(name: 'MacBook Pro', price: 2500),
    Item(name: 'iPad Pro', price: 10000),
  ];

  int total = 0;

  void updateTotal() {
    setState(() {
      total = items.fold(
          0, (sum, item) => sum + (item.price * item.amount).toInt());
    });
  }

  void clearCart() {
    setState(() {
      for (var item in items) {
        item.amount = 0;
      }
      updateTotal();
    });
  }

  @override
  void initState() {
    super.initState();
    updateTotal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            TextButton.icon(
              onPressed: clearCart,
              icon: Icon(Icons.clear),
              label: Text('Clear Cart'),
            ),
            for (Item item in items)
              CartItem(
                items: item,
                onQuantityChanged: updateTotal,
              ),
            Expanded(
              child: Container(),
            ),
            Container(
              width: double.infinity,
              height: 100,
              color: Colors.grey[200],
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total:'),
                  Text('$total ฿',
                      style: Theme.of(context).textTheme.headlineLarge),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
