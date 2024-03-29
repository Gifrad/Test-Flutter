import 'package:carousel_slider/carousel_slider.dart';
import 'package:education/utils/local_storage.dart';
import 'package:flutter/material.dart';

import '../../utils/background_clipper.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentIndex = 0;
  CarouselController carouselController = CarouselController();

  List<String> title = ['EDUCATION', 'READING', 'LISTENING'];

  List<String> subTitle = [
    'Lorem ipsum dolor sit amet,\nconsectetuer adipsiscing elit,',
    'Lorem ipsum dolor sit amet,\nconsectetuer adipsiscing elit,',
    'Lorem ipsum dolor sit amet,\nconsectetuer adipsiscing elit,'
  ];

  late LocalStorage localStorage;

  @override
  void initState() {
    localStorage = LocalStorage();
    getPref();
    super.initState();
  }

  void getPref() async {
    final value = await localStorage.getLocalSotrage();
    if (value != null) {
      if (mounted) {
        Navigator.pushNamedAndRemoveUntil(
            context, '/contact', (route) => false);
      }
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.purple[900],
            child: ClipPath(
              clipper: BackgroundClipper(),
              child: Container(
                color: Colors.purple[700],
                // color: const Color.fromARGB(182, 194, 0, 247),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title[currentIndex],
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        letterSpacing: 4,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CarouselSlider(
                    items: [
                      Image.asset(
                        'assets/book.png',
                        width: 250,
                      ),
                      Image.asset(
                        'assets/book.png',
                        width: 280,
                      ),
                      Image.asset(
                        'assets/book.png',
                        width: 300,
                      ),
                    ],
                    options: CarouselOptions(
                      height: 331,
                      viewportFraction: 1,
                      enableInfiniteScroll: false,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                    ),
                    carouselController: carouselController,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      subTitle[currentIndex],
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        letterSpacing: 3,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  currentIndex == 2
                      ? SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: MediaQuery.of(context).size.height * 0.08,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            onPressed: () {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, '/login', (route) => false);
                            },
                            child: const Text(
                              'START',
                              style: TextStyle(
                                color: Colors.purple,
                                fontSize: 30,
                              ),
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: currentIndex == 0 ? Colors.white : Colors.grey,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10),
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: currentIndex == 1 ? Colors.white : Colors.grey,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10),
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: currentIndex == 2 ? Colors.white : Colors.grey,
            ),
          ),
        ],
      ),
      // bottomSheet: ,
    );
  }
}
