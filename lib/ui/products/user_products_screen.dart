import 'package:flutter/material.dart';
import 'package:myshop/ui/products/edit_product_screen.dart';
import 'package:provider/provider.dart';
import 'user_product_list_title.dart';
import 'products_manager.dart';
import '../share/app_drawer.dart';

class UserProductsScreen extends StatelessWidget {
  const UserProductsScreen({super.key});

  static const routeN = '/user-products';

  @override
  Widget build(BuildContext context) {
    final productsManager = ProductsManager();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your product'),
        actions: <Widget>[
          buildAddButton(context),
        ],
      ),
      drawer: const AppDrawer(),
      body: FutureBuilder(
        future: _refreshProducts(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return RefreshIndicator(
            onRefresh: () => _refreshProducts(context),
            child: bulidUserProductListView(),
          );
        },
      ),
    );
  }

  Widget bulidUserProductListView() {
    return Consumer<ProductsManager>(
      builder: (context, productsManager, child) {
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
      },
    );
  }

  Widget buildAddButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pushNamed(
          EditProductScreen.routeN,
        );
      },
      icon: const Icon(Icons.add),
    );
  }

  Future<void> _refreshProducts(BuildContext context) async {
    await context.read<ProductsManager>().fetchProducts(true);
  }
}
