import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sawari/src/assets/assets.dart';

class CardWidget extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;

  const CardWidget({
    Key key,
    @required this.width,
    @required this.height,
    @required this.child,
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
      margin: EdgeInsets.all(
        ScreenUtil().setHeight(15),
      ),
      width: ScreenUtil().setWidth(width),
      height: ScreenUtil().setHeight(height),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          ScreenUtil().setWidth(15),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            color: Colors.black12,
            offset: Offset(0, 1),
            spreadRadius: 1,
          ),
        ],
      ),
      child: child,
    );
  }
}
