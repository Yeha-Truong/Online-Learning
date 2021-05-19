import 'package:equatable/equatable.dart';

class Answer extends Equatable {
  final String? content;
  final String? id;

  const Answer({this.content, this.id});

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      content: json['content'] as String?,
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'id': id,
    };
  }

  Answer copyWith({
    String? content,
    String? id,
  }) {
    return Answer(
      content: content ?? this.content,
      id: id ?? this.id,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [content, id];
}
