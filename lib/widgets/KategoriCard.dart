import 'package:adobe_xd/pinned.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class KategoriCard extends StatelessWidget {

  String kategori_name;

  KategoriCard(this.kategori_name);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x29000000),
                  offset: Offset(3, 3),
                  blurRadius: 6,
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 60.0, start: 0.0),
            Pin(start: 8.0, end: 0.0),
            child: SvgPicture.string(
              '<svg viewBox="20.0 70.0 60.0 52.0" ><path transform="translate(-2338.0, 62.0)" d="M 2368 60.00030136108398 C 2362.4765625 60.00030136108398 2358 55.52280044555664 2358 50.00040054321289 L 2358 20.09023284912109 C 2364.237060546875 12.69730663299561 2373.57080078125 8.000100135803223 2384.000244140625 8.000100135803223 C 2402.77783203125 8.000100135803223 2418.000244140625 23.22270011901855 2418.000244140625 42.00030136108398 C 2418.000244140625 48.61096954345703 2416.1142578125 54.78008270263672 2412.849853515625 60.00030136108398 L 2368 60.00030136108398 Z" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: Alignment(0.574, 0.0),
            child: Text(
              kategori_name,
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 10,
                color: const Color(0xff013440),
                fontWeight: FontWeight.w600,
              ),
              softWrap: false,
            ),
          ),
        ],
      ),
    );
  }
}
