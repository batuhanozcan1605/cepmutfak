import 'package:cepmutfak/screens/screens.dart';
import 'package:flutter/material.dart';

class DolapScreen extends StatefulWidget {
  const DolapScreen({Key? key}) : super(key: key);

  @override
  State<DolapScreen> createState() => _DolapScreenState();
}


class _DolapScreenState extends State<DolapScreen>  {


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF4D818C),
          title: Text('Cep Mutfak'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'BUZDOLABI'),
              Tab(text: 'KILER'),
              Tab(text: 'DONDURUCU'),
            ],
          ),
          centerTitle: true,
        ),
        body: TabBarView(
            children: [
              Center(child: Text('Page 1',),),
              Center(child: Text('Page 2',),),
              Center(child: Text('Page 3',),),
            ],
            ),
      ),
    );
  }
}
