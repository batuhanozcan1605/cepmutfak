import 'package:cepmutfak/screens/buzdolabi_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MutfakScreen extends StatefulWidget {
  const MutfakScreen({Key? key}) : super(key: key);

  @override
  State<MutfakScreen> createState() => _MutfakScreenState();
}


class _MutfakScreenState extends State<MutfakScreen>  {


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF4D818C),
          title: SvgPicture.asset('images/appbar_logo.svg'),
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
              BuzdolabiScreen(),
              Center(child: Text('Page 2',),),
              Center(child: Text('Page 3',),),
            ],
            ),
      ),
    );
  }
}
