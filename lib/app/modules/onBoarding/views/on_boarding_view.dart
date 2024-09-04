import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:what_we_eat/app/data/local_database.dart';
import 'package:what_we_eat/app/routes/app_pages.dart';

import '../controllers/on_boarding_controller.dart';

class OnBoardingView extends GetView<OnBoardingController> {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
      headerBackgroundColor: Colors.white,
      finishButtonText: 'Register',
      finishButtonStyle: const FinishButtonStyle(
        backgroundColor: Colors.black,
      ),
      skipTextButton: const Text('Skip'),
      trailing: const Text('Sign In', style: TextStyle(color: Colors.green)),
      trailingFunction: () {
        Get.offNamed(Routes.AUTH);
      },
      onFinish: (){
        setValue(LocalDatabase.isFirsTime, false);
        Get.offNamed(Routes.SINGUP);
      },
      background: [
        Image.asset(
          'assets/images/13717654_5326011.jpg',
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 2,
          fit: BoxFit.contain,
        ),
        Image.asset(
          'assets/images/209068338_10825430.jpg',
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 2,
          fit: BoxFit.contain,
        ),
        Image.asset(
          'assets/images/12291072_Wavy_Tech-21_Single-04.jpg',
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 2,
          fit: BoxFit.contain,
        ),
      ],
      totalPage: 3,
      speed: 1.8,
      pageBodies: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 480),
              RichText(
                text: TextSpan(
                  text: 'Discover Food Details by Category',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              RichText(
                text: TextSpan(
                  text: 'Anytime, Anywhere',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
              const Text(
                "We're here to help you make informed food choices. Scan your items and get all the details you need.",
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.center,
              ).paddingTop(20),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 480),
              RichText(
                text: TextSpan(
                  text: 'Scan and Get Instant Details',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              RichText(
                text: TextSpan(
                  text: 'Updated, Accurate',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
              const Text(
                "Make smarter food choices with our up-to-date and reliable information. Just scan and learn more.",
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.center,
              ).paddingTop(20),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 480),
              RichText(
                text: TextSpan(
                  text: 'AI Delivers the Best Food Insights',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              RichText(
                text: TextSpan(
                  text: 'Powered by AI',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
              const Text(
                " Our AI technology provides you with the most accurate and reliable food insights. Get started today.",
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.center,
              ).paddingTop(20),
            ],
          ),
        ),
      ],
    );
  }
}
