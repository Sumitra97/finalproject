import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sawari/src/assets/assets.dart';

class BookingNotComplete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: ScreenSize.screenWidth,
      height: ScreenSize.screenHeight,
      allowFontScaling: true,
    )..init(context);

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          ScreenUtil().setWidth(15),
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(
          ScreenUtil().setHeight(15),
        ),
        width: ScreenUtil().setWidth(340),
        height: ScreenUtil().setHeight(300),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            ScreenUtil().setWidth(15),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Sorry the booking could not be completed',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: FontSize.fontSize14,
              ),
            ),
            Text(
              'Please upload your documents to continue booking.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: FontSize.fontSize12,
              ),
            ),
            RaisedButton(
              color: Colors.green,
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.PROFILE);
              },
              child: Text(
                'Proceed to profile',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
