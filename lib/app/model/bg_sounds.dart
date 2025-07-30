// models/tracker_model.dart
import 'package:get/get.dart';

import '../constant/app_images.dart';

class BgSoundModel {
  final String img;
  final String text;
  final RxBool isActive;

  BgSoundModel({
    required this.img,
    required this.text,
    bool isActive = false,
  }) : isActive = isActive.obs;

  void toggleActive() {
    isActive.value = !isActive.value;
  }
}

final List<BgSoundModel> bgSounds = [
  BgSoundModel(img: AppImages.rain, text: 'Rain', isActive: false),
  BgSoundModel(img: AppImages.ocean, text: 'Ocean', isActive: true),
  BgSoundModel(img: AppImages.forest, text: 'Forest', isActive: false),
  BgSoundModel(img: AppImages.fire, text: 'Fire', isActive: false),
];
