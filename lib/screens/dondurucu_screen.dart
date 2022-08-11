import 'package:flutter/cupertino.dart';

import '../widgets/content_builder.dart';

class DondurucuScreen extends StatefulWidget {
  const DondurucuScreen({Key? key}) : super(key: key);

  @override
  State<DondurucuScreen> createState() => _DondurucuScreenState();
}

class _DondurucuScreenState extends State<DondurucuScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollDirection: Axis.vertical,
      slivers: [
        SliverToBoxAdapter(
          child: ContentBuilder(1, "Meyveler", "dondurucu"),
        ),
        SliverToBoxAdapter(
          child: ContentBuilder(2, "Sebzeler", "dondurucu"),
        ),
        SliverToBoxAdapter(
          child: ContentBuilder(3, "Fırın", "dondurucu"),
        ),
        SliverToBoxAdapter(
          child: ContentBuilder(4, "Mandıra", "dondurucu"),
        ),
        SliverToBoxAdapter(
          child: ContentBuilder(5, "İçecekler", "dondurucu"),
        ),
        SliverToBoxAdapter(
          child: ContentBuilder(6, "Etler", "dondurucu"),
        ),
        SliverToBoxAdapter(
          child: ContentBuilder(7, "Atıştırmalıklar", "dondurucu"),
        ),
        SliverToBoxAdapter(
          child: ContentBuilder(8, "Alkollü İçecekler", "dondurucu"),
        ),
        SliverToBoxAdapter(
          child: ContentBuilder(9, "Çerezler", "dondurucu"),
        ),
        SliverToBoxAdapter(
          child: ContentBuilder(10, "Yağlar", "dondurucu"),
        ),
        SliverToBoxAdapter(
          child: ContentBuilder(11, "Deniz Ürünleri", "dondurucu"),
        ),
        SliverToBoxAdapter(
          child: ContentBuilder(12, "Baklalar", "dondurucu"),
        ),
        SliverToBoxAdapter(
          child: ContentBuilder(13, "Baharatlar", "dondurucu"),
        ),
        SliverToBoxAdapter(
          child: ContentBuilder(14, "Soslar", "dondurucu"),
        ),
      ],
    );
  }
}
