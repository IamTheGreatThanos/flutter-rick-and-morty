// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseInfoModel _$ResponseInfoModelFromJson(Map<String, dynamic> json) =>
    ResponseInfoModel(
      count: (json['count'] as num).toInt(),
      pages: (json['pages'] as num).toInt(),
      next: json['next'] as String?,
      prev: json['prev'] as String?,
    );

Map<String, dynamic> _$ResponseInfoModelToJson(ResponseInfoModel instance) {
  final val = <String, dynamic>{
    'count': instance.count,
    'pages': instance.pages,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('next', instance.next);
  writeNotNull('prev', instance.prev);
  return val;
}
