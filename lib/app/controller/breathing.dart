import 'dart:async';

import 'package:get/get.dart';

class BreathingController extends GetxController {
  final progress = 0.0.obs;
  final isHolding = false.obs;
  final elapsedSeconds = 0.obs; // Changed from rounds to seconds
  final status = "Hold".obs;
  final savedProgress = 0.7.obs;
  final pulseScale = 1.0.obs;
  final holdProgress = 0.0.obs;

  Timer? _timer;
  Timer? _secondsTimer;
  Timer? _pulseTimer;

  void startTimer() {
    isHolding.value = true;
    elapsedSeconds.value = 0;
    progress.value = 0;
    progress.value = savedProgress.value;
    status.value = "Breathing...";

    // Progress timer for smooth circular animation
    _timer = Timer.periodic(Duration(milliseconds: 50), (timer) {
      progress.value += 0.01;
      if (progress.value >= 1.0) {
        progress.value = 0;
      }
    });

    // Actual seconds counter
    _secondsTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      elapsedSeconds.value++;
    });

    // Pulsing animation
    _pulseTimer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      pulseScale.value = pulseScale.value == 1.0 ? 1.05 : 1.0;
    });
  }

  void stopTimer() {
    _timer?.cancel();
    _secondsTimer?.cancel();
    _pulseTimer?.cancel();
    savedProgress.value = progress.value;
    isHolding.value = false;
    status.value = "Hold";
    progress.value = 0;
    pulseScale.value = 1.0;
  }

  String formatTime() {
    int minutes = elapsedSeconds.value ~/ 60;
    int seconds = elapsedSeconds.value % 60;
    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  @override
  void onClose() {
    _timer?.cancel();
    _secondsTimer?.cancel();
    _pulseTimer?.cancel();
    super.onClose();
  }
}
