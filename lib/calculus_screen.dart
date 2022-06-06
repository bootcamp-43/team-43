import 'package:akademi_boot/widgets/button.dart';
import 'package:flutter/material.dart';

class HesapMakinesi extends StatefulWidget {
  const HesapMakinesi({Key? key}) : super(key: key);

  @override
  State<HesapMakinesi> createState() => _HesapMakinesiState();
}

class _HesapMakinesiState extends State<HesapMakinesi> {
  late int sayi1;
  late int sayi2;
  String gosterileceksayi = "";
  String islemgecmisi = "";
  late String sonuc;
  late String islemTutucu;

  void btnTiklama(String butonDegeriTutucu) {
    if (butonDegeriTutucu == "AC") {
      gosterileceksayi = "";
      sonuc = "";
      sayi1 = 0;
      sayi2 = 0;
      islemgecmisi = "";
      islemTutucu = "";
    } else if (butonDegeriTutucu == "C") {
      gosterileceksayi = "";
      sonuc = "";
      sayi1 = 0;
      sayi2 = 0;
    } else if (butonDegeriTutucu == "Back") {
      sonuc = gosterileceksayi.substring(0, gosterileceksayi.length - 1);
    } else if (butonDegeriTutucu == "=") {
      sayi2 = int.parse(gosterileceksayi);

      if (islemTutucu == "+") {
        sonuc = (sayi1 + sayi2).toString();
        islemgecmisi =
            sayi1.toString() + islemTutucu.toString() + sayi2.toString();
      } else if (islemTutucu == "-") {
        sonuc = (sayi1 - sayi2).toString();
        islemgecmisi =
            sayi1.toString() + islemTutucu.toString() + sayi2.toString();
      } else if (islemTutucu == "X") {
        sonuc = (sayi1 * sayi2).toString();
        islemgecmisi =
            sayi1.toString() + islemTutucu.toString() + sayi2.toString();
      } else if (islemTutucu == "/") {
        sonuc = (sayi1 / sayi2).toString();
        islemgecmisi =
            sayi1.toString() + islemTutucu.toString() + sayi2.toString();
      }
    } else if (butonDegeriTutucu == "/") {
      sayi1 = int.parse(gosterileceksayi);
      sonuc = "";
      islemTutucu = butonDegeriTutucu;
    } else if (butonDegeriTutucu == "X") {
      sayi1 = int.parse(gosterileceksayi);
      sonuc = "";
      islemTutucu = butonDegeriTutucu;
    } else if (butonDegeriTutucu == "-") {
      sayi1 = int.parse(gosterileceksayi);
      sonuc = "";
      islemTutucu = butonDegeriTutucu;
    } else if (butonDegeriTutucu == "+") {
      sayi1 = int.parse(gosterileceksayi);
      sonuc = "";
      islemTutucu = butonDegeriTutucu;
    } else if (butonDegeriTutucu == "+/-") {
      if (gosterileceksayi[0] != "-") {
        sonuc = "-" + gosterileceksayi;
      } else {
        sonuc = gosterileceksayi.substring(1);
      }
    } else {
      sonuc = int.parse(gosterileceksayi + butonDegeriTutucu).toString();
    }
    setState(() {
      gosterileceksayi = sonuc;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hesap Makinesi'),
        centerTitle: true,
        backgroundColor: const Color(0xFF2F8F9D),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            alignment: const Alignment(1.0, 1.0),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 12, 8),
              child: Text(
                islemgecmisi,
                style: (const TextStyle(
                  fontSize: 30,
                  color: Colors.black54,
                )),
              ),
            ),
          ),
          Container(
              alignment: const Alignment(1.0, 1.0),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 12, 8),
                child: Text(
                  gosterileceksayi,
                  style: (const TextStyle(
                    fontSize: 40,
                    color: Colors.black,
                  )),
                ),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HesapMakinesiButonu(
                metin: "AC",
                dolguRengi: 0xFF2F8F9D,
                metinRengi: 0xFF000000,
                metinBoyutu: 30.0,
                tiklama: btnTiklama,
              ),
              HesapMakinesiButonu(
                metin: "C",
                dolguRengi: 0xFF2F8F9D,
                metinRengi: 0xFF000000,
                metinBoyutu: 30.0,
                tiklama: btnTiklama,
              ),
              HesapMakinesiButonu(
                metin: "BACK",
                dolguRengi: 0xFF2F8F9D,
                metinRengi: 0xFF000000,
                metinBoyutu: 18.0,
                tiklama: btnTiklama,
              ),
              HesapMakinesiButonu(
                metin: "/",
                dolguRengi: 0xFF2F8F9D,
                metinRengi: 0xFF000000,
                metinBoyutu: 30.0,
                tiklama: btnTiklama,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HesapMakinesiButonu(
                metin: "9",
                dolguRengi: 0xFF82DBD8,
                metinRengi: 0xFF000000,
                metinBoyutu: 30.0,
                tiklama: btnTiklama,
              ),
              HesapMakinesiButonu(
                metin: "8",
                dolguRengi: 0xFF82DBD8,
                metinRengi: 0xFF000000,
                metinBoyutu: 30.0,
                tiklama: btnTiklama,
              ),
              HesapMakinesiButonu(
                metin: "7",
                dolguRengi: 0xFF82DBD8,
                metinRengi: 0xFF000000,
                metinBoyutu: 30.0,
                tiklama: btnTiklama,
              ),
              HesapMakinesiButonu(
                metin: "X",
                dolguRengi: 0xFF2F8F9D,
                metinRengi: 0xFF000000,
                metinBoyutu: 30.0,
                tiklama: btnTiklama,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HesapMakinesiButonu(
                metin: "6",
                dolguRengi: 0xFF82DBD8,
                metinRengi: 0xFF000000,
                metinBoyutu: 30.0,
                tiklama: btnTiklama,
              ),
              HesapMakinesiButonu(
                metin: "5",
                dolguRengi: 0xFF82DBD8,
                metinRengi: 0xFF000000,
                metinBoyutu: 30.0,
                tiklama: btnTiklama,
              ),
              HesapMakinesiButonu(
                metin: "4",
                dolguRengi: 0xFF82DBD8,
                metinRengi: 0xFF000000,
                metinBoyutu: 30.0,
                tiklama: btnTiklama,
              ),
              HesapMakinesiButonu(
                metin: "-",
                dolguRengi: 0xFF2F8F9D,
                metinRengi: 0xFF000000,
                metinBoyutu: 30.0,
                tiklama: btnTiklama,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HesapMakinesiButonu(
                metin: "3",
                dolguRengi: 0xFF82DBD8,
                metinRengi: 0xFF000000,
                metinBoyutu: 30.0,
                tiklama: btnTiklama,
              ),
              HesapMakinesiButonu(
                metin: "2",
                dolguRengi: 0xFF82DBD8,
                metinRengi: 0xFF000000,
                metinBoyutu: 30.0,
                tiklama: btnTiklama,
              ),
              HesapMakinesiButonu(
                metin: "1",
                dolguRengi: 0xFF82DBD8,
                metinRengi: 0xFF000000,
                metinBoyutu: 30.0,
                tiklama: btnTiklama,
              ),
              HesapMakinesiButonu(
                metin: "+",
                dolguRengi: 0xFF2F8F9D,
                metinRengi: 0xFF000000,
                metinBoyutu: 30.0,
                tiklama: btnTiklama,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HesapMakinesiButonu(
                metin: "+/-",
                dolguRengi: 0xFF82DBD8,
                metinRengi: 0xFF000000,
                metinBoyutu: 30.0,
                tiklama: btnTiklama,
              ),
              HesapMakinesiButonu(
                metin: "0",
                dolguRengi: 0xFF82DBD8,
                metinRengi: 0xFF000000,
                metinBoyutu: 30.0,
                tiklama: btnTiklama,
              ),
              HesapMakinesiButonu(
                metin: "00",
                dolguRengi: 0xFF82DBD8,
                metinRengi: 0xFF000000,
                metinBoyutu: 30.0,
                tiklama: btnTiklama,
              ),
              HesapMakinesiButonu(
                metin: "=",
                dolguRengi: 0xFF2F8F9D,
                metinRengi: 0xFF000000,
                metinBoyutu: 30.0,
                tiklama: btnTiklama,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
