import 'package:cepmutfak/providers/TapCardsModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../database/Urunlerdao.dart';
import '../models/Kategoriler.dart';
import '../models/Urunler.dart';
import '../widgets/widgets_class.dart';

class UrunlerScreen extends StatefulWidget {
  int kategori;

  UrunlerScreen({required this.kategori});

  @override
  State<UrunlerScreen> createState() => _UrunlerScreenState();
}

class _UrunlerScreenState extends State<UrunlerScreen> {

  Future<List<Urunler>> showUrunler(int kategori_id) async {
    var urunlerListesi= await Urunlerdao().allUrunlerByKategoriId(kategori_id);
    return urunlerListesi;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Urunler>>(
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
                return Consumer<TapCardsModel>(
                  builder: (context, tapCardObject, child){
                  return GestureDetector(
                    onTap: (){
                      tapCardObject.changeBoolList(index, widget.kategori, true);
                    },
                    child: Widgets.urunCard(urun.urun_name, urun.urun_image, index)
                  );
                  }
                );
              });
        } else {
          return Center(child: Text("no data"));
        }
      }
    );

  }
}
