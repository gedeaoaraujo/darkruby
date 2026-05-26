import 'package:darkruby/extensions.dart';
import 'package:flutter/material.dart';

class DateContainer extends StatefulWidget {
  String date;
  final bool readOnly;
  DateContainer(
    this.date, this.readOnly, {super.key}
  );

  @override
  State<DateContainer> createState() => _DateContainerState();
}

class _DateContainerState extends State<DateContainer> {
  
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked == null) return;
    
    setState(() {
      final dt = widget.date.toDateTime();
      widget.date = dt.copyWith(
        year: picked.year,
        month: picked.month,
        day: picked.day
      ).toIso8601String();
    });
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now()
    );
    if (picked == null) return;
    
    setState(() {
      final dt = widget.date.toDateTime();
      widget.date = dt.copyWith(
        hour: picked.hour,
        minute: picked.minute,
      ).toIso8601String();
    });
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
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
              onPressed: widget.readOnly ? null : () {
                _selectDate(context);
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                alignment: .centerStart,
                disabledForegroundColor: scheme.primary,
                disabledBackgroundColor: Colors.transparent,
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
                      Text(widget.date.toDay, style: .new(
                        fontSize: textTheme.titleMedium?.fontSize
                      )),
                      Text(widget.date.toYear, style: .new(
                        fontSize: textTheme.titleSmall?.fontSize
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
              onPressed: widget.readOnly ? null : (){
                _selectTime(context);
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                alignment: .center,
                disabledForegroundColor: scheme.primary,
                disabledBackgroundColor: Colors.transparent,
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
                      widget.date.toHour,
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