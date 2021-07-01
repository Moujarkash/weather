import 'package:flutter/material.dart';
import 'package:weather/presentation/resources/colors.dart';

class WeatherItem extends StatelessWidget {
  final String title;
  final String value;

  const WeatherItem({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
          color: lightTextColor, borderRadius: BorderRadius.circular(4)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            maxLines: 1,
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            children: [
              Expanded(
                  child: Text(
                value,
                maxLines: 1,
                style: TextStyle(
                    color: Colors.black.withOpacity(0.7), fontSize: 16),
              ))
            ],
          )
        ],
      ),
    );
  }
}
