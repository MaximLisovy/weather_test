import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_places_autocomplete_text_field/google_places_autocomplete_text_field.dart';
import 'package:google_places_autocomplete_text_field/model/prediction.dart';
import 'package:provider/provider.dart';
import 'package:weather_test/components/weekly_block.dart';
import '../utils/functions.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _yourGoogleAPIKey = 'AIzaSyDXjAcEbkn8OezcnOL23nheB-doUj0LAxA';
  final textController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    final func = Provider.of<Functions>(context, listen: true);
    return Observer(
        builder: (_) => Scaffold(
      body: SafeArea(
       bottom: false,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Form(
                      key: _formKey,
                      autovalidateMode: _autovalidateMode,
                      child: GooglePlacesAutoCompleteTextFormField(
                        textEditingController: func.textController,
                        googleAPIKey: _yourGoogleAPIKey,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        maxLines: 1,
                          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                        overlayContainer: (child) => Material(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          child: child,
                        ),
                        getPlaceDetailWithLatLng: (prediction) {
                        },
                        itmClick: (Prediction prediction) async{
                          func.textController.text = prediction.description!;
                        func.setPrediction(prediction);
                        }
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: IconButton(onPressed:  _onSubmit, icon: const Icon(Icons.search)))
                ],
              ),
          Expanded(
                child: ListView.builder(
                  itemCount: func.weather.length,
                  itemBuilder: (BuildContext context, int index) {
                    return WeeklyBlock(date: func.weather[index]);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }

  Future<void> _onSubmit() async {
    if (!_formKey.currentState!.validate()) {
      setState(() => _autovalidateMode = AutovalidateMode.always);
      return;
    }
    final func = Provider.of<Functions>(context, listen: false);
    await func.getWeekForecast();
  }
}
