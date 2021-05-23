import 'package:equatable/equatable.dart';

import 'lesson.dart';

class Section extends Equatable {
  final String? id;
  final String? courseId;
  final int? numberOrder;
  final String? name;
  final bool? isDeleted;
  final String? createdAt;
  final String? updatedAt;
  final List<Lesson>? lesson;
  final double? sumHours;
  final int? sumLessonFinish;

  const Section({
    this.id,
    this.courseId,
    this.numberOrder,
    this.name,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.lesson,
    this.sumHours,
    this.sumLessonFinish,
  });

  factory Section.fromJson(Map<String, dynamic> json) {
    return Section(
      id: json['id'] as String?,
      courseId: json['courseId'] as String?,
      numberOrder: json['numberOrder'] as int?,
      name: json['name'] as String?,
      isDeleted: json['isDeleted'] as bool?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      lesson: (json['lesson'] as List<dynamic>?)
          ?.map((e) => Lesson.fromJson(e as Map<String, dynamic>))
          .toList(),
      sumHours: json['sumHours'] as double?,
      sumLessonFinish: json['sumLessonFinish'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'courseId': courseId,
      'numberOrder': numberOrder,
      'name': name,
      'isDeleted': isDeleted,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'lesson': lesson?.map((e) => e.toJson()).toList(),
      'sumHours': sumHours,
      'sumLessonFinish': sumLessonFinish,
    };
  }

  Section copyWith({
    String? id,
    String? courseId,
    int? numberOrder,
    String? name,
    bool? isDeleted,
    String? createdAt,
    String? updatedAt,
    List<Lesson>? lesson,
    double? sumHours,
    int? sumLessonFinish,
  }) {
    return Section(
      id: id ?? this.id,
      courseId: courseId ?? this.courseId,
      numberOrder: numberOrder ?? this.numberOrder,
      name: name ?? this.name,
      isDeleted: isDeleted ?? this.isDeleted,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      lesson: lesson ?? this.lesson,
      sumHours: sumHours ?? this.sumHours,
      sumLessonFinish: sumLessonFinish ?? this.sumLessonFinish,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      courseId,
      numberOrder,
      name,
      isDeleted,
      createdAt,
      updatedAt,
      lesson,
      sumHours,
      sumLessonFinish,
    ];
  }
}
