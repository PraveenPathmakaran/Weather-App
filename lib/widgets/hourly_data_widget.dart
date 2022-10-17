import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/controller/global_controller.dart';
import 'package:weatherapp/model/weather_data_hourly.dart';
import 'package:weatherapp/utils/custom_colors.dart';

import '../controller/app_theme.dart';

class HourlyDataWidget extends StatelessWidget {
  final WeatherDataHourly weatherDataHourly;
  HourlyDataWidget({super.key, required this.weatherDataHourly});
  final ThemeController themeController = Get.put(ThemeController());

  RxInt cardIndex = GlobalController().getIndex();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 20,
          ),
          alignment: Alignment.topCenter,
          child: const Text(
            'Today',
            style: TextStyle(fontSize: 18),
          ),
        ),
        hourlyList()
      ],
    );
  }

  Widget hourlyList() {
    return Container(
      height: 160,
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: weatherDataHourly.hourly.length > 12
            ? 12
            : weatherDataHourly.hourly.length,
        itemBuilder: (context, index) {
          return Obx(() {
            return GestureDetector(
              onTap: () {
                cardIndex.value = index;
              },
              child: Container(
                width: 90,
                margin: const EdgeInsets.only(left: 20, right: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: color(index),
                ),
                child: HourlyDetails(
                  temp: weatherDataHourly.hourly[index].temp!,
                  timeStamp: weatherDataHourly.hourly[index].dt!,
                  weatherIcon:
                      weatherDataHourly.hourly[index].weather![0].icon!,
                  index: index,
                  cardIndex: cardIndex.toInt(),
                ),
              ),
            );
          });
        },
      ),
    );
  }

  Color? color(int index) {
    Color? color;

    if (cardIndex.value == index) {
      color = Colors.blue;
      return color;
    }
    if (themeController.isDarkMode) {
      color = Colors.black.withAlpha(100);
    } else {
      color = CustomColors.dividerLine.withAlpha(150);
    }

    return color;
  }
}

//hourly data class

class HourlyDetails extends StatelessWidget {
  int temp;
  int index;
  int cardIndex;
  int timeStamp;
  String weatherIcon;

  String getTime(final timeStamp) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    String data = DateFormat('jm').format(time);
    return data;
  }

  HourlyDetails(
      {super.key,
      required this.timeStamp,
      required this.temp,
      required this.weatherIcon,
      required this.cardIndex,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text(
            getTime(timeStamp),
            style: TextStyle(
                color: cardIndex == index
                    ? Colors.white
                    : Theme.of(context).textTheme.bodyText2?.color),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(5),
          child: Image.asset(
            'assets/weather/$weatherIcon.png',
            height: 40,
            width: 40,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Text(
            '$temp°',
            style: TextStyle(
                color: cardIndex == index
                    ? Colors.white
                    : Theme.of(context).textTheme.bodyText2?.color),
          ),
        )
      ],
    );
  }
}
