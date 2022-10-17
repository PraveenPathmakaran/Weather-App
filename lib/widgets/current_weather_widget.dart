import 'package:flutter/material.dart';
import 'package:weatherapp/model/weather_data_current.dart';
import 'package:weatherapp/utils/custom_colors.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;
  const CurrentWeatherWidget({super.key, required this.weatherDataCurrent});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //temperature area
        temperatureAreaWidget(),
        const SizedBox(
          height: 20,
        ),
        currentWeatherMoreDetailWidget(),
      ],
    );
  }

  Widget currentWeatherMoreDetailWidget() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            MoreDetailListWidget(
              path: 'assets/icons/windspeed.png',
            ),
            MoreDetailListWidget(
              path: 'assets/icons/clouds.png',
            ),
            MoreDetailListWidget(
              path: 'assets/icons/humidity.png',
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 20,
              width: 70,
              child: Text(
                '${weatherDataCurrent.current.windSpeed} km/h',
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
              width: 60,
              child: Text(
                '${weatherDataCurrent.current.clouds}%',
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
              width: 60,
              child: Text(
                '${weatherDataCurrent.current.humidity}%',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget temperatureAreaWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          'assets/weather/${weatherDataCurrent.current.weather![0].icon}.png',
          width: 80,
          height: 80,
        ),
        Container(
          height: 50,
          width: 1,
          color: CustomColors.dividerLine,
        ),
        Row(
          children: [
            Builder(builder: (context) {
              return RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: '${weatherDataCurrent.current.temp!.toInt()}°',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 68,
                        color: Theme.of(context).textTheme.bodyText2?.color),
                  ),
                  TextSpan(
                    text:
                        '${weatherDataCurrent.current.weather![0].description}°',
                    style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                        color: Colors.grey),
                  ),
                ]),
              );
            })
          ],
        ),
      ],
    );
  }
}

class MoreDetailListWidget extends StatelessWidget {
  final String path;
  const MoreDetailListWidget({Key? key, required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: CustomColors.cardColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Image.asset(path),
    );
  }
}
