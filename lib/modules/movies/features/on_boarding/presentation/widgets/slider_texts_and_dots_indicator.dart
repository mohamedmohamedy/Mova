import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../../core/resources/colors_manager.dart';
import '../../../../../../core/resources/fonts_manager.dart';
import '../../../../../../core/resources/strings_manager.dart';
import '../../../../../../core/resources/values_manager.dart';


class SliderTextAndDots extends StatefulWidget {
  const SliderTextAndDots({
    Key? key,
  }) : super(key: key);

  @override
  State<SliderTextAndDots> createState() => _SliderTextAndDotsState();
}

class _SliderTextAndDotsState extends State<SliderTextAndDots> {
  int currentSliderIndex = IntManager.i_0;
  final List<String> sliderTextsList = <String>[
    StringsManager.onBoardingScreenSliderText1,
    StringsManager.onBoardingScreenSliderText2,
    StringsManager.onBoardingScreenSliderText3,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          key: const Key('Slider'),
          itemCount: sliderTextsList.length,
          itemBuilder: (context, index, realIndex) => Text(
            sliderTextsList[index],
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(fontSize: FontsSize.s12),
          ),
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            height: 10.h,
            viewportFraction: DoubleManager.d_1,
            onPageChanged: (index, reason) => setState(() {
              currentSliderIndex = index;
            }),
          ),
        ),
        AnimatedSmoothIndicator(
          textDirection: TextDirection.ltr,
          axisDirection: Axis.horizontal,
          effect: const ExpandingDotsEffect(
            activeDotColor: ColorsManager.mainRedColor,
            dotColor: ColorsManager.mainWhiteColor,
            dotHeight: DoubleManager.d_5,
            dotWidth: DoubleManager.d_5,
            radius: DoubleManager.d_5,
            expansionFactor: DoubleManager.d_5,
          ),
          activeIndex: currentSliderIndex,
          count: sliderTextsList.length,
        ),
      ],
    );
  }
}
