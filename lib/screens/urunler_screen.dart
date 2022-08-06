import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../database/Urunlerdao.dart';
import '../models/Kategoriler.dart';
import '../models/Urunler.dart';

class UrunlerScreen extends StatefulWidget {
  Kategoriler kategori;

  UrunlerScreen({required this.kategori});

  @override
  State<UrunlerScreen> createState() => _UrunlerScreenState();
}

class _UrunlerScreenState extends State<UrunlerScreen> {

  final controller = TextEditingController();
  bool onChange = false;

  Future<List<Urunler>> showUrunler(int kategori_id) async {
    var urunlerListesi= await Urunlerdao().allUrunlerByKategoriId(kategori_id);
    return urunlerListesi;
  }

  Future<List<Urunler>> searchUrunler(String query) async {
    var urunlerListesi= await Urunlerdao().urunSearch();
    return urunlerListesi;
  }

  void onChangedText() {
    setState((){
      onChange = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4D818C),
        title: Text('Ürünler'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
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
                ),
                onChanged: (value) {
                  onChangedText();
            },
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Urunler>>(
              future: onChange ? searchUrunler(controller.toString()) : showUrunler(widget.kategori.kategori_id),
              builder: (context,snapshot) {
                if(snapshot.hasData) {
                  var urunlerListesi = snapshot.data;
                  return GridView.builder(
                    padding: EdgeInsets.all(8),
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
                          child: urunCard(urun.urun_name)
                        );
                      });
                } else {
                  return Center(child: Text("No data"));
                }
              }
            ),
          ),
        ],
      ),
    );
  }

  Widget urunCard(String urun_name) => Card(
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      children: [
        Flexible(
          child: Image.asset('images/karpuz.png'),
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
