import 'package:equatable/equatable.dart';

class SearchHistory extends Equatable {
  final String? id;
  final String? content;

  const SearchHistory({this.id, this.content});

  factory SearchHistory.fromJson(Map<String, dynamic> json) {
    return SearchHistory(
      id: json['id'] as String?,
      content: json['content'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': content,
    };
  }

  SearchHistory copyWith({
    String? id,
    String? content,
  }) {
    return SearchHistory(
      id: id ?? this.id,
      content: content ?? this.content,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, content];
}
