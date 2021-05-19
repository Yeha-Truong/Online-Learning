import 'package:equatable/equatable.dart';

class AnswerSheet extends Equatable {
  final List<String>? idOfQuestion;

  const AnswerSheet({this.idOfQuestion});

  factory AnswerSheet.fromJson(Map<String, dynamic> json) {
    return AnswerSheet(
      idOfQuestion: json['id of question'] as List<String>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id of question': idOfQuestion,
    };
  }

  AnswerSheet copyWith({
    List<String>? idOfQuestion,
  }) {
    return AnswerSheet(
      idOfQuestion: idOfQuestion ?? this.idOfQuestion,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [idOfQuestion];
}
