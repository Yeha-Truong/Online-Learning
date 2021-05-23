import 'package:equatable/equatable.dart';

import 'course_info.dart';
import 'instructor.dart';
import 'ratings.dart';
import 'section.dart';

class CourseDetail extends Equatable {
  final String? id;
  final String? title;
  final String? subtitle;
  final int? price;
  final String? description;
  final List<String>? requirement;
  final List<String>? learnWhat;
  final int? soldNumber;
  final int? ratedNumber;
  final int? videoNumber;
  final double? totalHours;
  final double? formalityPoint;
  final double? contentPoint;
  final double? presentationPoint;
  final String? imageUrl;
  final String? promoVidUrl;
  final String? status;
  final bool? isHidden;
  final String? createdAt;
  final String? updatedAt;
  final String? instructorId;
  final int? typeUploadVideoLesson;
  final List<Section>? section;
  final Ratings? ratings;
  final String? averagePoint;
  final Instructor? instructor;
  final List<CourseInfo>? coursesLikeCategory;

  const CourseDetail({
    this.id,
    this.title,
    this.subtitle,
    this.price,
    this.description,
    this.requirement,
    this.learnWhat,
    this.soldNumber,
    this.ratedNumber,
    this.videoNumber,
    this.totalHours,
    this.formalityPoint,
    this.contentPoint,
    this.presentationPoint,
    this.imageUrl,
    this.promoVidUrl,
    this.status,
    this.isHidden,
    this.createdAt,
    this.updatedAt,
    this.instructorId,
    this.typeUploadVideoLesson,
    this.section,
    this.ratings,
    this.averagePoint,
    this.instructor,
    this.coursesLikeCategory,
  });

  factory CourseDetail.fromJson(Map<String, dynamic> json) {
    return CourseDetail(
      id: json['id'] as String?,
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      price: json['price'] as int?,
      description: json['description'] as String?,
      requirement: List<String>.from(json['requirement']),
      learnWhat: List<String>.from(json['learnWhat']),
      soldNumber: json['soldNumber'] as int?,
      ratedNumber: json['ratedNumber'] as int?,
      videoNumber: json['videoNumber'] as int?,
      totalHours: json['totalHours'] as double?,
      formalityPoint: double.parse(json['formalityPoint'].toString()),
      contentPoint: double.parse(json['contentPoint'].toString()),
      presentationPoint: double.parse(json['presentationPoint'].toString()),
      imageUrl: json['imageUrl'] as String?,
      promoVidUrl: json['promoVidUrl'] as String?,
      status: json['status'] as String?,
      isHidden: json['isHidden'] as bool?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      instructorId: json['instructorId'] as String?,
      typeUploadVideoLesson: json['typeUploadVideoLesson'] as int?,
      section: (json['section'] as List<dynamic>?)
          ?.map((e) => Section.fromJson(e as Map<String, dynamic>))
          .toList(),
      ratings: json['ratings'] == null
          ? null
          : Ratings.fromJson(json['ratings'] as Map<String, dynamic>),
      averagePoint: json['averagePoint'] as String?,
      instructor: json['instructor'] == null
          ? null
          : Instructor.fromJson(json['instructor'] as Map<String, dynamic>),
      coursesLikeCategory: (json['coursesLikeCategory'] as List<dynamic>?)
          ?.map((e) => CourseInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'price': price,
      'description': description,
      'requirement': requirement,
      'learnWhat': learnWhat,
      'soldNumber': soldNumber,
      'ratedNumber': ratedNumber,
      'videoNumber': videoNumber,
      'totalHours': totalHours,
      'formalityPoint': formalityPoint,
      'contentPoint': contentPoint,
      'presentationPoint': presentationPoint,
      'imageUrl': imageUrl,
      'promoVidUrl': promoVidUrl,
      'status': status,
      'isHidden': isHidden,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'instructorId': instructorId,
      'typeUploadVideoLesson': typeUploadVideoLesson,
      'section': section?.map((e) => e.toJson()).toList(),
      'ratings': ratings?.toJson(),
      'averagePoint': averagePoint,
      'instructor': instructor?.toJson(),
      'coursesLikeCategory':
          coursesLikeCategory?.map((e) => e.toJson()).toList(),
    };
  }

  CourseDetail copyWith({
    String? id,
    String? title,
    String? subtitle,
    int? price,
    String? description,
    List<String>? requirement,
    List<String>? learnWhat,
    int? soldNumber,
    int? ratedNumber,
    int? videoNumber,
    double? totalHours,
    double? formalityPoint,
    double? contentPoint,
    double? presentationPoint,
    String? imageUrl,
    String? promoVidUrl,
    String? status,
    bool? isHidden,
    String? createdAt,
    String? updatedAt,
    String? instructorId,
    int? typeUploadVideoLesson,
    List<Section>? section,
    Ratings? ratings,
    String? averagePoint,
    Instructor? instructor,
    List<CourseInfo>? coursesLikeCategory,
  }) {
    return CourseDetail(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      price: price ?? this.price,
      description: description ?? this.description,
      requirement: requirement ?? this.requirement,
      learnWhat: learnWhat ?? this.learnWhat,
      soldNumber: soldNumber ?? this.soldNumber,
      ratedNumber: ratedNumber ?? this.ratedNumber,
      videoNumber: videoNumber ?? this.videoNumber,
      totalHours: totalHours ?? this.totalHours,
      formalityPoint: formalityPoint ?? this.formalityPoint,
      contentPoint: contentPoint ?? this.contentPoint,
      presentationPoint: presentationPoint ?? this.presentationPoint,
      imageUrl: imageUrl ?? this.imageUrl,
      promoVidUrl: promoVidUrl ?? this.promoVidUrl,
      status: status ?? this.status,
      isHidden: isHidden ?? this.isHidden,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      instructorId: instructorId ?? this.instructorId,
      typeUploadVideoLesson:
          typeUploadVideoLesson ?? this.typeUploadVideoLesson,
      section: section ?? this.section,
      ratings: ratings ?? this.ratings,
      averagePoint: averagePoint ?? this.averagePoint,
      instructor: instructor ?? this.instructor,
      coursesLikeCategory: coursesLikeCategory ?? this.coursesLikeCategory,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      title,
      subtitle,
      price,
      description,
      requirement,
      learnWhat,
      soldNumber,
      ratedNumber,
      videoNumber,
      totalHours,
      formalityPoint,
      contentPoint,
      presentationPoint,
      imageUrl,
      promoVidUrl,
      status,
      isHidden,
      createdAt,
      updatedAt,
      instructorId,
      typeUploadVideoLesson,
      section,
      ratings,
      averagePoint,
      instructor,
      coursesLikeCategory,
    ];
  }
}
