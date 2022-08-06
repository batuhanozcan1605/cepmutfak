import 'package:cepmutfak/database/Urunlerdao.dart';
import 'package:cepmutfak/models/Urunler.dart';
import 'package:flutter/material.dart';
import 'screens.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {

  int currentindex = 0;
  final screens = [
    DolapScreen(),
    EkleScreen(),
    ListScreen(),
  ];

  /*Future<void> urunleriPrintleGoster() async {
    var liste = await Urunlerdao().allUrunlerByKategoriId(1);

    for(Urunler f in liste) {
      print("***********");
      print("Kişi id: ${f.urun_id}");
      print("Kişi id: ${f.urun_name}");

    }
  }

  @override
  void initState() {
    super.initState();
  urunleriPrintleGoster();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentindex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
            )
          ]
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
         ),
         child: BottomNavigationBar(
          elevation: 10,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color(0xFF4D818C),
          unselectedItemColor: Color(0xFF4D818C).withOpacity(0.5),
          currentIndex: currentindex,
          onTap: (index) => setState(() => currentindex = index),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.kitchen),
              label: 'Mutfak',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle),
              label: 'Ekle',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt),
              label: 'Liste',
            ),
          ],
        ),
      ),
    ),
    );
  }
}
