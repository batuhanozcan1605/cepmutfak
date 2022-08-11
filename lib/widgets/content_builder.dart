import 'package:cepmutfak/widgets/widgets_class.dart';
import 'package:flutter/cupertino.dart';

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
                      padding: const EdgeInsets.all(10),
                      shrinkWrap: true,
                      itemCount: urunlerListesi.length,
                      itemBuilder: (context,index){
                        var urun = urunlerListesi[index];
                        return GestureDetector(
                          onTap: (){

                          },
                          child: Widgets.urunCard(urun.urun_name, urun.urun_image),
                        );
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
