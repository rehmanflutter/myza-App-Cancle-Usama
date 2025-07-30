import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../controller/tracker.dart';
import '../../../model/tracker.dart';

class BuildJournalEntrySlider extends StatelessWidget {
  final List<JournalEntryModel> entries;
  final TrackerController controller;

  const BuildJournalEntrySlider(
      {super.key, required this.entries, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 22.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: entries.length,
        itemBuilder: (context, index) {
          final entry = entries[index];
          final isSelected = controller.selectedIndex.value == index;
          return GestureDetector(
            onTap: () => controller.selectContainer(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              width: 60.w,
              height: isSelected ? 22.h : 20.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: NetworkImage(entry.img),
                  fit: BoxFit.cover,
                ),
                // boxShadow: isSelected
                //     ? [BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 4))]
                //     : [],
              ),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.7),
                          Colors.transparent
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 3.h,
                    left: 4.w,
                    right: 4.w,
                    child: Text(
                      entry.title,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 1.h,
                    left: 4.w,
                    right: 4.w,
                    child: Text(
                      entry.subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
