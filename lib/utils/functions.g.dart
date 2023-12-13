// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'functions.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Functions on _Functions, Store {
  late final _$forecastAtom =
      Atom(name: '_Functions.forecast', context: context);

  @override
  SingleForecast? get forecast {
    _$forecastAtom.reportRead();
    return super.forecast;
  }

  @override
  set forecast(SingleForecast? value) {
    _$forecastAtom.reportWrite(value, super.forecast, () {
      super.forecast = value;
    });
  }

  late final _$markerPositionAtom =
      Atom(name: '_Functions.markerPosition', context: context);

  @override
  MapLatLng get markerPosition {
    _$markerPositionAtom.reportRead();
    return super.markerPosition;
  }

  @override
  set markerPosition(MapLatLng value) {
    _$markerPositionAtom.reportWrite(value, super.markerPosition, () {
      super.markerPosition = value;
    });
  }

  late final _$textControllerAtom =
      Atom(name: '_Functions.textController', context: context);

  @override
  TextEditingController get textController {
    _$textControllerAtom.reportRead();
    return super.textController;
  }

  @override
  set textController(TextEditingController value) {
    _$textControllerAtom.reportWrite(value, super.textController, () {
      super.textController = value;
    });
  }

  late final _$selectedTabAtom =
      Atom(name: '_Functions.selectedTab', context: context);

  @override
  int get selectedTab {
    _$selectedTabAtom.reportRead();
    return super.selectedTab;
  }

  @override
  set selectedTab(int value) {
    _$selectedTabAtom.reportWrite(value, super.selectedTab, () {
      super.selectedTab = value;
    });
  }

  late final _$weatherAtom = Atom(name: '_Functions.weather', context: context);

  @override
  ObservableList<WeatherDate> get weather {
    _$weatherAtom.reportRead();
    return super.weather;
  }

  @override
  set weather(ObservableList<WeatherDate> value) {
    _$weatherAtom.reportWrite(value, super.weather, () {
      super.weather = value;
    });
  }

  late final _$predictAtom = Atom(name: '_Functions.predict', context: context);

  @override
  Prediction? get predict {
    _$predictAtom.reportRead();
    return super.predict;
  }

  @override
  set predict(Prediction? value) {
    _$predictAtom.reportWrite(value, super.predict, () {
      super.predict = value;
    });
  }

  late final _$tappedAtom = Atom(name: '_Functions.tapped', context: context);

  @override
  bool get tapped {
    _$tappedAtom.reportRead();
    return super.tapped;
  }

  @override
  set tapped(bool value) {
    _$tappedAtom.reportWrite(value, super.tapped, () {
      super.tapped = value;
    });
  }

  late final _$openInfoAsyncAction =
      AsyncAction('_Functions.openInfo', context: context);

  @override
  Future openInfo() {
    return _$openInfoAsyncAction.run(() => super.openInfo());
  }

  late final _$setSingleForecastAsyncAction =
      AsyncAction('_Functions.setSingleForecast', context: context);

  @override
  Future setSingleForecast() {
    return _$setSingleForecastAsyncAction.run(() => super.setSingleForecast());
  }

  late final _$getWeekForecastAsyncAction =
      AsyncAction('_Functions.getWeekForecast', context: context);

  @override
  Future getWeekForecast() {
    return _$getWeekForecastAsyncAction.run(() => super.getWeekForecast());
  }

  late final _$openWeekForecastAsyncAction =
      AsyncAction('_Functions.openWeekForecast', context: context);

  @override
  Future openWeekForecast() {
    return _$openWeekForecastAsyncAction.run(() => super.openWeekForecast());
  }

  late final _$_FunctionsActionController =
      ActionController(name: '_Functions', context: context);

  @override
  dynamic setMarker(MapLatLng position) {
    final _$actionInfo =
        _$_FunctionsActionController.startAction(name: '_Functions.setMarker');
    try {
      return super.setMarker(position);
    } finally {
      _$_FunctionsActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeTab(int index) {
    final _$actionInfo =
        _$_FunctionsActionController.startAction(name: '_Functions.changeTab');
    try {
      return super.changeTab(index);
    } finally {
      _$_FunctionsActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPrediction(Prediction prediction) {
    final _$actionInfo = _$_FunctionsActionController.startAction(
        name: '_Functions.setPrediction');
    try {
      return super.setPrediction(prediction);
    } finally {
      _$_FunctionsActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
forecast: ${forecast},
markerPosition: ${markerPosition},
textController: ${textController},
selectedTab: ${selectedTab},
weather: ${weather},
predict: ${predict},
tapped: ${tapped}
    ''';
  }
}
