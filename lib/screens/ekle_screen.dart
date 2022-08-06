import 'package:cepmutfak/database/Kategorilerdao.dart';
import 'package:cepmutfak/database/Urunlerdao.dart';
import 'package:cepmutfak/screens/urunler_screen.dart';
import 'package:flutter/material.dart';
import '../models/Kategoriler.dart';
import '../models/Urunler.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EkleScreen extends StatefulWidget {
  const EkleScreen({Key? key}) : super(key: key);

  @override
  State<EkleScreen> createState() => _EkleScreenState();
}

class _EkleScreenState extends State<EkleScreen> {
  final controller = TextEditingController();
  bool onTappedSearch = false;

  Future<List<Kategoriler>> showAllKategoriler() async {
    var kategoriListesi = await Kategorilerdao().allKategoriler();
    return kategoriListesi;
  }

  Future<List<Urunler>> searchUrunler() async {
    print("object1");
    var urunlerListesi = await Urunlerdao().urunSearch();
    print("object");
    return urunlerListesi;
  }

  Future<List<Urunler>> showUrunler(int kategori_id) async {
    var urunlerListesi = await Urunlerdao().allUrunlerByKategoriId(kategori_id);
    return urunlerListesi;
  }

  /*Future<void> kategoriGoster() async {
    var liste = await Kategorilerdao().allKategoriler();

    for(Kategoriler k in liste) {
      print("***********");
      print("Kişi id: ${k.kategori_id}");
      print("Kişi id: ${k.kategori_name}");

    }
  }

  @override
  void initState() {
    super.initState();
    kategoriGoster();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4D818C),
        title: Text('Cep Mutfak'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: const Color(0x1a000000),
                  offset: Offset(0, 3),
                  blurRadius: 6,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 11, 20, 11),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Ürün ekle',
                  suffixIcon: onTappedSearch
                      ? IconButton(
                          icon: Icon(Icons.cancel),
                          onPressed: () {},
                        )
                      : Center(),
                ),
                //onChanged: searchUrunler,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: SizedBox(
              height: 80,
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                        child: SvgPicture.asset('images/icon_ekle.svg')),
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Kendine Özel Ürün Ekle',
                          style: TextStyle(
                            fontFamily: 'Segoe UI',
                            fontSize: 15,
                            color: const Color(0xff013440),
                            fontWeight: FontWeight.w600,
                          )
                            ),
                          Text('(Öncelikle arama kısmından kontrol edin.)',
                              style: TextStyle(
                                fontFamily: 'Segoe UI',
                                fontSize: 10,
                                color: const Color(0xFF4D818C),
                              )
                          )
                        ],
                      ),
                    )
                  ]
                ),

            ),
          ),
          ),
          onTappedSearch
              ? Expanded(
                  child: FutureBuilder<List<Urunler>>(
                  future: searchUrunler(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var urunlerList = snapshot.data;
                      return ListView.builder(
                          itemCount: urunlerList!.length,
                          itemBuilder: (context, index) {
                            var urunler = urunlerList[index];
                            return Text(urunler.urun_name);
                          });
                    } else {
                      return const Center(child: Text("No data"));
                    }
                  },
                ))
              : Expanded(
                  child: FutureBuilder<List<Kategoriler>>(
                      future: showAllKategoriler(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          var kategoriList = snapshot.data;
                          return GridView.builder(
                              padding: const EdgeInsets.all(20),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 5 / 2),
                              itemCount: kategoriList!.length,
                              itemBuilder: (context, index) {
                                var kategori = kategoriList[index];
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => UrunlerScreen(
                                                  kategori: kategori,
                                                )));
                                  },
                                  child: kategoriCard(kategori.kategori_name),
                                );
                              });
                        } else {
                          return const Center(child: Text("No data"));
                        }
                      }),
                ),
        ],
      ),
    );
  }
  Widget kategoriCard(String kategori_name) => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Align(
                alignment: Alignment.bottomLeft,
                child: SizedBox(
                    width: 65,
                    height: 56,
                    child: Image.asset('images/meyveler.png'))),
            Align(
              alignment: Alignment(0.509, 0.0),
              child: Text(
                kategori_name,
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 12,
                  color: const Color(0xff013440),
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
                softWrap: false,
              ),
            ),
          ],
        ),
      );
}
