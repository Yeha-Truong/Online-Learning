import 'package:equatable/equatable.dart';

import 'question.dart';

class Excerise extends Equatable {
  final String? courseId;
  final String? id;
  final String? lessonId;
  final int? time;
  final String? title;
  final List<Question>? exercisesQuestions;

  const Excerise({
    this.courseId,
    this.id,
    this.lessonId,
    this.time,
    this.title,
    this.exercisesQuestions,
  });

  factory Excerise.fromJson(Map<String, dynamic> json) {
    return Excerise(
      courseId: json['courseId'] as String?,
      id: json['id'] as String?,
      lessonId: json['lessonId'] as String?,
      time: json['time'] as int?,
      title: json['title'] as String?,
      exercisesQuestions: (json['exercises_questions'] as List<dynamic>?)
          ?.map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'courseId': courseId,
      'id': id,
      'lessonId': lessonId,
      'time': time,
      'title': title,
      'exercises_questions':
          exercisesQuestions?.map((e) => e.toJson()).toList(),
    };
  }

  Excerise copyWith({
    String? courseId,
    String? id,
    String? lessonId,
    int? time,
    String? title,
    List<Question>? exercisesQuestions,
  }) {
    return Excerise(
      courseId: courseId ?? this.courseId,
      id: id ?? this.id,
      lessonId: lessonId ?? this.lessonId,
      time: time ?? this.time,
      title: title ?? this.title,
      exercisesQuestions: exercisesQuestions ?? this.exercisesQuestions,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      courseId,
      id,
      lessonId,
      time,
      title,
      exercisesQuestions,
    ];
  }
}
