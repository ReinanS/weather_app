import 'package:flutter/material.dart';
import 'package:weather_app/presentation/widgets/app_colors.dart';
import 'package:weather_app/presentation/widgets/app_text_componet.dart';

class CustomListTile extends StatelessWidget {
  final String first;
  final String second;
  final IconData icon;
  final Color iconColor;
  final String text;

  const CustomListTile({
    Key? key,
    required this.first,
    required this.second,
    required this.icon,
    required this.iconColor,
    this.text = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: AppTextComponent(
          size: 16, text: text, color: AppColors.darkGreyColor),
      leading: Icon(icon, color: iconColor),
      title: RichText(
        maxLines: 1,
        text: TextSpan(
          children: [
            TextSpan(
              text: first,
              style: const TextStyle(
                color: AppColors.darkGreyColor,
                fontSize: 16,
              ),
            ),
            TextSpan(
              text: second,
              style: const TextStyle(
                color: AppColors.primaryColor,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
