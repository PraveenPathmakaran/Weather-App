import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/model/weather_data_daily.dart';
import 'package:weatherapp/utils/custom_colors.dart';

import '../controller/app_theme.dart';

class DailyDataForecast extends StatelessWidget {
  final WeatherDataDaily weatherDataDaily;
  DailyDataForecast({super.key, required this.weatherDataDaily});
  final ThemeController themeController = Get.put(ThemeController());

  String getDay(final day) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    final x = DateFormat('EEE').format(time);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: themeController.isDarkMode
              ? Colors.black.withAlpha(100)
              : CustomColors.dividerLine.withAlpha(150)),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(bottom: 10),
            child: Text(
              'Next Days',
              style: TextStyle(
                  color: Theme.of(context).textTheme.bodyText2?.color,
                  fontSize: 17),
            ),
          ),
          dailyList(),
        ],
      ),
    );
  }

  Widget dailyList() {
    return SizedBox(
      height: 300,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: weatherDataDaily.daily.length > 7
              ? 7
              : weatherDataDaily.daily.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  height: 60,
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        child: Text(
                          getDay(weatherDataDaily.daily[index].dt),
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyText2?.color,
                              fontSize: 13),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.asset(
                            'assets/weather/${weatherDataDaily.daily[index].weather![0].icon}.png'),
                      ),
                      Text(
                          '${weatherDataDaily.daily[index].temp!.max}°/${weatherDataDaily.daily[index].temp!.min}')
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}
