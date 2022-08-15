import 'package:flutter/foundation.dart';

class TapCardsMutfakModel extends ChangeNotifier {

  final idListInMutfak = List.generate(0, (index) => 0, growable: true);

  static int maxUrunCountInAKategori = 4;
  final boolList1 = List<bool>.generate(
      maxUrunCountInAKategori, (index) => false);
  final boolList2 = List<bool>.generate(
      maxUrunCountInAKategori, (index) => false);
  final boolList3 = List<bool>.generate(
      maxUrunCountInAKategori, (index) => false);
  final boolList4 = List<bool>.generate(
      maxUrunCountInAKategori, (index) => false);
  final boolList5 = List<bool>.generate(
      maxUrunCountInAKategori, (index) => false);
  final boolList6 = List<bool>.generate(
      maxUrunCountInAKategori, (index) => false);
  final boolList7 = List<bool>.generate(
      maxUrunCountInAKategori, (index) => false);
  final boolList8 = List<bool>.generate(
      maxUrunCountInAKategori, (index) => false);
  final boolList9 = List<bool>.generate(
      maxUrunCountInAKategori, (index) => false);
  final boolList10 = List<bool>.generate(
      maxUrunCountInAKategori, (index) => false);
  final boolList11 = List<bool>.generate(
      maxUrunCountInAKategori, (index) => false);
  final boolList12 = List<bool>.generate(
      maxUrunCountInAKategori, (index) => false);
  final boolList13 = List<bool>.generate(
      maxUrunCountInAKategori, (index) => false);
  final boolList14 = List<bool>.generate(
      maxUrunCountInAKategori, (index) => false);

  late Map<int, List> tapMapBuzdolabi = {
    1: boolList1,
    2: boolList2,
    3: boolList3,
    4: boolList4,
    5: boolList5,
    6: boolList6,
    7: boolList7,
    8: boolList8,
    9: boolList9,
    10: boolList10,
    11: boolList11,
    12: boolList12,
    13: boolList13,
    14: boolList14
  };

  late Map<int, List> tapMapKiler = {
    1: boolList1,
    2: boolList2,
    3: boolList3,
    4: boolList4,
    5: boolList5,
    6: boolList6,
    7: boolList7,
    8: boolList8,
    9: boolList9,
    10: boolList10,
    11: boolList11,
    12: boolList12,
    13: boolList13,
    14: boolList14
  };

  late Map<int, List> tapMapDondurucu = {
    1: boolList1,
    2: boolList2,
    3: boolList3,
    4: boolList4,
    5: boolList5,
    6: boolList6,
    7: boolList7,
    8: boolList8,
    9: boolList9,
    10: boolList10,
    11: boolList11,
    12: boolList12,
    13: boolList13,
    14: boolList14
  };

  late Map<String, Map<int, List>> tapMapMutfak = {
    'buzdolabi': tapMapBuzdolabi,
    'kiler': tapMapKiler,
    'dondurucu': tapMapDondurucu,
  };


  Map<int, List> readTapMapBuzdolabi() {
    return tapMapBuzdolabi;
  }

  void changeBoolListBuzdolabi(int index, int key, bool tapped) {
    tapMapBuzdolabi[key]![index] = tapped;
    notifyListeners();
  }

  Map<int, List> readTapMapKiler() {
    return tapMapKiler;
  }

  void changeBoolListKiler(int index, int key, bool tapped) {
    tapMapKiler[key]![index] = tapped;
    notifyListeners();
  }

  Map<int, List> readTapMapDondurucu() {
    return tapMapDondurucu;
  }

  void changeBoolListDondurucu(int index, int key, bool tapped) {
    tapMapDondurucu[key]![index] = tapped;
    notifyListeners();
  }

  void tapCollectorMutfak(place, kategori_id, index) {
    switch(place) {
      case 'buzdolabi' : {
        changeBoolListBuzdolabi(index, kategori_id, !tapMapMutfak[place]![kategori_id]![index]);
      }
      break;

      case 'kiler' : {
        changeBoolListKiler(index, kategori_id, !tapMapMutfak[place]![kategori_id]![index]);
      }
      break;

      case 'dondurucu' : {
        changeBoolListDondurucu(index, kategori_id, !tapMapMutfak[place]![kategori_id]![index]);
      }
      break;
    }
    notifyListeners();
  }

  List readIdListInMutfak() {
    return idListInMutfak;
  }

  void addToIdList(urun_id) async {
    idListInMutfak.add(urun_id);
    notifyListeners();
  }

  void removeIdFromList(urun_id) async {
    idListInMutfak.remove(urun_id);
    notifyListeners();
  }

  bool isTappingInMutfak() {
    if(idListInMutfak.isEmpty) {

      return false;
    } else {

      return true;
    }
  }

  void clearIdList() {
    idListInMutfak.clear();
    notifyListeners();
  }

  void regenerateMap() {
    for(var i=1; i<=14; i++) {
      tapMapBuzdolabi[i] = List<bool>.generate(maxUrunCountInAKategori, (index) => false);
    }
    for(var i=1; i<=14; i++) {
      tapMapKiler[i] = List<bool>.generate(maxUrunCountInAKategori, (index) => false);
    }
    for(var i=1; i<=14; i++) {
      tapMapDondurucu[i] = List<bool>.generate(maxUrunCountInAKategori, (index) => false);
    }
  }
}