import 'package:health_sync/domain/entities/home/dash_board_response_card_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dash_board_card_response_model.g.dart';

@JsonSerializable()
class DashBoardCardResponseModel {
  @JsonKey(name: "total")
  final int? total;

  DashBoardCardResponseModel({this.total});

  factory DashBoardCardResponseModel.fromJson(Map<String, dynamic> json) {
    return _$DashBoardCardResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DashBoardCardResponseModelToJson(this);
  }

  DashBoardResponseCardEntity toDomain() {
    return DashBoardResponseCardEntity(total: total);
  }
}
