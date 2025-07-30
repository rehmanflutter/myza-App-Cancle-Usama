import 'package:myza_thougths/app/constant/app_images.dart';

class JournalEntryModel {
  final String img;
  final String title;
  final String subtitle;
  JournalEntryModel({
    required this.title,
    required this.subtitle,
    required this.img,
  });
}

final List<String> mood = [
  AppImages.emoji1,
  AppImages.emoji2,
  AppImages.emoji3,
  AppImages.emoji4,
  AppImages.emoji5,
];

final List<String> textFieldSuggestions = [
  'I will...',
  'Complete...',
  'Go to the...',
  'Call my..',
];

final List<JournalEntryModel> journalEntry = [
  JournalEntryModel(
    title: 'Sleep Section Modules',
    subtitle: 'Lorem Ipsum Is Simply Dummy Text, That Is Used',
    img:
        'https://static.vecteezy.com/system/resources/thumbnails/008/452/407/small_2x/beautiful-sunset-over-the-sea-with-coconut-tree-at-summer-time-photo.jpg',
  ),
  JournalEntryModel(
    title: 'Mental Wellnuting Here Is ',
    subtitle: 'Lorem Ipsum Is Simply Dummy Text, That Is Used',
    img:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9Kf-or-mZGuORUMctEmucWJR5wxs9IMcEng&s',
  ),
  JournalEntryModel(
    title: 'Sleep Section Modules',
    subtitle: 'Lorem Ipsum Is Simply Dummy Text, That Is Used',
    img:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkAyyC5vWIHJczXHAvaXbU9xjYjgeYdjFSMA&s',
  ),
];

final List<Map> trackers = [
  {
    'img': AppImages.period_tracker,
    'text': 'Period Tracker',
  },
  {
    'img': AppImages.mood_tracker,
    'text': 'Mood Tracker',
  },
  {
    'img': AppImages.sleep_tracker,
    'text': 'Sleep Tracker',
  },
  {'img': AppImages.water_tracker, 'text': 'Water Tracker'},
  {'img': AppImages.speed_tracker, 'text': 'Speed Tracker'},
  {'img': AppImages.habit_tracker, 'text': 'Habit Tracker'},
];
