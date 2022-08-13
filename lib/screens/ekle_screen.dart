import 'package:cepmutfak/database/Kategorilerdao.dart';
import 'package:cepmutfak/database/Urunlerdao.dart';
import 'package:cepmutfak/screens/urunlerbody_screen.dart';
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

  String query = '';
  bool isSearching = false;


  Future<List<Kategoriler>> showAllKategoriler() async {
    var kategoriListesi = await Kategorilerdao().allKategoriler();
    return kategoriListesi;
  }

  Future<List<Urunler>> searchUrunler(query) async {

    var urunlerListesi = await Urunlerdao().urunSearch(query);
    return urunlerListesi;
  }

  Future<List<Urunler>> showUrunler(int kategori_id) async {
    var urunlerListesi = await Urunlerdao().allUrunlerByKategoriId(kategori_id);
    return urunlerListesi;
  }

  Future<void> urunMutfakta(urun_id) async {
    await Urunlerdao().updateContent(urun_id, 1);
  }

  Future<void>  urunMutfaktaDegil(urun_id) async {
    await Urunlerdao().updateContent(urun_id, 0);
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
    return WillPopScope(
      onWillPop: () async {
        if(isSearching) {
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF4D818C),
          title: SvgPicture.asset('images/appbar_logo.svg'),
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
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 6),
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Color(0xFF4D818C),
                    prefixIconColor: Color(0xFF4D818C),
                    prefixIcon: const Icon(Icons.search),
                    suffix: isSearching ? IconButton(
                      icon: const Icon(Icons.cancel),
                      onPressed: (){
                        setState(() {
                          isSearching = false;
                        });
                      },
                    ) : Center(),
                    hintText: 'Ürün ekle',
                  ),
                  onTap: (){
                    setState(() {
                      isSearching = true;
                    });
                  },
                  onChanged: (result){
                    setState(() {
                      query = result;
                      print(result);
                    });
                  },
                ),
              ),
            ),
             isSearching ? Center() : Padding(
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
                          children: const [
                            Text('Kendine Özel Ürün Ekle',
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 15,
                              color: Color(0xff013440),
                              fontWeight: FontWeight.w600,
                            )
                              ),
                            Text('(Öncelikle arama kısmından kontrol edin.)',
                                style: TextStyle(
                                  fontFamily: 'Segoe UI',
                                  fontSize: 10,
                                  color: Color(0xFF4D818C),
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
            isSearching ?
                Expanded(
                    child: FutureBuilder<List<Urunler>>(
                      future: searchUrunler(query),
                      builder: (context, snapshot) {
                        if(snapshot.hasData) {
                          var urunlerList = snapshot.data;
                          return ListView.builder(
                              itemCount: urunlerList!.length,
                              itemBuilder: (context, index) {
                                var urun = urunlerList[index];
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        child:
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(left:  10.0),
                                                child: Text(
                                                  urun.urun_name,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(right: 10.0),
                                                child: IconButton(
                                                  onPressed: (){
                                                    urunMutfakta(urun.urun_id);
                                                    final snackBar = SnackBar(
                                                        action: SnackBarAction(
                                                            label: 'Geri Al',
                                                            onPressed: (){
                                                              urunMutfaktaDegil(urun.urun_id);
                                                        }),
                                                        content: Text("${urun.urun_name} Mutfağa Eklendi",
                                                        style: TextStyle(
                                                          color: Colors.white70,
                                                         ),
                                                        ),
                                                        backgroundColor: Color(0xFF013440),
                                                    );
                                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                                  },
                                                    icon: Icon(Icons.add_circle, color: Color(0xFF4D818C),),
                                                ),
                                              ),
                                            ])
                                    ),
                                  );
                              }
                          );
                        } else {
                          return Center();
                        }
                      },
                    )
                )
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
                                              builder: (context) => UrunlerBodyScreen(
                                                    kategori: kategori,
                                                  )));
                                    },
                                    child: kategoriCard(kategori.kategori_name, kategori.kategori_image),
                                  );
                                });
                          } else {
                            return const Center(child: Text(""));
                          }
                        }),
                  ),
          ],
        ),
      ),
    );
  }
  Widget kategoriCard(String kategori_name, kategori_image) => Card(
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
                    child: Image.asset('images/kategoriler/${kategori_image}'))),
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
