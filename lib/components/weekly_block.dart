import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_test/models/weather_date.dart';

import '../utils/utils.dart';

class WeeklyBlock extends StatelessWidget {
  final WeatherDate date;
  const WeeklyBlock({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [
              0.3,
              0.9,
            ],
            colors: [
              Colors.yellow,
              Colors.teal,
            ],
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(DateFormat('EEEE').format(DateTime.parse(date.day)).toString(), style: const TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700),),
          Text("${checkNegative(date.temperature)} °C", style: const TextStyle( fontSize: 20, color: Colors.black,fontWeight: FontWeight.w700),),
        ],
      ),
    );
  }
}
