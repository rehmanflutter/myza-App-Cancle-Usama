import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myza_thougths/app/widgets/custom_appbar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../controller/speed_tracker.dart';
class SpeedTrackerScreen extends StatelessWidget {
  final SpeedTrackerController controller = Get.put(SpeedTrackerController());

   SpeedTrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Speed Tracker'),
    );
  }

  Widget _infoChip(String label, IconData icon, Color bgColor) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, size: 5.w, color: Colors.black),
          SizedBox(width: 1.w),
          Text(label, style: TextStyle(fontSize: 15.sp)),
        ],
      ),
    );
  }

  Widget _inputArea() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: "Enter Steps",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              contentPadding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
            ),
            onChanged: (val) => controller.enteredSteps.value = val,
          ),
        ),
        SizedBox(width: 2.w),
        Container(
          height: 6.h,
          width: 6.h,
          decoration: BoxDecoration(
            color: Color(0xFFFDCB59),
            borderRadius: BorderRadius.circular(12),
          ),
          child: IconButton(
            icon: Icon(Icons.add, color: Colors.black),
            onPressed: controller.syncSteps,
          ),
        ),
      ],
    );
  }

  Widget _chartArea() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("All Statistic", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
        SizedBox(height: 1.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
          decoration: BoxDecoration(
            color: Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(12),
          ),
          child: DefaultTabController(
            length: 4,
            child: Column(
              children: [
                TabBar(
                  indicatorColor: Color(0xFFFDCB59),
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  tabs: const [
                    Tab(text: "Day"),
                    Tab(text: "Week"),
                    Tab(text: "Month"),
                    Tab(text: "Year"),
                  ],
                ),
                SizedBox(
                  height: 25.h,
                  child: Obx(() => SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    series: <CartesianSeries>[
                      LineSeries<Map<String, dynamic>, String>(
                        dataSource: controller.statsData,
                        xValueMapper: (datum, _) => datum["time"],
                        yValueMapper: (datum, _) => datum["value"],
                        markerSettings: MarkerSettings(isVisible: true),
                        color: Colors.orange,
                      )
                    ],
                  )),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
