import 'package:flutter/material.dart';
import 'package:flutter_instagram_stories/flutter_instagram_stories.dart';
import 'package:get/get.dart';
import 'package:myza_thougths/app/constant/app_images.dart';
import 'package:myza_thougths/app/routes/app_routes.dart';
import 'package:myza_thougths/app/views/home/trackers/trackersSc.dart';
import 'package:myza_thougths/app/widgets/custom_network_image.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../controller/home.dart';
import '../../model/home.dart';
import 'components/quote_scroller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final cont = Get.put(HomeController());

  final List<Map> tools = [
    {
      'img': AppImages.journalIcon1,
      'text': 'Journal',
    },
    {'img': AppImages.trackersIcon, 'text': 'Trackers'},
    {
      'img': AppImages.affirmIcon1,
      'text': 'Affirm',
    },
    {'img': AppImages.resetIcon, 'text': 'Reset'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: Column(
            children: [
              SizedBox(height: 2.h),
              _buildHeader(),
              SizedBox(height: 2.h),
              _buildStories(context),
              SizedBox(height: 4.h),
              Row(
                children: [
                  Text(
                    'Tool',
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              _buildTools(),
              SizedBox(height: 2.h),
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.chooseYourPrimmerPlan);
                },
                child: QuoteScroller(
                    quotes: quotes,
                    currentIndex: cont.currentIndex,
                    attribution: 'Sara S (2020)'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return SizedBox(
      height: 10.h,
      width: 100.w,
      child: Row(
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            height: 6.h,
            width: 6.h,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: CustomNetworkImage(
              img:
                  'https://a.storyblok.com/f/191576/1176x882/9bdc5d8400/round_profile_picture_hero_before.webp',
            ),
          ),
          SizedBox(width: 3.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Good Morning', style: TextStyle(fontSize: 14.sp)),
              Text('Charlie Dias',
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400)),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              ///////////////////////////////
              ///
              ///   Error Page  Call Just  View testing
              ///
              ///
              Get.toNamed(AppRoutes.errorPage);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.sp),
                border: Border.all(color: Colors.grey.shade400),
              ),
              child: Icon(Icons.add, size: 20.sp),
            ),
          ),
          SizedBox(width: 2.w),
        ],
      ),
    );
  }

  Widget _buildTools() {
    return SizedBox(
      height: 13.h,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: tools.length,
        itemBuilder: (context, index) {
          return Obx(
            () {
              final isSelected = cont.selectedIndex.value == index;
              return GestureDetector(
                onTap: () {
                  Duration(milliseconds: 400).delay().then((value) {
                    Get.to(TrackersScreen());
                  });
                  cont.selectContainer(index);
                },
                child: AnimatedContainer(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  duration: Duration(milliseconds: 300),
                  margin:
                      EdgeInsets.symmetric(horizontal: 1.5.w, vertical: 1.h),
                  width: 26.w,
                  height: 7.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(2.w),
                    boxShadow: isSelected
                        ? [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.6),
                              blurRadius: 1.w,
                              spreadRadius: 0.1.w,
                              offset: Offset(0, 0),
                            ),
                          ]
                        : [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              spreadRadius: 0.05.w,
                              offset: Offset(0, 0),
                            )
                          ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        tools[index]['img'],
                        height: 50,
                        width: 50,
                      ),
                      SizedBox(height: 1.h),
                      Text(
                        tools[index]['text'],
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildStories(BuildContext context) {
    return Obx(() => SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: stories.asMap().entries.map((entry) {
              int index = entry.key;
              var item = entry.value;

              return GestureDetector(
                onTap: () => openStoryViewer(context, item, index),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.2.w),
                  child: Column(
                    children: [
                      Container(
                        width: 17.w,
                        height: 17.w,
                        margin: EdgeInsets.only(bottom: 1.h),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.orange,
                            width: 0.5.w,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(5.sp),
                          child: ClipOval(
                            child: CustomNetworkImage(img: item['image']!),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 18.w,
                        child: Text(
                          item['title']!,
                          style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Gilroy'),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                        ),
                      )
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ));
  }

  void openStoryViewer(
      BuildContext context, Map<String, String> item, int index) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => FlutterInstagramStories(
          collectionDbName: 'myCollection',
          // Add other required parameters
        ),
      ),
    );
  }
}
