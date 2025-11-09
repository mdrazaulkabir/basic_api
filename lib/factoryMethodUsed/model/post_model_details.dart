class PostModelDetails {
  final String title;
  final String description;
  final String urlToImage;
  final String publishedAt;
  final Sources sources;

  PostModelDetails({
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.publishedAt,
    required this.sources,
  });

  factory PostModelDetails.formJson(Map<String, dynamic> json) {
    return PostModelDetails(
      // title: json['title'],
      // description: json['description'],
      // urlToImage: json['urlToImage'],

      // for error null handling
      //Unhandled Exception: type 'Null' is not a subtype of type 'String'
      // E/flutter (15292): #0      new PostModel.formJson (package:basic_api/factoryMethodUsed/postModel.dart:15:24)
      title: json['title'] ?? 'there is no title',
      description: json['description'] ?? 'there  is no description found',
      urlToImage: json['urlToImage'] ?? '',
      publishedAt: json['publishedAt'] ?? '',
      sources: Sources.formjson(json['source']?? ''),
    );
  }
}

class Sources {
  final String id;
  final String name;

  Sources({required this.id, required this.name});

  factory Sources.formjson(Map<String, dynamic> json) {
    return Sources(
        id: json['id']?? "",
        name: json["name"]?? '');
  }
}
