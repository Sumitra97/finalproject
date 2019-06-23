import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sawari/src/assets/assets.dart';

class DateTimeSelectionCard extends StatelessWidget {
  final String title;
  final Function dateTimeHandler;

  const DateTimeSelectionCard({
    Key key,
    @required this.title,
    @required this.dateTimeHandler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: ScreenSize.screenWidth,
      height: ScreenSize.screenHeight,
      allowFontScaling: true,
    )..init(context);

    return GestureDetector(
      onTap: () async {
        DateTime initialDate = DateTime.now();
        DateTime dateTime = await showDatePicker(
          context: context,
          initialDate: initialDate,
          firstDate: initialDate,
          lastDate: DateTime.now().add(
            Duration(
              days: 365,
            ),
          ),
        );

        if (dateTime == null)
          dateTime = DateTime.now().add(
            Duration(days: 1),
          );

        TimeOfDay timeOfDay = await showTimePicker(
          context: context,
          initialTime: TimeOfDay(
            hour: 00,
            minute: 00,
          ),
        );

        if (timeOfDay == null) timeOfDay = TimeOfDay.now();

        Map<String, dynamic> data = {
          'date': dateTime,
          'time': timeOfDay,
        };

        dateTimeHandler(data);
      },
      child: Container(
        padding: EdgeInsets.all(
          ScreenUtil().setHeight(10),
        ),
        width: ScreenUtil().setWidth(150),
        height: ScreenUtil().setHeight(90),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            ScreenUtil().setWidth(15),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              color: Colors.black12,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.add_circle_outline,
              size: FontSize.fontSize28,
              color: Colors.black54,
            ),
            SizedBox(height: ScreenUtil().setHeight(5)),
            Text(
              'Select drop off time',
              style: TextStyle(
                fontSize: FontSize.fontSize12,
                color: Colors.black45,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
