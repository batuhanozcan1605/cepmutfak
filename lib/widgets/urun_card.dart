import 'package:flutter/material.dart';

class UrunCard extends StatelessWidget {

  final String urun_name;
  final String urun_image;
  final onTap;
  final bool tapped;

  UrunCard(this.urun_name, this.urun_image, this.onTap, this.tapped);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Flexible(
              child: Image.asset('images/${urun_image}'),
              flex: 3,
            ),
            Flexible(
              flex: 1,
              child: Container(
                height: 25,
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
      ),
    );
  }
}
