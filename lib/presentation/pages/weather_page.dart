import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/presentation/bloc/weather_state.dart';
import 'package:weather_app/presentation/pages/components/barometer_widget.dart';
import 'package:weather_app/presentation/pages/components/carousel_widget.dart';
import 'package:weather_app/presentation/pages/components/city_info_widget.dart';
import 'package:weather_app/presentation/pages/components/header_widget.dart';
import 'package:weather_app/presentation/pages/components/wind_widget.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const HeaderWidget(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BlocBuilder<WeatherBloc, WeatherState>(
                      builder: (context, state) {
                    if (state is WeatherLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (state is WeatherEmpty) {
                      return const SizedBox();
                    }

                    if (state is WeatherHasData) {
                      return Column(
                        key: const Key('weather_data'),
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CityInfoWidget(weather: state.result),
                          const SizedBox(height: 15),
                          CarouselWidget(
                            listHours:
                                state.result.forecast.forecastday[0].hour,
                          ),
                          const SizedBox(height: 15),
                          WindWidget(current: state.result.current),
                          const SizedBox(height: 15),
                          BarometerWidget(current: state.result.current),
                        ],
                      );
                    }

                    return const Center(child: Text('Something went wrong!'));
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
