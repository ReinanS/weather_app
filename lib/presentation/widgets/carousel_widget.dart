import 'package:flutter/material.dart';
import 'package:weather_app/domain/entities/hour_model.dart';
import 'package:weather_app/presentation/widgets/app_colors.dart';
import 'package:weather_app/presentation/widgets/app_text_componet.dart';

class CarouselWidget extends StatelessWidget {
  final List<Hour> listHours;

  const CarouselWidget({
    Key? key,
    required this.listHours,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 23,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, index) {
          return Container(
            margin: index == 0 ? const EdgeInsets.only(left: 20) : null,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  index < 11
                      ? AppTextComponent(
                          size: 14,
                          text: '${index + 1} am',
                          color: AppColors.primaryColor,
                        )
                      : index == 11
                          ? AppTextComponent(
                              size: 14,
                              text: '${index + 1} pm',
                              color: AppColors.primaryColor,
                            )
                          : AppTextComponent(
                              size: 14,
                              text: '${index - 11} pm',
                              color: AppColors.primaryColor,
                            ),
                  const SizedBox(height: 10),
                  Image.network(
                    'https://${(listHours[index].condition.icon).toString().substring(2)}',
                    scale: 2,
                  ),
                  const SizedBox(height: 5),
                  AppTextComponent(
                    size: 14,
                    text: '${listHours[index].tempC}º',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
