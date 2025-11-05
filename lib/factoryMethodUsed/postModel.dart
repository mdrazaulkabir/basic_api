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
      // title: json['title'],
      // description: json['description'],
      // urlToImage: json['urlToImage'],

        // for error null handling
        //Unhandled Exception: type 'Null' is not a subtype of type 'String'
       // E/flutter (15292): #0      new PostModel.formJson (package:basic_api/factoryMethodUsed/postModel.dart:15:24)
      title: json['title'] ?? 'there is no title',
      description: json['description'] ?? 'there  is no description found',
      urlToImage: json['urlToImage'] ?? '',
    );
  }
}
