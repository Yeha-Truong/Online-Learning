import 'package:equatable/equatable.dart';

import 'rating_list.dart';

class Ratings extends Equatable {
  final List<RatingList>? ratingList;
  final List<int>? stars;

  const Ratings({this.ratingList, this.stars});

  factory Ratings.fromJson(Map<String, dynamic> json) {
    return Ratings(
      ratingList: (json['ratingList'] as List<dynamic>?)
          ?.map((e) => RatingList.fromJson(e as Map<String, dynamic>))
          .toList(),
      stars: json['stars'] as List<int>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ratingList': ratingList?.map((e) => e.toJson()).toList(),
      'stars': stars,
    };
  }

  Ratings copyWith({
    List<RatingList>? ratingList,
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