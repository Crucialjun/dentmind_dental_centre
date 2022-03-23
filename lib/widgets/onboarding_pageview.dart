import 'package:dentmind_dental_centre/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPageView extends StatefulWidget {
  const OnboardingPageView({Key? key}) : super(key: key);

  @override
  State<OnboardingPageView> createState() => _OnboardingPageViewState();
}

class _OnboardingPageViewState extends State<OnboardingPageView> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView(
            physics: const BouncingScrollPhysics(),
            controller: _pageController,
            children: [
              _page("page_view_image1", "Quality is First and Foremost",
                  "At Dentmind Dental Center, 'Quality is First & Foremost'. That is why, in spite of being fairly cost-effective, we strictly adhere to high standards of quality control of our equipment, materials and procedures. "),
              _page("page_view_image2", "Professional Competency",
                  "We also ensure professional competency of our dentists & lab technicians."),
              _page("page_view_image3", "Universal Precautions",
                  "We practice universal precautions as recommended by the KDA . For safety & the well being of our patients"),
              _page(
                  "page_view_image4",
                  "Outmost care about Hygiene & Sterilization",
                  "Dentmind Dental Center takes utmost care about hygiene & sterilization."),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 16),
          child: SmoothPageIndicator(
              onDotClicked: (index) {
                _pageController.jumpToPage(index);
              },
              controller: _pageController,
              effect: const WormEffect(),
              count: 4),
        ),
      ],
    );
  }
}

Widget _page(String assetName, String title, String description) {
  return Center(
      child: Column(children: [
    Expanded(flex: 1, child: SvgPicture.asset("assets/$assetName.svg")),
    Text(
      title,
      textAlign: TextAlign.center,
      style: const TextStyle(
          color: primaryAppColor, fontWeight: FontWeight.bold, fontSize: 28),
    ),
    const SizedBox(
      height: 8,
    ),
    Text(
      description,
      style: const TextStyle(color: Colors.black),
      textAlign: TextAlign.center,
    ),
  ]));
}
