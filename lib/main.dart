import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_test/screens/map.dart';
import 'package:weather_test/screens/search_screen.dart';
import 'package:weather_test/utils/functions.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

void main() {
  runApp(MultiProvider(providers: [
  Provider<Functions>(
  create: (_) => Functions(),
  )],child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List _pages = [
    const InteractiveMapPage(),
   const SearchScreen(),
  ];

  _changeTab(int index) {
    final func = Provider.of<Functions>(context, listen: false);
    func.changeTab(index);
  }

  @override
  Widget build(BuildContext context) {
    final func = Provider.of<Functions>(context, listen: true);
    return Observer(
        builder: (_) =>Scaffold(
      body:_pages[func.selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: func.selectedTab,
        onTap: (index) => _changeTab(index),
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.map), label: "Map"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    ));
  }
}
