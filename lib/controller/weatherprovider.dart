import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_1/models/weatherdatamodel.dart';
import 'package:weather_app_1/utils/Link.dart';

class WeatherProvider extends ChangeNotifier{

  String location = "Surat";
  weatherModel? _weatherModel;
  TextEditingController citycontroller = TextEditingController();
  void locationchanage(String newLocation)
  {
    location = newLocation;
    notifyListeners();
  }
  Future<weatherModel?> Weatherdata(String locationame)async{
    _weatherModel  = await APIHelper.apiLink.fetchweather(locationame);
    return _weatherModel;
  }
}
