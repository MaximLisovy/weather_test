import 'dart:convert' as convert;
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:weather_test/models/single_forecast.dart';
import 'package:weather_test/models/weather_date.dart';

class Api {

  getCurrentForecast(MapLatLng pos)async{ // api method for single forecast
    final response = await http.get(
        Uri.parse('http://api.weatherapi.com/v1/forecast.json?key=ce653f9cf3de46d69d0203442231212&q=${pos.latitude},${pos.longitude}&aqi=no'));
    if (response.statusCode == 200) {
      var body = convert.jsonDecode(utf8.decode(response.bodyBytes));
      SingleForecast result = SingleForecast(body["location"]["name"],body["location"]["country"] ,body["current"]["temp_c"].toString());
      return result;
    } else {
      throw Exception('Failed to load');
    }
  }

  getWeekForecastCoordinates(MapLatLng pos){ // to get data from map this method works better
  return getWeekForecast("${pos.latitude},${pos.longitude}");
  }

  getWeekForecast(String name)async{ // api method for week forecast
    List<WeatherDate> dates = [];
    final response = await http.get(
        Uri.parse('http://api.weatherapi.com/v1/forecast.json?key=ce653f9cf3de46d69d0203442231212&q=$name&days=7&aqi=no&alerts=no'));
    if (response.statusCode == 200) {
      var body = convert.jsonDecode(utf8.decode(response.bodyBytes));
     List<dynamic> forecast = body["forecast"]["forecastday"];
      for (var element in forecast) { 
        dates.add(WeatherDate(element["date"], element["day"]["avgtemp_c"].toString()));
      }
      return dates;
    } else {
      throw Exception('Failed to load');
    }
  }


}