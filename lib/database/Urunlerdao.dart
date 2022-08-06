import 'package:cepmutfak/database/DatabaseHelper.dart';
import 'package:cepmutfak/models/Urunler.dart';
import '../models/Kategoriler.dart';

class Urunlerdao {

  Future<List<Urunler>> allUrunlerByKategoriId(int kategori_id) async {
    var db = await DatabaseHelper.databaseAccess();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM urunler,kategoriler WHERE "
        "urunler.kategori_id = kategoriler.kategori_id and urunler.kategori_id = $kategori_id");

    return List.generate(maps.length, (i) {

      var row = maps[i];
      var k = Kategoriler(row["kategori_id"], row["kategori_name"], row["kategori_image"]);

      return Urunler(row["urun_id"], row["urun_name"], row["urun_image"], row["place"], row["expiration"], k);

    });
  }

  Future<List<Urunler>> urunSearch() async {
    var db = await DatabaseHelper.databaseAccess();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM urunler WHERE urun_name like '%n%'");

    return List.generate(maps.length, (i) {

      var row = maps[i];
      var k = Kategoriler(row["kategori_id"], row["kategori_name"], row["kategori_image"]);

      return Urunler(row["urun_id"], row["urun_name"], row["urun_image"], row["place"], row["expiration"], k);

    });
  }

}