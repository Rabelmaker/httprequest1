import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:httprequest/Model/listcrew_model.dart';

class ListCrewProvider with ChangeNotifier {
  List<ListCrewModel> _list = [];

  List<ListCrewModel> get list => _list;

  void get() async {
    String apiUrl = 'https://reqres.in/api/users?page';
    Response response = await Dio().get(apiUrl);

    List x = response.data["data"];

    _list = x.map((e) => ListCrewModel.fromMap(e)).toList();

    notifyListeners();
  }
}
