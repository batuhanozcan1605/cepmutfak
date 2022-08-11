import 'package:cepmutfak/widgets/content_builder.dart';
import 'package:flutter/cupertino.dart';

class KilerScreen extends StatefulWidget {
  const KilerScreen({Key? key}) : super(key: key);

  @override
  State<KilerScreen> createState() => _KilerScreenState();
}

class _KilerScreenState extends State<KilerScreen> {

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: ContentBuilder(1, "Meyveler", "kiler"),
        ),
        SliverToBoxAdapter(
          child: ContentBuilder(2, "Sebzeler", "kiler"),
        ),
        SliverToBoxAdapter(
          child: ContentBuilder(3, "Fırın", "kiler"),
        ),
        SliverToBoxAdapter(
          child: ContentBuilder(4, "Mandıra", "kiler"),
        ),
        SliverToBoxAdapter(
          child: ContentBuilder(5, "İçecekler", "kiler"),
        ),
        SliverToBoxAdapter(
          child: ContentBuilder(6, "Etler", "kiler"),
        ),
        SliverToBoxAdapter(
          child: ContentBuilder(7, "Atıştırmalıklar", "kiler"),
        ),
        SliverToBoxAdapter(
          child: ContentBuilder(8, "Alkollü İçecekler", "kiler"),
        ),
        SliverToBoxAdapter(
          child: ContentBuilder(9, "Çerezler", "kiler"),
        ),
        SliverToBoxAdapter(
          child: ContentBuilder(10, "Yağlar", "kiler"),
        ),
        SliverToBoxAdapter(
          child: ContentBuilder(11, "Deniz Ürünleri", "kiler"),
        ),
        SliverToBoxAdapter(
          child: ContentBuilder(12, "Baklalar", "kiler"),
        ),
        SliverToBoxAdapter(
          child: ContentBuilder(13, "Baharatlar", "kiler"),
        ),
        SliverToBoxAdapter(
          child: ContentBuilder(14, "Soslar", "kiler"),
        ),
      ],
    );
  }
}
