class UnbordingContent {
  String image;
  String title;
  String description;

  UnbordingContent({required this.
  image, required this.title, required this.description});
}

List<UnbordingContent> contents = [
  UnbordingContent(
    image: 'images/on1.jpg',
    title: 'Say goodbye to your car troubles!',
    description: "100+ Services, Repairs & Products ",
  ),
  UnbordingContent(
      title: 'Your Car Service, At Your Fingertip!',
      image: 'images/on2.jpg',
      description: "Superfast 60-seconds booking "
  ),
  UnbordingContent(
      title: 'Live Updates & Express Assistance',
      image: 'images/on2.jpg',
      description: "Dedicated service buddy at your service!"
  ),
];