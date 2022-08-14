import 'package:flutter/foundation.dart';

class TapCardsModel extends ChangeNotifier {

  static int maxUrunCountInAKategori = 4;
  final boolList1 = List<bool>.generate(maxUrunCountInAKategori, (index) => false);
  final boolList2 = List<bool>.generate(maxUrunCountInAKategori, (index) => false);
  final boolList3 = List<bool>.generate(maxUrunCountInAKategori, (index) => false);
  final boolList4 = List<bool>.generate(maxUrunCountInAKategori, (index) => false);
  final boolList5 = List<bool>.generate(maxUrunCountInAKategori, (index) => false);
  final boolList6 = List<bool>.generate(maxUrunCountInAKategori, (index) => false);
  final boolList7 = List<bool>.generate(maxUrunCountInAKategori, (index) => false);
  final boolList8 = List<bool>.generate(maxUrunCountInAKategori, (index) => false);
  final boolList9 = List<bool>.generate(maxUrunCountInAKategori, (index) => false);
  final boolList10 = List<bool>.generate(maxUrunCountInAKategori, (index) => false);
  final boolList11 = List<bool>.generate(maxUrunCountInAKategori, (index) => false);
  final boolList12 = List<bool>.generate(maxUrunCountInAKategori, (index) => false);
  final boolList13 = List<bool>.generate(maxUrunCountInAKategori, (index) => false);
  final boolList14 = List<bool>.generate(maxUrunCountInAKategori, (index) => false);

  late Map<int, List> tapMap = {
    1 : boolList1,
    2 : boolList2,
    3 : boolList3,
    4 : boolList4,
    5 : boolList5,
    6 : boolList6,
    7 : boolList7,
    8 : boolList8,
    9 : boolList9,
    10 : boolList10,
    11 : boolList11,
    12 : boolList12,
    13 : boolList13,
    14 : boolList14
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

  Map<int, List> generateMap() {
    for(var i=1; i<=14; i++) {
      tapMap[i] = List<bool>.generate(maxUrunCountInAKategori, (index) => false);
    }
    return tapMap;
  }

  void regenerateMap() {
    tapMap = generateMap();
    notifyListeners();
  }


  /*List<List<bool>> readTapList() {
    return tapList;
  }*/

}