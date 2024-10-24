import 'package:json_annotation/json_annotation.dart';

part 'response_info_model.g.dart';

@JsonSerializable(includeIfNull: false)
class ResponseInfoModel {
  final int count;
  final int pages;
  final String? next;
  final String? prev;

  ResponseInfoModel(
      {required this.count,
      required this.pages,
      required this.next,
      required this.prev});

  factory ResponseInfoModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseInfoModelFromJson(json);

  /// Connect the generated [_$ResponseInfoModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ResponseInfoModelToJson(this);
}
