// list_view_model.dart
import 'package:flutter/material.dart';

import '../models/item_model.dart';

class ListViewModel extends ChangeNotifier {
  final List<ItemModel> _items = [
    ItemModel(title: 'Item 1', description: 'Description 1'),
    ItemModel(title: 'Item 2', description: 'Description 2'),
    ItemModel(title: 'Item 3', description: 'Description 3'),
  ];

  List<ItemModel> get items => _items;

  void addItem(ItemModel item) {
    _items.add(item);
    notifyListeners();
  }
}
