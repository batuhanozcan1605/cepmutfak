import 'Kategoriler.dart';

class Urunler {
  int urun_id;
  String urun_name;
  String urun_image;
  String place;
  int? expiration;
  Kategoriler kategori;
  int? content;

  Urunler(this.urun_id, this.urun_name, this.urun_image, this.place,
      this.expiration, this.kategori, this.content);


}