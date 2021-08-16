class Showcase {
  final int id;
  final String title;
  final String description;
  final String fileName;
  final String createdAt;
  final String author;
  final List<String> tagList;

  Showcase(
    this.id,
    this.title,
    this.description,
    this.fileName,
    this.createdAt,
    this.author,
    this.tagList,
  );

  factory Showcase.fromMap(map) {
    return Showcase(
      map['id'],
      map['title'],
      map['description'],
      map['fileName'],
      map['createdAt'],
      map['author'],
      map['tags'],
    );
  }
}
