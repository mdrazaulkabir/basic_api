class RealGetModel {
  final String author;
  final String title;
  final String description;
  final String urlToImage;
  final Source source;

  RealGetModel({
    required this.author,
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.source,
  });

  factory RealGetModel.formJson(Map<String, dynamic> json) {
    return RealGetModel(
      author: json['author'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      urlToImage: json['urlToImage'] ?? '',
      source: Source.formJson(json['source'] ?? '') //here is no need because source sub data need to null safety
    );
  }
}


class Source {
  final String id;
  final String name;

  Source({required this.id, required this.name});

  factory Source.formJson(Map<String, dynamic> json) {
    return Source(
        id: json['id']?? '',
        name: json['name']?? '',
    );
  }
}
