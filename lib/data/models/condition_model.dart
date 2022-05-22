import 'package:equatable/equatable.dart';
import 'package:weather_app/domain/entities/condition.dart';

class ConditionModel extends Equatable {
  const ConditionModel({
    required this.text,
    required this.icon,
    required this.code,
  });

  final String text;
  final String icon;
  final int code;

  factory ConditionModel.fromJson(Map<String, dynamic> json) => ConditionModel(
        text: json["text"],
        icon: json["icon"],
        code: json["code"],
      );

  Condition toEntity() => Condition(
        text: text,
        icon: icon,
        code: code,
      );

  @override
  List<Object?> get props => [text, icon, code];
}
