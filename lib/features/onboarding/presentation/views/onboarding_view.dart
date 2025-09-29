import 'package:flutter/material.dart';
import 'package:homehaven/core/constnts/assets.dart';
import 'package:homehaven/core/constnts/colors.dart';
import 'package:homehaven/features/auth/presentation/views/login_view.dart';
import 'package:homehaven/core/widgets/custom_button.dart';
import 'package:homehaven/features/onboarding/data/onboarding_data.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  int count = 0;

  Color getPointColor(int pointIndex) {
    return (count == pointIndex)
        ? AppColors.kPrimaryColor
        : const Color(0xffE0E0E0);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            OnboardingData.onboardingList[count]['image'],
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              OnboardingData.onboardingList[count]['title'],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: AppColors.kTextColor,
              ),
            ),
          ),
          SizedBox(height: height * .01),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              OnboardingData.onboardingList[count]['subTitle'],
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, color: Color(0xff757575)),
            ),
          ),
          SizedBox(height: height * .02),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AssetsPath.dot, height: 10, color: getPointColor(0)),
              const SizedBox(width: 5),
              Image.asset(AssetsPath.dot, color: getPointColor(1), height: 10),
              const SizedBox(width: 5),
              Image.asset(AssetsPath.dot, color: getPointColor(2), height: 10),
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              children: [
                if (count > 1)
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          if (count > 1) {
                            setState(() {
                              count--;
                            });
                          }
                        },
                        child: SizedBox(
                          height: 43,
                          width: 104,
                          child: Center(
                            child: Text(
                              'Back',
                              style: TextStyle(
                                color: AppColors.kPrimaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                    ],
                  ),
                Expanded(
                  child: CustomButton(
                    text: 'Next',
                    onTap: () {
                      if (count < 2) {
                        setState(() {
                          count++;
                        });
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => LoginView()),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: height * .01),
        ],
      ),
    );
  }
}
