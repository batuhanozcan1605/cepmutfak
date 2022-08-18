import 'package:flutter/foundation.dart';
import '../database/Urunlerdao.dart';

class AddUrunlerModel extends ChangeNotifier {

  final idListToMutfak = <int>[];

  List readIdListToMutfak() {
    return idListToMutfak;
  }

  void addToIdList(urun_id) async {
    idListToMutfak.add(urun_id);
    notifyListeners();
  }

  void removeIdFromList(urun_id) async {
    idListToMutfak.remove(urun_id);
    notifyListeners();
  }

 Future<void> addBatchToMutfak(idList) async {
   for(int urun_id in idList) {
     print("test: ${idList}, $urun_id");
     await Urunlerdao().updateContent(urun_id, 1);
   }
    notifyListeners();
  }

}