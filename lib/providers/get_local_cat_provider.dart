import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/app_strings.dart';
import '../model/categories_model.dart';

class GetLocalCatProvider extends ChangeNotifier {
  List<CategoriesByID> dataGetList = [];
  Future<void> getCat() async {
    dataGetList.clear();
    final String response =
        await rootBundle.loadString(AppStrings.local__json__String);
    final data = await json.decode(response);
    for (int i = 0; i < data['items'].length; i++) {
      dataGetList.add(CategoriesByID(
          id: data['items'][i]['id'].toString(),
          catName: data['items'][i]['name']));
    }
    notifyListeners();
  }
}
