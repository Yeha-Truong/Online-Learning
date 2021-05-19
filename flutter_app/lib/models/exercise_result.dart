import 'package:equatable/equatable.dart';

import 'answer_sheet.dart';

class ExerciseResult extends Equatable {
  final List<AnswerSheet>? answerSheet;
  final int? score;
  final int? totalQuestion;
  final List<String>? listQuestionTrue;

  const ExerciseResult({
    this.answerSheet,
    this.score,
    this.totalQuestion,
    this.listQuestionTrue,
  });

  factory ExerciseResult.fromJson(Map<String, dynamic> json) {
    return ExerciseResult(
      answerSheet: (json['answerSheet'] as List<dynamic>?)
          ?.map((e) => AnswerSheet.fromJson(e as Map<String, dynamic>))
          .toList(),
      score: json['score'] as int?,
      totalQuestion: json['totalQuestion'] as int?,
      listQuestionTrue: json['listQuestionTrue'] as List<String>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'answerSheet': answerSheet?.map((e) => e.toJson()).toList(),
      'score': score,
      'totalQuestion': totalQuestion,
      'listQuestionTrue': listQuestionTrue,
    };
  }

  ExerciseResult copyWith({
    List<AnswerSheet>? answerSheet,
    int? score,
    int? totalQuestion,
    List<String>? listQuestionTrue,
  }) {
    return ExerciseResult(
      answerSheet: answerSheet ?? this.answerSheet,
      score: score ?? this.score,
      totalQuestion: totalQuestion ?? this.totalQuestion,
      listQuestionTrue: listQuestionTrue ?? this.listQuestionTrue,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      answerSheet,
      score,
      totalQuestion,
      listQuestionTrue,
    ];
  }
}
