import 'package:darkruby/extensions.dart';
import 'package:flutter/material.dart';

class DateContainer extends StatelessWidget {
  final String date;
  const DateContainer(this.date, {super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final width = MediaQuery.sizeOf(context).width;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      child: Row(
        spacing: 0,
        children: [
          SizedBox(
            width: width * 0.5,
            child: ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                elevation: 0,
                alignment: .centerStart,
                padding: EdgeInsetsGeometry.symmetric(
                  horizontal: 4 ,vertical: 8
                ),
                shape: RoundedRectangleBorder(borderRadius: .circular(8))
              ),
              child: Row(
                spacing: 16,
                children: [
                  Icon(Icons.calendar_today),
                  Column(
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
                ],
              ),
            ),
          ),
          Spacer(),
          SizedBox(
            width: width * 0.25,
            child: ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                elevation: 0,
                alignment: .center,
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                shape: RoundedRectangleBorder(borderRadius: .circular(8))
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  spacing: 16,
                  children: [
                    Icon(Icons.av_timer),
                    Text(
                      date.toHour,
                      textAlign: .center, 
                      style: .new(
                        fontSize: textTheme.titleMedium?.fontSize
                      )
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}