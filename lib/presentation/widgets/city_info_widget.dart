import 'package:flutter/material.dart';
import 'package:weather_app/data/constants.dart';
import 'package:weather_app/domain/entities/weather.dart';
import 'package:weather_app/presentation/widgets/app_colors.dart';
import 'package:weather_app/presentation/widgets/app_text_componet.dart';

class CityInfoWidget extends StatelessWidget {
  final Weather weather;

  const CityInfoWidget({
    Key? key,
    required this.weather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
          image: NetworkImage(
            Urls.weatherIcon(weather.current.condition.icon),
            scale: 1.2,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: AppTextComponent(
                size: 30,
                text: weather.location.name,
                isBold: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            RotationTransition(
              turns: AlwaysStoppedAnimation(weather.current.windDegree / 360),
              child: const Icon(Icons.north, color: AppColors.primaryColor),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppTextComponent(
              size: 70,
              text: '${weather.current.tempC}º',
            ),
            AppTextComponent(
              size: 20,
              text: '${weather.current.feelslikeC}º',
              color: AppColors.darkGreyColor,
            ),
          ],
        ),
      ],
    );
  }
}
