// list_view_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../di/setup_locator.dart';
import '../models/item_model.dart';
import '../view_models/list_view_model.dart';

class ListViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = getIt<ListViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Example'),
      ),
      body: ChangeNotifierProvider<ListViewModel>(
        create: (_) => viewModel,
        child: Consumer<ListViewModel>(
          builder: (context, model, child) {
            return ListView.builder(
              itemCount: model.items.length,
              itemBuilder: (context, index) {
                final item = model.items[index];

                return ListTile(
                  title: Text(item.title),
                  subtitle: Text(item.description),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          viewModel.addItem(ItemModel(title: 'New Item', description: 'New Description'));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
