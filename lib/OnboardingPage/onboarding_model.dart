class OnboardingModel{
  String image;
  String disc;
  OnboardingModel({
    required this.disc,
    required this.image,
  });
}

List <OnboardingModel> OnboardingItem = [
  OnboardingModel(disc: 'Professional call center', image: 'assets/gif2.gif'),
  OnboardingModel(disc: 'Professional team for maintenance all types of filters', image: 'assets/gif3.gif'),
  OnboardingModel(disc: 'Fast delivery', image: 'assets/gif1.gif'),
];