import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mycocktails/custom_card_widget.dart';
import 'package:mycocktails/model/drink.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}
//test comment
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  ThemeData readAppTheme() {
    return ThemeData(
      cardColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey.shade300,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: readAppTheme(),
      debugShowCheckedModeBanner: false,
      title: 'Cocktails',
      home: const MyHomePage(title: 'Cocktails'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Drink> drinks = [];

  Future<void> _fetchDrinks(String uri) async {
    var url = Uri.parse(uri);
    var response = await http.get(url);

    setState(() {
      drinks.addAll(List<Drink>.from(
        jsonDecode(response.body)['drinks'].map(
          (x) => Drink.fromMap(x),
        ),
      ));
    });
  }

  Future<void> _alchololService(String uri) async {
    await _fetchDrinks(uri);
  }

  Future<void> _nonAlchololService(String uri) async {
    await _fetchDrinks(uri);
  }

  init() async {
    await _alchololService('https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Alcoholic');
    await _nonAlchololService('https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Non_Alcoholic');
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                title: Text(
                  style: const TextStyle(color: Colors.black),
                  widget.title,
                ),
                automaticallyImplyLeading: false,
                floating: true,
                snap: true,
              )
            ];
          },
          body: drinks.isNotEmpty
              ? ListView(
                  padding: const EdgeInsets.only(right: 8, left: 8, bottom: 20),
                  children: drinks
                      .map((e) => CustomCardWidget(
                          imageName: e.imageUrl,
                          name: e.name,
                          category: e.category ?? "-",
                          isFavorite: e.isFavorite,
                          hasWarning: true,
                          onTap: () {
                            setState(() {
                              e.isFavorite = !e.isFavorite;
                            });
                          }))
                      .toList())
              : const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
