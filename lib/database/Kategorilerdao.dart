import '../models/Kategoriler.dart';
import 'DatabaseHelper.dart';

class Kategorilerdao {

  Future<List<Kategoriler>> allKategoriler() async {
    var db = await DatabaseHelper.databaseAccess();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM kategoriler");

    return List.generate(maps.length, (i) {

      var row = maps[i];

      return Kategoriler(row["kategori_id"], row["kategori_name"], row["kategori_image"]);

    });
  }

}