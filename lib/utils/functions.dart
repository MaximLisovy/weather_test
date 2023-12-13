import 'package:flutter/material.dart';
import 'package:google_places_autocomplete_text_field/model/prediction.dart';
import 'package:mobx/mobx.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

import '../api/api.dart';
import '../models/single_forecast.dart';
import '../models/weather_date.dart';

part 'functions.g.dart';

class Functions = _Functions with _$Functions;

abstract class _Functions with Store { // most of logic here. State management Mobx+Provider
  @observable
  SingleForecast? forecast;
  @observable
  MapLatLng markerPosition = MapLatLng(0,0);
  @observable
  TextEditingController textController = TextEditingController();
  @observable
  int selectedTab = 0;
  @observable
  ObservableList<WeatherDate> weather =  ObservableList<WeatherDate>.of([]);
  @observable
  Prediction? predict;
  @observable
  bool tapped = false;
  final api = Api();

  @action
  setMarker(MapLatLng position){
    markerPosition = position;
  }

  @action
  openInfo()async{
    await setSingleForecast();
    tapped = true;
  }

  @action
  setSingleForecast()async{
   forecast = await api.getCurrentForecast(markerPosition);
  }

  @action
  changeTab(int index){
    selectedTab = index;
  }

  @action
  getWeekForecast()async{
    if(predict != null){
      List<WeatherDate> list = await api.getWeekForecast(predict!.structuredFormatting!.mainText!);
      if(weather.isNotEmpty){
        weather.clear();
      }
      weather.addAll(list);
    }
  }

  @action
  openWeekForecast()async{
  List<WeatherDate> list = await api.getWeekForecastCoordinates(markerPosition);
  if(weather.isNotEmpty){
    weather.clear();
  }
   weather.addAll(list);
   selectedTab = 1;
   textController.text = "${forecast?.city},${forecast?.country}";
  }

  @action
  setPrediction(Prediction prediction){
    predict = prediction;
  }

}
