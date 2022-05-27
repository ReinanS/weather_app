import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:weather_app/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/presentation/bloc/weather_event.dart';
import 'package:weather_app/presentation/widgets/app_colors.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WeatherBloc>();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onChanged: ((query) => bloc.add(OnCityChanged(query))),
              decoration: InputDecoration(
                prefixStyle: const TextStyle(fontSize: 25, color: Colors.blue),
                filled: true,
                fillColor: AppColors.bgGreyColor.withAlpha(235),
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.blue.withAlpha(135)),
                suffixIcon: const Icon(Icons.search, color: Colors.blue),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.bgGreyColor.withAlpha(235),
            ),
            child: IconButton(
              padding: const EdgeInsets.all(12),
              iconSize: 26,
              onPressed: () {},
              icon: const Icon(Icons.location_on_outlined, color: Colors.green),
            ),
          )
        ],
      ),
    );
  }
}
