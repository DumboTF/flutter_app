
import 'package:json_annotation/json_annotation.dart';
part 'result.g.dart';
@JsonSerializable()
class Result<T> {
  String code;
  String msg;
  T data;

  Result(this.code, this.msg, this.data);

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
