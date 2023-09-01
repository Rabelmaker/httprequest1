import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:httprequest/Model/crew_model.dart';

class CrewProvider with ChangeNotifier{
 final String apiUrl = 'https://reqres.in/api/users';
 CrewModel _crewModel = CrewModel(
  name:  "",
  job:  "",
  id:  "",
  createdAt: "",
 );

 CrewModel get crewModel => _crewModel;

 void post(
     String name,
     String job
     ) async {

  final response = await Dio().post(apiUrl, data: {
   "name": name,
   "job": job
  });

  _crewModel = CrewModel.fromMap(response.data);
  notifyListeners();
 }
}