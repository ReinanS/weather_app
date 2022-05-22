import 'package:equatable/equatable.dart';

class Condition extends Equatable {
  const Condition({
    required this.text,
    required this.icon,
    required this.code,
  });

  final String text;
  final String icon;
  final int code;

  @override
  List<Object?> get props => [text, icon, code];
}
