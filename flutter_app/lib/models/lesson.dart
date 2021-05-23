import 'package:equatable/equatable.dart';

class Lesson extends Equatable {
  final String? id;
  final String? courseId;
  final String? sectionId;
  final int? numberOrder;
  final String? name;
  final dynamic content;
  final dynamic videoName;
  final String? videoUrl;
  final dynamic captionName;
  final double? hours;
  final bool? isPreview;
  final bool? isPublic;
  final bool? isDeleted;
  final String? createdAt;
  final String? updatedAt;

  const Lesson({
    this.id,
    this.courseId,
    this.sectionId,
    this.numberOrder,
    this.name,
    this.content,
    this.videoName,
    this.videoUrl,
    this.captionName,
    this.hours,
    this.isPreview,
    this.isPublic,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      id: json['id'] as String?,
      courseId: json['courseId'] as String?,
      sectionId: json['sectionId'] as String?,
      numberOrder: json['numberOrder'] as int?,
      name: json['name'] as String?,
      content: json['content'],
      videoName: json['videoName'],
      videoUrl: json['videoUrl'] as String?,
      captionName: json['captionName'],
      hours: json['hours'] as double?,
      isPreview: json['isPreview'] as bool?,
      isPublic: json['isPublic'] as bool?,
      isDeleted: json['isDeleted'] as bool?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'courseId': courseId,
      'sectionId': sectionId,
      'numberOrder': numberOrder,
      'name': name,
      'content': content,
      'videoName': videoName,
      'videoUrl': videoUrl,
      'captionName': captionName,
      'hours': hours,
      'isPreview': isPreview,
      'isPublic': isPublic,
      'isDeleted': isDeleted,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  Lesson copyWith({
    String? id,
    String? courseId,
    String? sectionId,
    int? numberOrder,
    String? name,
    dynamic content,
    dynamic videoName,
    String? videoUrl,
    dynamic captionName,
    double? hours,
    bool? isPreview,
    bool? isPublic,
    bool? isDeleted,
    String? createdAt,
    String? updatedAt,
  }) {
    return Lesson(
      id: id ?? this.id,
      courseId: courseId ?? this.courseId,
      sectionId: sectionId ?? this.sectionId,
      numberOrder: numberOrder ?? this.numberOrder,
      name: name ?? this.name,
      content: content ?? this.content,
      videoName: videoName ?? this.videoName,
      videoUrl: videoUrl ?? this.videoUrl,
      captionName: captionName ?? this.captionName,
      hours: hours ?? this.hours,
      isPreview: isPreview ?? this.isPreview,
      isPublic: isPublic ?? this.isPublic,
      isDeleted: isDeleted ?? this.isDeleted,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      courseId,
      sectionId,
      numberOrder,
      name,
      content,
      videoName,
      videoUrl,
      captionName,
      hours,
      isPreview,
      isPublic,
      isDeleted,
      createdAt,
      updatedAt,
    ];
  }
}
