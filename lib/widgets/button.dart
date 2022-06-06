import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HesapMakinesiButonu extends StatelessWidget {
  final String metin;
  final int dolguRengi;
  final int metinRengi;
  final double metinBoyutu;
  final Function tiklama;

  const HesapMakinesiButonu(
      {required this.metin,
      required this.dolguRengi,
      required this.metinRengi,
      required this.metinBoyutu,
      required this.tiklama});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      child: SizedBox(
        width: 80,
        height: 70,
        child: ElevatedButton(
          onPressed: () {
            tiklama(metin);
          },
          child: Text(
            metin,
            style: GoogleFonts.arapey(
              textStyle: TextStyle(
                fontSize: metinBoyutu,
              ),
            ),
          ),
          style: ElevatedButton.styleFrom(
              primary: Color(dolguRengi),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              )),
        ),
      ),
    );
  }
}
