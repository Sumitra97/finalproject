import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sawari/src/assets/assets.dart';
import 'package:sawari/src/assets/cities.dart';
import 'package:sawari/src/widgets/app_drawer/app_drawer.dart';
import 'package:sawari/src/widgets/location_widget/location_widget.dart';
import 'package:sawari/src/widgets/logo/logo.dart';

class HomePage extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: ScreenSize.screenWidth,
      height: ScreenSize.screenHeight,
      allowFontScaling: true,
    )..init(context);

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                Icons.menu,
                color: Color(AppColors.PINK),
              ),
            );
          },
        ),
        centerTitle: true,
        title: Logo(
          color: Color(AppColors.PINK),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: ScreenUtil().setHeight(20),
          left: ScreenUtil().setHeight(20),
          right: ScreenUtil().setHeight(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Hello, User',
              style: TextStyle(
                fontSize: FontSize.fontSize20,
              ),
            ),
            SizedBox(height: ScreenUtil().setHeight(10)),
            Text(
              'Please select your pickup location',
              style: TextStyle(
                fontSize: FontSize.fontSize16,
              ),
            ),
            SizedBox(height: ScreenUtil().setHeight(15)),
            Expanded(
              child: Container(
                child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 5 / 4,
                  ),
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return LocationWidget(
                      city: Cities.names[index],
                      image: Cities.cityImages[Cities.names[index]],
                      tapHandler: tap,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void tap(String city) {
    Navigator.of(scaffoldKey.currentContext).pushNamed(
      AppRoutes.VEHICLE_DATE_SELECTION_PAGE,
      arguments: city,
    );
  }
}
