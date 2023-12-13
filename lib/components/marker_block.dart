import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:weather_test/utils/utils.dart';

import '../models/single_forecast.dart';
import '../utils/functions.dart';

class MarkerBlock extends StatelessWidget {
  final SingleForecast forecast;
  void Function()? firstTap;
  MarkerBlock({super.key, required this.forecast, this.firstTap});

  @override
  Widget build(BuildContext context) {
    final func = Provider.of<Functions>(context, listen: true);
    return Observer(
      builder: (_) =>
          func.tapped ? SizedBox(
        height: 185,
        width: 120,
        child: Column(
          children: [
            InkWell(
              onTap: firstTap,
              child: Container(
                height: 75,
                width: 120,
                padding: const EdgeInsets.only(top: 5, left: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${func.forecast?.city}, ${func.forecast?.country}", style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),),
                    Text("${checkNegative(func.forecast!.temperature)} °C",   style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),),
                  ],
                ),
              ),
            ),
                const Icon(Icons.location_on, color: Colors.red, size: 30,)
          ],
        ),
      ) : InkWell(
              onTap: ()=> func.openInfo(),
              child: const Icon(Icons.location_on, color: Colors.red, size: 30,))
    );
  }
}
