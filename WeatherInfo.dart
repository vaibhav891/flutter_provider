import 'package:flutter/foundation.dart';

class WeatherInfo with ChangeNotifier{
  String _tempType='Celcius';
  int _tempValue=25;

  String get tempType => _tempType;
  int get tempValue => _tempValue;

  set tempType(String newType){
    print('inside setter');
    _tempType = newType;
    notifyListeners();
  }

  set tempValue(int newValue){
    _tempValue = newValue;
    notifyListeners();
  }





}
