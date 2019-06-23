import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sawari/src/assets/assets.dart';
import 'package:intl/intl.dart';

class DateTimeSelected extends StatelessWidget {
  final DateTime date;
  final TimeOfDay time;

  const DateTimeSelected({
    Key key,
    @required this.date,
    @required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: ScreenSize.screenWidth,
      height: ScreenSize.screenHeight,
      allowFontScaling: true,
    )..init(context);

    return Container(
      padding: EdgeInsets.all(
        ScreenUtil().setHeight(10),
      ),
      width: ScreenUtil().setWidth(150),
      height: ScreenUtil().setHeight(90),
      decoration: BoxDecoration(
        color: Color(AppColors.PINK),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.calendar_today,
                color: Colors.white,
                size: FontSize.fontSize12,
              ),
              SizedBox(width: ScreenUtil().setWidth(5)),
              Text(
                '${DateFormat.yMMMd().format(date)}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: FontSize.fontSize12,
                ),
              ),
            ],
          ),
          SizedBox(height: ScreenUtil().setHeight(10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.access_time,
                color: Colors.white,
                size: FontSize.fontSize16,
              ),
              SizedBox(width: ScreenUtil().setWidth(5)),
              Text(
                '${time.format(context)}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: FontSize.fontSize16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
