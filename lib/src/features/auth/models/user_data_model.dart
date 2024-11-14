import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data_model.freezed.dart';
part 'user_data_model.g.dart';

@Freezed()
abstract class UserDataModel with _$UserDataModel {
  const factory UserDataModel({
    String? name,
    String? email,
    String? phone,
    String? address,
    String? image,
    String? token,
  }) = _UserDataModel;

  factory UserDataModel.fromJson(Map<String, dynamic> json) =>
      _$UserDataModelFromJson(json);
}
