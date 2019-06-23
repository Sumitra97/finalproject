import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sawari/src/assets/assets.dart';
import 'package:sawari/src/widgets/logo/logo.dart';

class SelectionScaffold extends StatelessWidget {
  final Widget child;

  const SelectionScaffold({
    Key key,
    @required this.city,
    @required this.child,
  }) : super(key: key);

  final String city;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: ScreenSize.screenWidth,
      height: ScreenSize.screenHeight,
      allowFontScaling: true,
    )..init(context);

    return Scaffold(
      backgroundColor: Color(AppColors.PINK),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              width: ScreenUtil().setWidth(ScreenSize.screenWidth),
              height: ScreenUtil().setHeight(200),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    Cities.cityImages[city],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              width: ScreenUtil().setWidth(ScreenSize.screenWidth),
              height: ScreenUtil().setHeight(200),
              color: Colors.black12,
            ),
          ),
          Positioned(
            top: ScreenUtil().setHeight(100),
            left: ScreenUtil().setWidth(15),
            right: 0,
            child: Text(
              '$city',
              style: TextStyle(
                color: Colors.white,
                fontSize: FontSize.fontSize18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: ScreenUtil().setHeight(130),
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(30),
                left: ScreenUtil().setWidth(20),
                right: ScreenUtil().setWidth(20),
              ),
              width: ScreenUtil().setWidth(ScreenSize.screenWidth),
              height: ScreenUtil().setHeight(ScreenSize.screenHeight),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    ScreenUtil().setWidth(40),
                  ),
                  topRight: Radius.circular(
                    ScreenUtil().setWidth(40),
                  ),
                ),
              ),
              child: child,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              automaticallyImplyLeading: false,
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              centerTitle: true,
              title: Logo(),
            ),
          )
        ],
      ),
    );
  }
}
