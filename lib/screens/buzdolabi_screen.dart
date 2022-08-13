import 'package:cepmutfak/models/Urunler.dart';
import 'package:cepmutfak/widgets/content_builder.dart';
import 'package:cepmutfak/widgets/static_widgets.dart';
import 'package:flutter/cupertino.dart';
import '../database/Urunlerdao.dart';

class BuzdolabiScreen extends StatefulWidget {
  const BuzdolabiScreen({Key? key}) : super(key: key);

  @override
  State<BuzdolabiScreen> createState() => _BuzdolabiScreenState();
}

class _BuzdolabiScreenState extends State<BuzdolabiScreen> {

  Future<List<Urunler>> showContent(int kategori_id, place) async {
    var urunlerListesi = await Urunlerdao().urunlerContent(kategori_id, place);
    return urunlerListesi;
  }

  /*Future<void> checkContent() async {
    for (var i = 1; i <= 14; i++) {
      var list = await Urunlerdao().allUrunlerByKategoriId(i);

      for (Urunler u in list) {
        print("${u.urun_name}:${u.content}");
      }
    }
  }

  @override
  void initState() {
    super.initState();
    checkContent();
  }*/

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollDirection: Axis.vertical,
      slivers: [
        SliverToBoxAdapter(
          child: ContentBuilder(1, "Meyveler", "buzdolabi"),
        ),
        SliverToBoxAdapter(
          child: ContentBuilder(2, "Sebzeler", "buzdolabi"),
        ),
        SliverToBoxAdapter(
          child: ContentBuilder(3, "Fırın", "buzdolabi"),
        ),
        SliverToBoxAdapter(
          child: ContentBuilder(4, "Mandıra", "buzdolabi"),
        ),
        SliverToBoxAdapter(
          child: ContentBuilder(5, "İçecekler", "buzdolabi"),
        ),
        SliverToBoxAdapter(
          child: ContentBuilder(6, "Etler", "buzdolabi"),
        ),
        SliverToBoxAdapter(
          child: ContentBuilder(7, "Atıştırmalıklar", "buzdolabi"),
        ),
        SliverToBoxAdapter(
          child: ContentBuilder(8, "Alkollü İçecekler", "buzdolabi"),
        ),
        SliverToBoxAdapter(
          child: ContentBuilder(9, "Çerezler", "buzdolabi"),
        ),
        SliverToBoxAdapter(
          child: ContentBuilder(10, "Yağlar", "buzdolabi"),
        ),
        SliverToBoxAdapter(
          child: ContentBuilder(11, "Deniz Ürünleri", "buzdolabi"),
        ),
        SliverToBoxAdapter(
          child: ContentBuilder(12, "Baklalar", "buzdolabi"),
        ),
        SliverToBoxAdapter(
          child: ContentBuilder(13, "Baharatlar", "buzdolabi"),
        ),
        SliverToBoxAdapter(
          child: ContentBuilder(14, "Soslar", "buzdolabi"),
        ),
      ],
    );
  }

}