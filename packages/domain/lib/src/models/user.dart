import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'user.g.dart';

@immutable
@JsonSerializable()
class User extends Equatable {
  final String token;
  final int? id;

  const User(this.token, this.id);

  /// Deserializes the given [Map] into a [User].
  static User fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Converts this [User] into a [Map].
  Map<String, dynamic> toJson() => _$UserToJson(this);
  @override
  List<Object?> get props => [token, id];
}
