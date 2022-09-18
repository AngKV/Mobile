import 'package:flutter/material.dart';
import 'user_product_list_title.dart';
import 'products_manager.dart';

class UserProductsScreen extends StatelessWidget {
  const UserProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productsManager = ProductsManager();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your product'),
        actions: <Widget>[
          buildAddButton(),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async => print('Refresh products'),
        child: bulidUserProductListView(productsManager),
      ),
    );
  }

  Widget bulidUserProductListView(ProductsManager productsManager) {
    return ListView.builder(
      itemCount: productsManager.itemCount,
      itemBuilder: (ctx, i) => Column(
        children: [
          UserProductListTitle(
            productsManager.items[i],
          ),
          const Divider(),
        ],
      ),
    );
  }

  Widget buildAddButton() {
    return IconButton(
      onPressed: () {
        print('go to edit product screen');
      },
      icon: const Icon(Icons.add),
    );
  }
}
