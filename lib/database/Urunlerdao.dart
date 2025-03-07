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

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM urunler,kategoriler WHERE urunler.kategori_id = kategoriler.kategori_id and "
        "urun_name like '%$query%'");

    return List.generate(maps.length, (i) {

      var row = maps[i];
      var k = Kategoriler(row["kategori_id"], row["kategori_name"], row["kategori_image"]);

      return Urunler(row["urun_id"], row["urun_name"], row["urun_image"], row["place"], row["expiration"], k, row["content"]);

    });
  }

  Future<void> updateContent(int urun_id, int content) async {
    var db = await DatabaseHelper.databaseAccess();

    var info = Map<String, dynamic>();
    info["content"] = content;
    print("info formed");
    await db.update("urunler", info, where: "urun_id = ?", whereArgs: [urun_id]);
    print("test: $urun_id");
  }

  static Future<void> updateContentStatic(int urun_id, int content) async {
    var db = await DatabaseHelper.databaseAccess();

    var info = Map<String, dynamic>();
    info["content"] = content;

    await db.update("urunler", info, where: "urun_id = ?", whereArgs: [urun_id]);
  }

  Future<void> updateBatchContent(List idList, content) async {
    var db = await DatabaseHelper.databaseAccess();

    var info = Map<String, dynamic>();
    info["content"] = content;
    print("test: info has formed");
    for(var i=0; i <= idList.length-1; i++){
      print("test: in for, $i");
    await db.update("urunler", info, where: "urun_id = ?", whereArgs: [idList[i]]);
    }
  }

}