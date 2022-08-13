import 'package:flutter/foundation.dart';

class TapCardsModel extends ChangeNotifier {

  final boolList = List<bool>.generate(4, (index) => false);

  late Map<int, List> tapMap = {
    1 : boolList,
    2: boolList,
    3: boolList,
    4: boolList,
  };

  /*

  List<List<bool>> tapList = [
    [false, false, false, false],
    [false, false, false, false],
    [false, false, false, false],
  ];

  List<bool> tapList1 = [false, false, false, false];
  List<bool> tapList2 = [false, false, false, false];
  List<bool> tapList4 = [false, false, false, false];*/

  Map<int, List> readTapMap() {
    return tapMap;
  }

  void changeBoolList(int index, int key, bool tapped) {
    tapMap[key]![index] = tapped;
    notifyListeners();
  }

  /*List<List<bool>> readTapList() {
    return tapList;
  }*/

}