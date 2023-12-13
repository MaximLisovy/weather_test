
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:weather_test/components/marker_block.dart';
import 'package:weather_test/models/single_forecast.dart';

import '../utils/functions.dart';


class InteractiveMapPage extends StatefulWidget {
  const InteractiveMapPage({Key? key}) : super(key: key);

  @override
  InteractiveMapPageState createState() => InteractiveMapPageState();
}

class InteractiveMapPageState extends State<InteractiveMapPage> {
  late MapZoomPanBehavior _mapZoomPanBehavior;
  late MapTileLayerController _controller;

  @override
  void initState() {
    _controller = MapTileLayerController();
    _mapZoomPanBehavior = MapZoomPanBehavior(zoomLevel: 4);
    super.initState();
  }

  void updateMarkerChange(Offset position) async {
    final func = Provider.of<Functions>(context, listen: false);
    await func.setMarker(_controller.pixelToLatLng(position));
    setState(() {
      func.tapped = false;
    });
    if (_controller.markersCount > 0) {
      _controller.clearMarkers();
    }

    _controller.insertMarker(0);
  }

  @override
  Widget build(BuildContext context) {
    final func = Provider.of<Functions>(context, listen: true);
    return Observer(
        builder: (_) =>
            Scaffold(
      body: GestureDetector(
        onTapUp: (TapUpDetails details) {
          updateMarkerChange(details.localPosition);
        },
        child: SfMaps(
          layers: [
            MapTileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              zoomPanBehavior: _mapZoomPanBehavior,
              initialFocalLatLng: const MapLatLng(28.0, 77.0),
              controller: _controller,
              markerBuilder: (BuildContext context, int index) {
                return MapMarker(
                  latitude: func.markerPosition.latitude,
                  longitude: func.markerPosition.longitude,
                  child:
              MarkerBlock(
                    firstTap:()=> func.openWeekForecast(),
                    forecast: func.forecast ?? SingleForecast(" ", " ", " ")
),
                );
              },
            ),
          ],
        ),
      ),
    ));
  }}