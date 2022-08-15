import 'package:cepmutfak/providers/TapCardsMutfakModel.dart';
import 'package:cepmutfak/screens/buzdolabi_screen.dart';
import 'package:cepmutfak/screens/dondurucu_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'kiler_screen.dart';

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
      child: Consumer<TapCardsMutfakModel>(
        builder: (context, tapCardsMutfakObject, child) {
        return Scaffold(
          appBar: tapCardsMutfakObject.isTappingInMutfak() ?
          AppBar(
            backgroundColor: Color(0xFF013440),
            title: Center(),
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                    onPressed: (){
                  tapCardsMutfakObject.clearIdList();
                  tapCardsMutfakObject.regenerateMap();
                 },
                    icon: Icon(Icons.cancel_outlined));
              },
            ),
            actions: [
              IconButton(
                  onPressed: (){

               },
                  icon: Icon(
                    Icons.delete,
                  )),
              IconButton(onPressed: (){

               },
                  icon: Icon(
                    Icons.swap_horiz_rounded,
                  )),
            ],
              bottom: TabBar(
                tabs: [
                  Tab(text: 'BUZDOLABI'),
                  Tab(text: 'KILER'),
                  Tab(text: 'DONDURUCU'),
                ],
          ))
              :
          AppBar(
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
                KilerScreen(),
                DondurucuScreen(),
              ],
              ),
        );
        }
      ),
    );
  }
}
