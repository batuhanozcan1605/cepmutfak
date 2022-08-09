import 'package:cepmutfak/database/DatabaseHelper.dart';
import 'package:cepmutfak/models/Urunler.dart';
import '../models/Kategoriler.dart';

class Urunlerdao {

  Future<List<Urunler>> allUrunlerByKategoriId(int kategori_id) async {
    var db = await DatabaseHelper.databaseAccess();
    print("0object");
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM urunler,kategoriler WHERE "
        "urunler.kategori_id = kategoriler.kategori_id and urunler.kategori_id = $kategori_id");
    print("1object");
    return List.generate(maps.length, (i) {
      print("2object");
      var row = maps[i];
      var k = Kategoriler(row["kategori_id"], row["kategori_name"], row["kategori_image"]);

      return Urunler(row["urun_id"], row["urun_name"], row["urun_image"], row["place"], row["expiration"], k, row["content"]);

    });
  }

  Future<List<Urunler>> urunlerContent(int kategori_id, String place) async {
    var db = await DatabaseHelper.databaseAccess();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM urunler,kategoriler WHERE "
        "urunler.kategori_id = kategoriler.kategori_id and urunler.kategori_id = $kategori_id and urunler.content = 1 and urunler.place = '$place'");

    return List.generate(maps.length, (index) {

        var row = maps[index];
        var k = Kategoriler(row["kategori_id"], row["kategori_name"], row["kategori_image"]);

    return Urunler(row["urun_id"], row["urun_name"], row["urun_image"], row["place"], row["expiration"], k, row["content"]);

    });
  }

  Future<List<Urunler>> urunSearch(String query) async {
    var db = await DatabaseHelper.databaseAccess();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM urunler WHERE urun_name like '%$query%'");

    return List.generate(maps.length, (i) {

      var row = maps[i];
      var k = Kategoriler(row["kategori_id"], row["kategori_name"], row["kategori_image"]);

      return Urunler(row["urun_id"], row["urun_name"], row["urun_image"], row["place"], row["expiration"], k, row["content"]);

    });
  }

}