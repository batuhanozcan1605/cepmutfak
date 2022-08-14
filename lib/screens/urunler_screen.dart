import 'package:cepmutfak/providers/AddUrunlerModel.dart';
import 'package:cepmutfak/providers/TapCardsModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../database/Urunlerdao.dart';
import '../models/Urunler.dart';
import '../widgets/static_widgets.dart';

class UrunlerScreen extends StatefulWidget {
  int kategori;

  UrunlerScreen({required this.kategori});

  @override
  State<UrunlerScreen> createState() => _UrunlerScreenState();
}

class _UrunlerScreenState extends State<UrunlerScreen> {
  Future<List<Urunler>> showUrunler(int kategori_id) async {
    var urunlerListesi = await Urunlerdao().allUrunlerByKategoriId(kategori_id);
    return urunlerListesi;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Urunler>>(
        future: showUrunler(widget.kategori),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var urunlerListesi = snapshot.data;
            return GridView.builder(
                padding: const EdgeInsets.all(10),
                shrinkWrap: true,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                ),
                itemCount: urunlerListesi!.length,
                itemBuilder: (context, index) {
                  var urun = urunlerListesi[index];
                  return Consumer2<TapCardsModel, AddUrunlerModel>(
                      builder: (context, tapCardObject, addUrunlerObject, child) {
                    return GestureDetector(
                        onTap: () {
                          if (tapCardObject.tapMap[widget.kategori]![index] == false) {
                            tapCardObject.changeBoolList(index, widget.kategori, true);
                            addUrunlerObject.addToIdList(urun.urun_id);
                          } else {
                            tapCardObject.changeBoolList(index, widget.kategori, false);
                            addUrunlerObject.removeIdFromList(urun.urun_id);
                          }
                        },
                        child: StaticWidgets.urunCard(
                            urun.urun_name,
                            urun.urun_image,
                            tapCardObject.tapMap[widget.kategori]![index]));
                  });
                });
          } else {
            return Center(child: Text(""));
          }
        });
  }
}
