import 'package:darkruby/extensions.dart';
import 'package:flutter/material.dart';

class DateContainer extends StatelessWidget {
  final String date;
  const DateContainer(this.date, {super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Row(
        spacing: 8,
        children: [
          Column(
            mainAxisSize: .max,
            crossAxisAlignment: .start,
            children: [
              Text(date.toDay, style: .new(
                fontSize: textTheme.titleMedium?.fontSize
              )),
              Text(date.toYear, style: .new(
                fontSize: textTheme.titleMedium?.fontSize
              ))
            ],
          ),
          Spacer(),
          Text(date.toHour, style: .new(
            fontSize: textTheme.titleMedium?.fontSize
          ))
        ],
      ),
    );
  }
}