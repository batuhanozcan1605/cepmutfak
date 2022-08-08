import 'package:cepmutfak/models/Urunler.dart';
import 'package:cepmutfak/widgets/widgets_class.dart';
import 'package:flutter/cupertino.dart';
import '../database/Urunlerdao.dart';

class BuzdolabiScreen extends StatefulWidget {
  const BuzdolabiScreen({Key? key}) : super(key: key);

  @override
  State<BuzdolabiScreen> createState() => _BuzdolabiScreenState();
}

class _BuzdolabiScreenState extends State<BuzdolabiScreen> {

  Future<List<Urunler>> showContent(int kategori_id, place) async {
    var urunlerListesi= await Urunlerdao().urunlerContent(kategori_id, place);
    return urunlerListesi;
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: contentBuilder(1, "Meyveler", "buzdolabi"),
        ),
        SliverToBoxAdapter(
          child: contentBuilder(2, "Sebzeler", "buzdolabi"),
        ),
      ],
    );
  }

  Widget contentBuilder(kategori_id, kategori_name, place) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 18.0, top: 10),
        child: Text(kategori_name,
        style: TextStyle(
          fontFamily: 'Segoe UI',
          fontSize: 15,
          color: const Color(0xff013440),
          fontWeight: FontWeight.w600,
        ),
        ),
      ),
      FutureBuilder<List<Urunler>>(
          future: showContent(kategori_id, place),
          builder: (context,snapshot) {
            if (snapshot.hasData) {
              var urunlerListesi = snapshot.data;
              return GridView.builder(
                  padding: const EdgeInsets.all(10),
                  shrinkWrap: true,
                  itemCount: urunlerListesi!.length,
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
              );
            }  else {
              return Center(child: Text("no data"));
            }
          }
      ),
    ],
  );
}
