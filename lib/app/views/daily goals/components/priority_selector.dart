import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myza_thougths/app/controller/daily_goals.dart';

import '../../../widgets/custom_dropdown.dart';

class PerioritySelector extends StatelessWidget {
  const PerioritySelector({super.key});

  @override
  Widget build(BuildContext context) {
    final cont = Get.put(DailyGoalsController());
    return Obx(
      () => CustomDropdown(
        hintText: 'Priority Selector',
        value: cont.selectedVehicleType.value,
        items: [
          DropdownMenuItem(value: 'Low', child: Text('Bike')),
          DropdownMenuItem(value: 'Medium', child: Text('Scooter')),
          DropdownMenuItem(value: 'High', child: Text('Car')),
          DropdownMenuItem(value: 'Top', child: Text('Van')),
          DropdownMenuItem(value: 'Not Sure', child: Text('Bicycle')),
        ],
        onChanged: (value) {
          cont.selectedVehicleType.value = value;
        },
      ),
    );
  }
}
