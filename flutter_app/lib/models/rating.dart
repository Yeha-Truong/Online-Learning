import 'package:equatable/equatable.dart';

import 'user.dart';

class Rating extends Equatable {
  final String? id;
  final String? userId;
  final String? courseId;
  final int? formalityPoint;
  final int? contentPoint;
  final int? presentationPoint;
  final String? content;
  final String? createdAt;
  final String? updatedAt;
  final User? user;
  final int? averagePoint;

  const Rating({
    this.id,
    this.userId,
    this.courseId,
    this.formalityPoint,
    this.contentPoint,
    this.presentationPoint,
    this.content,
    this.createdAt,
    this.updatedAt,
    this.user,
    this.averagePoint,
  });

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      id: json['id'] as String?,
      userId: json['userId'] as String?,
      courseId: json['courseId'] as String?,
      formalityPoint: json['formalityPoint'] as int?,
      contentPoint: json['contentPoint'] as int?,
      presentationPoint: json['presentationPoint'] as int?,
      content: json['content'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      averagePoint: json['averagePoint'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'courseId': courseId,
      'formalityPoint': formalityPoint,
      'contentPoint': contentPoint,
      'presentationPoint': presentationPoint,
      'content': content,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'user': user?.toJson(),
      'averagePoint': averagePoint,
    };
  }

  Rating copyWith({
    String? id,
    String? userId,
    String? courseId,
    int? formalityPoint,
    int? contentPoint,
    int? presentationPoint,
    String? content,
    String? createdAt,
    String? updatedAt,
    User? user,
    int? averagePoint,
  }) {
    return Rating(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      courseId: courseId ?? this.courseId,
      formalityPoint: formalityPoint ?? this.formalityPoint,
      contentPoint: contentPoint ?? this.contentPoint,
      presentationPoint: presentationPoint ?? this.presentationPoint,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      user: user ?? this.user,
      averagePoint: averagePoint ?? this.averagePoint,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      userId,
      courseId,
      formalityPoint,
      contentPoint,
      presentationPoint,
      content,
      createdAt,
      updatedAt,
      user,
      averagePoint,
    ];
  }
}
