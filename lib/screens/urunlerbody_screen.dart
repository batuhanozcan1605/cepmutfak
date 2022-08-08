import 'package:cepmutfak/models/Kategoriler.dart';
import 'package:cepmutfak/screens/urunler_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UrunlerBodyScreen extends StatefulWidget {

  Kategoriler kategori;

  UrunlerBodyScreen({required this.kategori});

  @override
  State<UrunlerBodyScreen> createState() => _UrunlerBodyScreenState();
}

class _UrunlerBodyScreenState extends State<UrunlerBodyScreen> with TickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: (widget.kategori.kategori_id - 1), length: 14, vsync: this);
  }

  /*@override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4D818C),
        title: Text('Ürünler'),
        centerTitle: true,
        bottom: TabBar(
          isScrollable: true,
          controller: _tabController,
          tabs: [
            Tab(text: 'Meyveler'),
            Tab(text: 'Sebzeler'),
            Tab(text: 'Fırın'),
            Tab(text: 'Mandıra'),
            Tab(text: 'İçecekler'),
            Tab(text: 'Etler'),
            Tab(text: 'Atıştırmalıklar'),
            Tab(text: 'Alkollü İçecekler'),
            Tab(text: 'Çerezler'),
            Tab(text: 'Yağlar'),
            Tab(text: 'Deniz Ürünler'),
            Tab(text: 'Baklalar'),
            Tab(text: 'Baharatlar'),
            Tab(text: 'Soslar'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          UrunlerScreen(kategori: 1),
          UrunlerScreen(kategori: 2),
          UrunlerScreen(kategori: 3),
          UrunlerScreen(kategori: 4),
          UrunlerScreen(kategori: 5),
          UrunlerScreen(kategori: 6),
          UrunlerScreen(kategori: 7),
          UrunlerScreen(kategori: 8),
          UrunlerScreen(kategori: 9),
          UrunlerScreen(kategori: 10),
          UrunlerScreen(kategori: 11),
          UrunlerScreen(kategori: 12),
          UrunlerScreen(kategori: 13),
          UrunlerScreen(kategori: 14),
        ],
      )
    );
  }
}
