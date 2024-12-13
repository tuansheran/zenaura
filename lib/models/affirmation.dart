class AffirmationModle {
  final String id;
  final String text;

  AffirmationModle({required this.id, required this.text});

  factory AffirmationModle.fromJson(Map<String, dynamic> json) {
    return AffirmationModle(
      id: json['id'],
      text: json['text'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
    };
  }
}
