import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sawari/src/assets/assets.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: ScreenSize.screenWidth,
      height: ScreenSize.screenHeight,
      allowFontScaling: true,
    )..init(context);

    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          DrawerHeader(
            padding: EdgeInsets.all(
              ScreenUtil().setHeight(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Color(AppColors.PURPLE),
                  minRadius: ScreenUtil().setWidth(40),
                  maxRadius: ScreenUtil().setWidth(50),
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(10),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        'User',
                        style: TextStyle(
                          color: Color(
                            AppColors.PINK,
                          ),
                          fontSize: FontSize.fontSize18,
                        ),
                      ),
                      Text(
                        'user@user.user',
                        style: TextStyle(
                          color: Color(AppColors.PINK),
                          fontSize: FontSize.fontSize14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.black,
              ),
              title: Text(
                'HOME',
                style: TextStyle(
                  fontSize: FontSize.fontSize14,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(AppRoutes.GPS_PAGE);
            },
            child: ListTile(
              leading: Icon(
                Icons.location_on,
                color: Colors.black,
              ),
              title: Text(
                'GPS',
                style: TextStyle(
                  fontSize: FontSize.fontSize14,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(AppRoutes.PROFILE);
            },
            child: ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.black,
              ),
              title: Text(
                'MY PROFILE',
                style: TextStyle(
                  fontSize: FontSize.fontSize14,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              leading: Icon(
                Icons.calendar_today,
                color: Colors.black,
              ),
              title: Text(
                'MY BOOKINGS',
                style: TextStyle(
                  fontSize: FontSize.fontSize14,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Icon(
                    Icons.star,
                    color: Color(AppColors.PINK),
                    size: FontSize.fontSize28,
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(15),
                  ),
                  Text(
                    'RATE US',
                    style: TextStyle(
                      fontSize: FontSize.fontSize16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(
                    Icons.phone,
                    color: Color(AppColors.PINK),
                    size: FontSize.fontSize28,
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(15),
                  ),
                  Text(
                    'CONTACT US',
                    style: TextStyle(
                      fontSize: FontSize.fontSize16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
