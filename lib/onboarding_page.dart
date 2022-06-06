import 'package:akademi_boot/calculus_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _pagecontroller = PageController();
  bool isLastPage = false;
  @override
  void dispose() {
    _pagecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: _pagecontroller,
          onPageChanged: (index) {
            setState(() => isLastPage = index == 2);
          },
          children: <Widget>[
            buildPage(
                color: const Color(0xFF2F8F9D),
                urlImage: "assets/images/cal1.png",
                title: "ANINDA HESAPLA",
                subtitle: "İşlemlerin sonucunu kolayca bul."),
            buildPage(
                color: const Color(0xFF2F8F9D),
                urlImage: "assets/images/cal2.png",
                title: "HER ZAMAN YANINDA",
                subtitle: "Uygulmayı kullanmak için internete gerek kalmaz."),
            buildPage(
                color: const Color(0xFF2F8F9D),
                urlImage: "assets/images/cal3.png",
                title: "UYGULAMAYA BAŞLA",
                subtitle:
                    "Altta yer alan 'Başla' butonuna basarak uygulamayı açabilirsin.")
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? TextButton(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                prefs.setBool('showHome', true);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HesapMakinesi(),
                  ),
                );
              },
              child: const Text(
                'BAŞLA!',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              style: TextButton.styleFrom(
                primary: const Color(0xFF82DBD8),
                backgroundColor: const Color(0xFF82DBD8),
                minimumSize: const Size.fromHeight(80),
              ),
            )
          : Container(
              color: const Color(0xFF82DBD8),
              padding: const EdgeInsets.symmetric(horizontal: 50),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () => _pagecontroller.jumpToPage(2),
                    child: const Text(
                      'Atla',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  Center(
                    child: SmoothPageIndicator(
                      count: 3,
                      controller: _pagecontroller,
                      effect: const WormEffect(
                        spacing: 16,
                        dotColor: Colors.black,
                        activeDotColor: Colors.white,
                      ),
                      onDotClicked: (index) => _pagecontroller.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn),
                    ),
                  ),
                  TextButton(
                    onPressed: () => _pagecontroller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut),
                    child: const Text(
                      'İleri',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Container buildPage(
      {required color, required urlImage, required title, required subtitle}) {
    return Container(
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            urlImage,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 24,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              subtitle,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
