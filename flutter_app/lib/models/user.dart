import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? id;
  final String? email;
  final String? avatar;
  final String? name;
  final List<dynamic>? favoriteCategories;
  final int? point;
  final String? phone;
  final String? type;
  final bool? isDeleted;
  final bool? isActivated;
  final String? createdAt;
  final String? updatedAt;

  const User({
    this.id,
    this.email,
    this.avatar,
    this.name,
    this.favoriteCategories,
    this.point,
    this.phone,
    this.type,
    this.isDeleted,
    this.isActivated,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String?,
      email: json['email'] as String?,
      avatar: json['avatar'] as String?,
      name: json['name'] as String?,
      favoriteCategories: json['favoriteCategories'] as List<dynamic>?,
      point: json['point'] as int?,
      phone: json['phone'] as String?,
      type: json['type'] as String?,
      isDeleted: json['isDeleted'] as bool?,
      isActivated: json['isActivated'] as bool?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'avatar': avatar,
      'name': name,
      'favoriteCategories': favoriteCategories,
      'point': point,
      'phone': phone,
      'type': type,
      'isDeleted': isDeleted,
      'isActivated': isActivated,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  User copyWith({
    String? id,
    String? email,
    String? avatar,
    String? name,
    List<dynamic>? favoriteCategories,
    int? point,
    String? phone,
    String? type,
    bool? isDeleted,
    bool? isActivated,
    String? createdAt,
    String? updatedAt,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
      name: name ?? this.name,
      favoriteCategories: favoriteCategories ?? this.favoriteCategories,
      point: point ?? this.point,
      phone: phone ?? this.phone,
      type: type ?? this.type,
      isDeleted: isDeleted ?? this.isDeleted,
      isActivated: isActivated ?? this.isActivated,
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
      email,
      avatar,
      name,
      favoriteCategories,
      point,
      phone,
      type,
      isDeleted,
      isActivated,
      createdAt,
      updatedAt,
    ];
  }
}
