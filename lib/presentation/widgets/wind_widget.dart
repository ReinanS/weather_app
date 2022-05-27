import 'package:flutter/material.dart';
import 'package:weather_app/domain/entities/current.dart';
import 'package:weather_app/presentation/widgets/app_colors.dart';
import 'package:weather_app/presentation/widgets/app_text_componet.dart';
import 'package:weather_app/presentation/widgets/custom_list_tile.dart';

class WindWidget extends StatelessWidget {
  final Current current;

  const WindWidget({
    Key? key,
    required this.current,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: AppTextComponent(
              size: 20,
              color: AppColors.primaryColor.withOpacity(0.8),
              text: 'Wind',
              isBold: FontWeight.bold,
            ),
          ),
          Card(
            color: AppColors.bgGreyColor,
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
            child: SizedBox(
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomListTile(
                    text: current.windDir,
                    first: 'Speed: ',
                    second: '${current.windKph} km/h',
                    icon: Icons.air,
                    iconColor: Colors.blue,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
