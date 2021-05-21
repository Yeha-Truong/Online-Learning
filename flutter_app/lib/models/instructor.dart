import 'package:equatable/equatable.dart';

import 'course_info.dart';

class Instructor extends Equatable {
  final String? id;
  final String? userId;
  final String? name;
  final String? email;
  final String? avatar;
  final String? phone;
  final String? major;
  final String? intro;
  final List<String>? skills;
  final String? createdAt;
  final String? updatedAt;
  final int? totalCourse;
  final double? averagePoint;
  final int? countRating;
  final int? ratedNumber;
  final int? soldNumber;
  final List<CourseInfo>? courses;

  const Instructor({
    this.id,
    this.userId,
    this.name,
    this.email,
    this.avatar,
    this.phone,
    this.major,
    this.intro,
    this.skills,
    this.createdAt,
    this.updatedAt,
    this.totalCourse,
    this.averagePoint,
    this.countRating,
    this.ratedNumber,
    this.soldNumber,
    this.courses,
  });

  factory Instructor.fromJson(Map<String, dynamic> json) {
    return Instructor(
      id: json['id'] as String?,
      userId: json['userId'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      avatar: json['avatar'] as String?,
      phone: json['phone'] as String?,
      major: json['major'] as String?,
      intro: json['intro'] as String?,
      skills: List<String>.from(json['skills']),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      totalCourse: json['totalCourse'] as int?,
      averagePoint: double.parse(json['averagePoint'].toString()),
      countRating: json['countRating'] as int?,
      ratedNumber: json['ratedNumber'] as int?,
      soldNumber: json['soldNumber'] as int?,
      courses: (json['courses'] as List<dynamic>?)
          ?.map((e) => CourseInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'name': name,
      'email': email,
      'avatar': avatar,
      'phone': phone,
      'major': major,
      'intro': intro,
      'skills': skills,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'totalCourse': totalCourse,
      'averagePoint': averagePoint,
      'countRating': countRating,
      'ratedNumber': ratedNumber,
      'soldNumber': soldNumber,
      'courses': courses?.map((e) => e.toJson()).toList(),
    };
  }

  Instructor copyWith({
    String? id,
    String? userId,
    String? name,
    String? email,
    String? avatar,
    String? phone,
    String? major,
    String? intro,
    List<String>? skills,
    String? createdAt,
    String? updatedAt,
    int? totalCourse,
    double? averagePoint,
    int? countRating,
    int? ratedNumber,
    int? soldNumber,
    List<CourseInfo>? courses,
  }) {
    return Instructor(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
      phone: phone ?? this.phone,
      major: major ?? this.major,
      intro: intro ?? this.intro,
      skills: skills ?? this.skills,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      totalCourse: totalCourse ?? this.totalCourse,
      averagePoint: averagePoint ?? this.averagePoint,
      countRating: countRating ?? this.countRating,
      ratedNumber: ratedNumber ?? this.ratedNumber,
      soldNumber: soldNumber ?? this.soldNumber,
      courses: courses ?? this.courses,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      userId,
      name,
      email,
      avatar,
      phone,
      major,
      intro,
      skills,
      createdAt,
      updatedAt,
      totalCourse,
      averagePoint,
      countRating,
      ratedNumber,
      soldNumber,
      courses,
    ];
  }
}
