class PostModel {
  final String title;
  final String description;
  final String urlToImage;

  PostModel({
    required this.title,
    required this.description,
    required this.urlToImage,
  });

  factory PostModel.formJson(Map<String, dynamic> json) {
    return PostModel(
      title: json['title'],
      description: json['description'],
      urlToImage: json['urlToImage'],
    );
  }
}
