import 'package:adobe_xd/pinned.dart';
import 'package:flutter/cupertino.dart';

class UrunCard extends StatelessWidget {
  String urun_name;

  UrunCard(this.urun_name);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x1a000000),
                  offset: Offset(0, 3),
                  blurRadius: 6,
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/nugget.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
            ),
            margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 25.0),
          ),
          Pinned.fromPins(
            Pin(size: 46.0, middle: 0.5),
            Pin(size: 16.0, end: 4.0),
            child: Text(
              urun_name,
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 12,
                color: const Color(0xff013440),
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
              softWrap: false,
            ),
          ),
        ],
      ),
    );
  }
}
