import 'package:equatable/equatable.dart';

class Transcript extends Equatable {
  final String? payload;

  const Transcript({this.payload});

  factory Transcript.fromJson(Map<String, dynamic> json) {
    return Transcript(
      payload: json['payload'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'payload': payload,
    };
  }

  Transcript copyWith({
    String? payload,
  }) {
    return Transcript(
      payload: payload ?? this.payload,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [payload];
}
