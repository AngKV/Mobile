import 'package:flutter/material.dart';

import '../../models/product.dart';

class UserProductListTitle extends StatelessWidget {
  final Product product;
  const UserProductListTitle(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product.imageUrl),
      ),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: <Widget>[
            buildEditButton(context),
            buildDeleteButton(context),
          ],
        ),
      ),
    );
  }

  Widget buildEditButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        print('go to edit product screen');
      },
      icon: const Icon(Icons.edit),
      color: Theme.of(context).primaryColor,
    );
  }

  Widget buildDeleteButton(BuildContext context) {
    return IconButton(
      onPressed: () async {
        print('delete a product');
      },
      icon: const Icon(Icons.delete),
      color: Theme.of(context).errorColor,
    );
  }
}
