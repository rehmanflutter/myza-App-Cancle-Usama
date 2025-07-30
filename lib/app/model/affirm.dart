import '../constant/app_images.dart';

class AffirmQuote {
  final String quote;
  final String poet;
  AffirmQuote({required this.quote, required this.poet});
}

class AffirmCategories {
  final String img;
  final String text;
  // final bool isActive;
  AffirmCategories({required this.img, required this.text});
}

final List<AffirmQuote> affirmQuote = [
  AffirmQuote(
      quote: 'I Am Grounded, Calm, And Resilient.', poet: 'Sara .S(2020)'),
  AffirmQuote(
      quote: 'I Am Grounded, Calm, And Resilient.', poet: 'Sara .S(2020)'),
  AffirmQuote(
      quote: 'I Am Grounded, Calm, And Resilient.', poet: 'Sara .S(2020)'),
  AffirmQuote(
      quote: 'I Am Grounded, Calm, And Resilient.', poet: 'Sara .S(2020)'),
];

final List<AffirmCategories> affirmCategories = [
  AffirmCategories(
    img: AppImages.peace,
    text: 'Peace',
  ),
  AffirmCategories(
    img: AppImages.confidence,
    text: 'Confidence',
  ),
  AffirmCategories(
    img: AppImages.gratitude,
    text: 'Gratitude',
  ),
  AffirmCategories(
    img: AppImages.focus,
    text: 'Focus',
  ),
];

final List<String> focusTime = [
  '15 min',
  '30 min',
  '45 min',
  'Custom',
];
