import 'package:equatable/equatable.dart';

import 'rating.dart';

class Ratings extends Equatable {
  final List<Rating>? ratingList;
  final List<int>? stars;

  const Ratings({this.ratingList, this.stars});

  factory Ratings.fromJson(Map<String, dynamic> json) {
    return Ratings(
      ratingList: (json['ratingList'] as List<dynamic>?)
          ?.map((e) => Rating.fromJson(e as Map<String, dynamic>))
          .toList(),
      stars: List<int>.from(json['stars']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ratingList': ratingList?.map((e) => e.toJson()).toList(),
      'stars': stars,
    };
  }

  Ratings copyWith({
    List<Rating>? ratingList,
    List<int>? stars,
  }) {
    return Ratings(
      ratingList: ratingList ?? this.ratingList,
      stars: stars ?? this.stars,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [ratingList, stars];
}
