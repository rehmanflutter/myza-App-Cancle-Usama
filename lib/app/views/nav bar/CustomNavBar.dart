import 'package:flutter/material.dart';
import 'package:myza_thougths/app/views/Profile/profile_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../constant/app_images.dart';
import '../affirm/affirm.dart';
import '../home/home_screen.dart';
import '../journal/journal.dart';
import '../tracker/tracker.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  State<CustomNavBar> createState() => _HomePageState();
}

class _HomePageState extends State<CustomNavBar> {
  int selectedIndex = 0;
  // int selectedpageIndex = 0;
  // late PageController _pageController;
  //
  //
  // final List<Widget> _pages = [
  //   AffirmSc(),
  //   FocusModeSc(),
  // ];
  //
  // void _onItemTapped(int index) {
  //   setState(() {
  //     selectedIndex = index;
  //   });
  //   _pageController.jumpToPage(index);
  // }
  //
  //
  final List _screens = [
    HomeScreen(),
    JournalScreen(),
    TrackerScreen(),
    AffirmSc(),
    ProfilePage()
  ];

  final List<String> _icons = [
    AppImages.homeIcon,
    AppImages.journalIcon,
    AppImages.trackerIcon,
    AppImages.affirmIcon,
    AppImages.profileIcon,
  ];

  final List<String> _filledIcons = [
    AppImages.homeFilledIcon,
    AppImages.journalFilledIcon,
    AppImages.trackerFilledIcon,
    AppImages.affirmFilledIcon,
    AppImages.profileFilledIcon,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[selectedIndex],
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 12.sp),
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.5.h),
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Container(
            height: 7.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.grey.shade400),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(_icons.length, (index) {
                  final isSelected = selectedIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          isSelected ? _filledIcons[index] : _icons[index],
                          height: isSelected ? 26.sp : 20.sp,
                        )
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
