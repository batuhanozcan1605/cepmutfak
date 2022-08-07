import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../database/Urunlerdao.dart';
import '../models/Kategoriler.dart';
import '../models/Urunler.dart';

class UrunlerScreen extends StatefulWidget {
  int kategori;

  UrunlerScreen({required this.kategori});

  @override
  State<UrunlerScreen> createState() => _UrunlerScreenState();
}

class _UrunlerScreenState extends State<UrunlerScreen> {

  Future<List<Urunler>> showUrunler(int kategori_id) async {
    print("showurunler");
    var urunlerListesi= await Urunlerdao().allUrunlerByKategoriId(kategori_id);
    return urunlerListesi;
  }

  Future<List<Urunler>> searchUrunler(String query) async {
    var urunlerListesi= await Urunlerdao().urunSearch();
    return urunlerListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: FutureBuilder<List<Urunler>>(
          future: showUrunler(widget.kategori),
          builder: (context,snapshot) {
            if(snapshot.hasData) {
              var urunlerListesi = snapshot.data;
              return GridView.builder(
                padding: const EdgeInsets.all(10),
                shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1,
                  ),
                  itemCount: urunlerListesi!.length,
                  itemBuilder: (context,index){
                    var urun = urunlerListesi[index];
                    return GestureDetector(
                      onTap: (){

                      },
                      child: urunCard(urun.urun_name, urun.urun_image)
                    );
                  });
            } else {
              return Center(child: Text(""));
            }
          }
        ),
      );

  }

  Widget urunCard(String urun_name, String urun_image) => Card(
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      children: [
        Flexible(
          child: Image.asset('images/${urun_image}'),
          flex: 3,
        ),
        Flexible(
          flex: 1,
            child: Container(
              height: 25,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: FittedBox(
                    fit: BoxFit.fitHeight,
                    child: Text(
                      urun_name,
                      style: const TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 12,
                        color: const Color(0xff013440),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ),
      ],
    ),
  );
}
