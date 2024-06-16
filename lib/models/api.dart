class AffirmationModle {
  final String quote;
  final String author;
  final String category;

  AffirmationModle(
      {required this.quote, required this.author, required this.category});

  factory AffirmationModle.fromJson(Map<String, dynamic> json) {
    return AffirmationModle(
      quote: json['quote'],
      author: json['author'],
      category: json['category'],
    );
  }
}
