import 'package:cepmutfak/providers/AddUrunlerModel.dart';
import 'package:cepmutfak/providers/TapCardsModel.dart';
import 'package:cepmutfak/providers/TapCardsMutfakModel.dart';
import 'package:cepmutfak/screens/nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TapCardsModel()),
        ChangeNotifierProvider(create: (context) => AddUrunlerModel()),
        ChangeNotifierProvider(create: (context) => TapCardsMutfakModel())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: const NavScreen(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}