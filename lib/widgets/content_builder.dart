import 'package:cepmutfak/providers/TapCardsModel.dart';
import 'package:cepmutfak/providers/TapCardsMutfakModel.dart';
import 'package:cepmutfak/widgets/static_widgets.dart';
import 'package:cepmutfak/widgets/urun_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../database/Urunlerdao.dart';
import '../models/Urunler.dart';

class ContentBuilder extends StatefulWidget {
  int kategori_id;
  String kategori_name;
  String place;

  ContentBuilder(this.kategori_id, this.kategori_name, this.place);

  @override
  State<ContentBuilder> createState() => _ContentBuilderState();
}

class _ContentBuilderState extends State<ContentBuilder> {

  Future<List<Urunler>> showContent(int kategori_id, place) async {
    var urunlerListesi= await Urunlerdao().urunlerContent(kategori_id, place);
    return urunlerListesi;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Urunler>>(
        future: showContent(widget.kategori_id, widget.place),
        builder: (context,snapshot) {
          if (snapshot.hasData) {
            var urunlerListesi = snapshot.data;
            if(urunlerListesi!.length != 0)  {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0, top: 10),
                    child: Text(widget.kategori_name,
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 15,
                        color: const Color(0xff013440),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(10),
                      shrinkWrap: true,
                      itemCount: urunlerListesi.length,
                      itemBuilder: (context,index){
                        var urun = urunlerListesi[index];
                        return Consumer<TapCardsMutfakModel>(
                          builder: (contex, tapCardMutfakObject,child) {
                            return GestureDetector(
                              onTap: () {
                                tapCardMutfakObject.tapCollectorMutfak(widget.place, widget.kategori_id, index);
                                //tapCardMutfakObject.tapMapMutfak[widget.place]![widget.kategori_id]![index] ?
                              },
                              child: StaticWidgets.urunCardMutfak(
                                  urun.urun_name,
                                  urun.urun_image,
                                  tapCardMutfakObject.tapMapMutfak[widget.place]![widget.kategori_id]![index]),
                            );
                          });
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      )
                  ),
                ],
              );
            } else {
              return Center();
            }
          }  else {
            return Center(child: Text(""));
          }
        }
    );
  }
}
