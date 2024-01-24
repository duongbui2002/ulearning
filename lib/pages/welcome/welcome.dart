import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/values/colors.dart';
import 'bloc/welcome_blocs.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocBuilder<WelcomeBloc, WelcomeState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: Scaffold(
            body: Container(
              margin: EdgeInsets.only(top: 34.h),
              width: 350.w,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  PageView(
                      controller: pageController,
                      onPageChanged: (index) {
                        state.page = index;
                        BlocProvider.of<WelcomeBloc>(context)
                            .add(WelcomeEvent());
                      },
                      children: [
                        _page(
                            1,
                            context,
                            'next',
                            'First See Learning',
                            'Forget about a for of paper all knowledge in one learning',
                            "assets/images/reading.png"),
                        _page(
                            2,
                            context,
                            'next',
                            'Connect With Everyone',
                            'Always keep in touch with your tutor & friend. Let\'s get connected',
                            "assets/images/boy.png"),
                        _page(
                            3,
                            context,
                            'get started',
                            'Always Fascinated Learning',
                            'Anywhere, anytime. The time is at your discretion so study whenever you want.',
                            "assets/images/man.png"),
                      ]),
                  Positioned(
                      bottom: 100.h,
                      child: DotsIndicator(
                        dotsCount: 3,
                        position: state.page,
                        mainAxisAlignment: MainAxisAlignment.center,
                        decorator: DotsDecorator(
                          activeColor: AppColors.primaryElement,
                            color: AppColors.primaryThirdElementText,
                            size: const Size.square(8.0),
                            activeSize: const Size(10.0, 8.0),
                            activeShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      ))
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _page(int index, BuildContext context, String buttonName, String title,
      String subTitle, String imagePath) {
    return Column(
      children: [
        SizedBox(
          height: 345.w,
          width: 345.w,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          child: Text(
            title,
            style: TextStyle(
                color: AppColors.primaryText,
                fontSize: 24.sp,
                fontWeight: FontWeight.normal),
          ),
        ),
        Container(
          width: 375.w,
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Text(
            subTitle,
            style: TextStyle(
                color: AppColors.primarySecondaryElementText,
                fontSize: 14.sp,
                fontWeight: FontWeight.normal),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (index < 3) {
              // animation
              pageController.animateToPage(index,
                  duration: const Duration(microseconds: 1000),
                  curve: Curves.decelerate);
            } else {
              // Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyHomePage(title: 'title')));
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("signIn", (route) => false);
            }
          },
          child: Container(
            width: 325.w,
            height: 50.h,
            margin: EdgeInsets.only(top: 100.h, left: 25.h, right: 25.w),
            decoration: BoxDecoration(
                color: AppColors.primaryElement,
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(0, 1))
                ]),
            child: Center(
              child: Text(
                buttonName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ),
        )
      ],
    );
  }
}
