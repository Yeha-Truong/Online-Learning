import 'package:equatable/equatable.dart';

import 'answer.dart';

class Question extends Equatable {
  final String? content;
  final String? contentHtml;
  final String? id;
  final bool? isMultipleChoice;
  final List<Answer>? exercisesAnswers;

  const Question({
    this.content,
    this.contentHtml,
    this.id,
    this.isMultipleChoice,
    this.exercisesAnswers,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      content: json['content'] as String?,
      contentHtml: json['contentHtml'] as String?,
      id: json['id'] as String?,
      isMultipleChoice: json['isMultipleChoice'] as bool?,
      exercisesAnswers: (json['exercises_answers'] as List<dynamic>?)
          ?.map((e) => Answer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'contentHtml': contentHtml,
      'id': id,
      'isMultipleChoice': isMultipleChoice,
      'exercises_answers': exercisesAnswers?.map((e) => e.toJson()).toList(),
    };
  }

  Question copyWith({
    String? content,
    String? contentHtml,
    String? id,
    bool? isMultipleChoice,
    List<Answer>? exercisesAnswers,
  }) {
    return Question(
      content: content ?? this.content,
      contentHtml: contentHtml ?? this.contentHtml,
      id: id ?? this.id,
      isMultipleChoice: isMultipleChoice ?? this.isMultipleChoice,
      exercisesAnswers: exercisesAnswers ?? this.exercisesAnswers,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      content,
      contentHtml,
      id,
      isMultipleChoice,
      exercisesAnswers,
    ];
  }
}
