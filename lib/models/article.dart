// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Article {
  final String author;
  final String title;
  final String text;
  final String id;

  Article({
    required this.author,
    required this.title,
    required this.text,
    required this.id,
  });

  Article copyWith({
    String? author,
    String? title,
    String? text,
    String? id,
  }) {
    return Article(
      author: author ?? this.author,
      title: title ?? this.title,
      text: text ?? this.text,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'author': author,
      'title': title,
      'text': text,
      'id': id,
    };
  }

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      author: map['author'] as String,
      title: map['title'] as String,
      text: map['text'] as String,
      id: map['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Article.fromJson(String source) =>
      Article.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Article(author: $author, title: $title, text: $text, id: $id)';

  @override
  bool operator ==(covariant Article other) {
    if (identical(this, other)) return true;

    return other.author == author &&
        other.title == title &&
        other.text == text &&
        other.id == id;
  }

  @override
  int get hashCode =>
      author.hashCode ^ title.hashCode ^ text.hashCode ^ id.hashCode;
}
