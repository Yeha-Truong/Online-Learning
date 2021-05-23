import 'package:equatable/equatable.dart';

class Video extends Equatable {
  final String? videoUrl;
  final int? currentTime;
  final bool? isFinish;

  const Video({
    this.videoUrl,
    this.currentTime,
    this.isFinish,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      videoUrl: json['videoUrl'] as String?,
      currentTime: json['currentTime'] as int?,
      isFinish: json['isFinish'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'videoUrl': videoUrl,
      'currentTime': currentTime,
      'isFinish': isFinish,
    };
  }

  Video copyWith({
    String? videoUrl,
    int? currentTime,
    bool? isFinish,
  }) {
    return Video(
      videoUrl: videoUrl ?? this.videoUrl,
      currentTime: currentTime ?? this.currentTime,
      isFinish: isFinish ?? this.isFinish,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [videoUrl, currentTime, isFinish];
}
