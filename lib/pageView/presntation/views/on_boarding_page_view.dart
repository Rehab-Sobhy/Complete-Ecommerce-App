import 'package:flutter/material.dart';
import 'package:flutter_commerce_app/auth/register.dart';
import 'package:flutter_commerce_app/core/utils/styles.dart';
import 'package:flutter_commerce_app/pageView/presntation/views/page_view_item.dart';

class OnBoardingPageView extends StatefulWidget {
  const OnBoardingPageView({super.key});

  @override
  State<OnBoardingPageView> createState() => _OnBoardingPageViewState();
}

class _OnBoardingPageViewState extends State<OnBoardingPageView> {
  late PageController pageController;
  int currentindex = 0;
  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // const SizedBox(height: 20,),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegisterScreen()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        "skip",
                        style: Styles.TextStyle16.copyWith(
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: 480,
              child: PageView.builder(
                  onPageChanged: (int index) {
                    setState(() {
                      currentindex = index;
                    });
                  },
                  controller: pageController,
                  itemCount: 2,
                  itemBuilder: (context, int index) {
                    return pageViewsItems[index];
                  }),
            ),
            const Spacer(),
            GestureDetector(
                onTap: () {
                  if (pageController.page! < 1) {
                    pageController.nextPage(
                      duration: const Duration(microseconds: 300),
                      curve: Curves.easeIn,
                    );
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen()));
                  }
                },
                child: Container(
                  color: const Color.fromARGB(255, 63, 6, 117),
                  // ignore: sort_child_properties_last
                  child: Text(
                      textAlign: TextAlign.center,
                      currentindex == pageViewsItems.length - 1
                          ? "Get Started"
                          : "Next",
                      style: Styles.TextStyle16.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  height: 45,
                  width: 300,
                )),
          ],
        ),
      ),
    );
  }
}

List pageViewsItems = [
  const PageViewItem(image: "assets/images/R.png"),
  const PageViewItem(
      image:
          "assets/images/5e37be527c077bdd56efa8e5_5c812908b78f13958baa3168_7Asset202.webp"),
];
