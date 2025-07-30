import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../controller/tracker.dart';
import '../../model/tracker.dart';
import '../../widgets/custom_appbar.dart';
import 'components/build_journal_slider.dart';
import 'components/build_mood_field.dart';

class TrackerScreen extends StatelessWidget {
  TrackerScreen({super.key});

  final cont = Get.put(TrackerController());

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Mood Tracker',
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 3.h),
                Row(
                  children: [
                    Text(
                      'How Are You Feeling Today?',
                      style: textTheme.headlineMedium,
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...List.generate(
                        5, (index) => Image.asset(mood[index], height: 6.h))
                  ],
                ),
                SizedBox(height: 3.h),
                Row(
                  children: [
                    Text(
                      'What Do You Feel This Way?',
                      style: textTheme.headlineMedium,
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
                BuildMoodField(
                  textController: cont.textController,
                  cont: cont,
                ),
                SizedBox(height: 2.h),
                Row(
                  children: [
                    Text(
                      'Journal Entry',
                      style: textTheme.headlineMedium,
                    ),
                  ],
                ),
                SizedBox(height: 0.5.h),
                Row(
                  children: [
                    Text(
                      '\"Kepp Your Journaling Private. You Own Your Data. It Stays On Your Device\"',
                      style: textTheme.bodyLarge!
                          .copyWith(fontSize: 12.sp, fontFamily: 'Gilroy'),
                    ),
                  ],
                ),
                SizedBox(height: 0.5.h),
                BuildJournalEntrySlider(
                    entries: journalEntry, controller: cont),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
