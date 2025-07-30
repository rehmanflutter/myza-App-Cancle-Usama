import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../model/bg_sounds.dart';

class JournalController extends GetxController {
  TextEditingController textFieldController = TextEditingController();
  var selectedIndex = (1).obs; // Use RxInt for type safety

  // Make bgSounds observable
  RxList<BgSoundModel> bgSounds = <BgSoundModel>[].obs;

  void selectContainer(int index) {
    selectedIndex.value = index;
  }

  void toggleTracker(int index) {
    selectContainer(index);
    bgSounds[index].isActive.value = !bgSounds[index].isActive.value;
  }
}
