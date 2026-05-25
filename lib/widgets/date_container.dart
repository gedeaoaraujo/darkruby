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
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          SizedBox(
            width: width * 0.70,
            child: ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                alignment: .centerStart,
                padding: EdgeInsetsGeometry.symmetric(
                  horizontal: 0 ,vertical: 8
                ),
                shape: RoundedRectangleBorder(borderRadius: .circular(8))
              ),
              child: Column(
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
            ),
          ),
          SizedBox(
            width: width * 0.20,
            child: ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                alignment: .centerEnd,
                padding: EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(borderRadius: .circular(8))
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  date.toHour,
                  textAlign: .end, 
                  style: .new(
                    fontSize: textTheme.titleMedium?.fontSize
                  )
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}