import 'package:rickandmorty/src/core/entities/response_info_entity.dart';
import 'package:rickandmorty/src/models/response_info_model.dart';

extension ResponseInfoMapper on ResponseInfoModel {
  ResponseInfoEntity toEntity() {
    return ResponseInfoEntity(
        count: count, pages: pages, next: next, prev: prev);
  }
}
