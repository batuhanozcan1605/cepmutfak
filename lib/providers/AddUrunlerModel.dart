import 'package:flutter/foundation.dart';
import '../database/Urunlerdao.dart';

class AddUrunlerModel extends ChangeNotifier {

  final idListToMutfak = List.generate(0, (index) => 0, growable: true);

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

  Future<void> addBatchToMutfak() async {
    for(int i = 0; i <= idListToMutfak.length; i++) {
       await Urunlerdao.updateContentStatic(idListToMutfak[i],1);
    }
    notifyListeners();
  }

}