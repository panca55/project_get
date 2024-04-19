import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/http_providers.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<HttpProvider>(context);
    dataProvider.getData(19, 24);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Project Get"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (ctx, i) {
              final product = dataProvider.data[i];
                return ListTile(
                  title: Text(product.title),
                  subtitle: Text(product.price.toString()),
                  leading: Image.network(product.images[0]),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
