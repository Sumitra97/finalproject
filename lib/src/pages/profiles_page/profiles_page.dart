import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sawari/src/assets/assets.dart';
import 'package:sawari/src/widgets/image_selection_widget/image_selection_widget.dart';
import 'package:sawari/src/widgets/logo/logo.dart';

class ProfilesPage extends StatefulWidget {
  @override
  _ProfilesPageState createState() => _ProfilesPageState();
}

class _ProfilesPageState extends State<ProfilesPage>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  bool liscenceFrontSubmitted = false;
  bool liscenceBackSubmitted = false;

  bool citizenshipFrontSubmitted = false;
  bool citizenshipBackSubmitted = false;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: ScreenSize.screenWidth,
      height: ScreenSize.screenHeight,
      allowFontScaling: true,
    )..init(context);

    _showCheckout() {
      if (liscenceFrontSubmitted &&
          liscenceFrontSubmitted &&
          citizenshipBackSubmitted &&
          citizenshipFrontSubmitted) {
        return true;
      }
      return false;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: Logo(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: CircleAvatar(
              backgroundColor: Color(AppColors.PURPLE),
              minRadius: ScreenUtil().setWidth(40),
              maxRadius: ScreenUtil().setWidth(50),
            ),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(15),
          ),
          Text(
            'User User',
            style: TextStyle(
              fontSize: FontSize.fontSize18,
              color: Colors.black,
            ),
          ),
          Text(
            '1234567890',
            style: TextStyle(
              fontSize: FontSize.fontSize14,
            ),
          ),
          Container(
            color: Colors.grey[300],
            child: TabBar(
              indicatorColor: Color(AppColors.PURPLE),
              labelColor: Colors.black,
              labelPadding: EdgeInsets.all(
                ScreenUtil().setWidth(10),
              ),
              controller: controller,
              tabs: <Widget>[
                Text(
                  'Details',
                  style: TextStyle(
                    fontSize: FontSize.fontSize14,
                  ),
                ),
                Text(
                  'Documents',
                  style: TextStyle(
                    fontSize: FontSize.fontSize14,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * .55,
            child: TabBarView(
              controller: controller,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(
                    ScreenUtil().setWidth(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text('Edit Profile'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Name',
                            style: TextStyle(
                              fontSize: FontSize.fontSize16,
                            ),
                          ),
                          Text(
                            'User',
                            style: TextStyle(
                              fontSize: FontSize.fontSize16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: ScreenUtil().setHeight(20)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Phone No.',
                            style: TextStyle(
                              fontSize: FontSize.fontSize16,
                            ),
                          ),
                          Text(
                            '1234567890',
                            style: TextStyle(
                              fontSize: FontSize.fontSize16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: ScreenUtil().setHeight(20)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Address',
                            style: TextStyle(
                              fontSize: FontSize.fontSize16,
                            ),
                          ),
                          Text(
                            'Naya Thimi, BKT',
                            style: TextStyle(
                              fontSize: FontSize.fontSize16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: ScreenUtil().setHeight(20)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Email',
                            style: TextStyle(
                              fontSize: FontSize.fontSize16,
                            ),
                          ),
                          Text(
                            'user@user.user',
                            style: TextStyle(
                              fontSize: FontSize.fontSize16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: ScreenUtil().setHeight(20)),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(
                      ScreenUtil().setWidth(10),
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Driving License'),
                          SizedBox(
                            height: ScreenUtil().setHeight(15),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              ImageSelectionWidget(
                                title: 'Front View',
                                imageTitle: 'driving_license_front',
                                isSet: (value) {
                                  setState(() {
                                    if (value) {
                                      liscenceFrontSubmitted = true;
                                    }
                                  });
                                },
                              ),
                              ImageSelectionWidget(
                                title: 'Back View',
                                imageTitle: 'driving_license_back',
                                isSet: (value) {
                                  setState(() {
                                    if (value) {
                                      liscenceBackSubmitted = true;
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: ScreenUtil().setHeight(20),
                          ),
                          Text('Citizenship Certificate'),
                          SizedBox(
                            height: ScreenUtil().setHeight(15),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              ImageSelectionWidget(
                                  title: 'Front View',
                                  imageTitle: 'citizen_ship_front',
                                  isSet: (value) {
                                    setState(() {
                                      if (value) {
                                        citizenshipFrontSubmitted = true;
                                      }
                                    });
                                  }),
                              ImageSelectionWidget(
                                  title: 'Back View',
                                  imageTitle: 'citizen_ship_back',
                                  isSet: (value) {
                                    setState(() {
                                      if (value) {
                                        citizenshipBackSubmitted = true;
                                      }
                                    });
                                  }),
                            ],
                          ),
                          SizedBox(
                            height: ScreenUtil().setHeight(15),
                          ),
                          if (_showCheckout()) ...[
                            Center(
                              child: SizedBox(
                                  width: double.infinity,
                                  height: 40,
                                  child: RaisedButton.icon(
                                      icon: Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pushNamed(
                                            AppRoutes.CHECKOUT_SUMMARY);
                                      },
                                      label: Text(
                                        "Go to checkout",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      color: Colors.deepPurpleAccent[400])),
                            )
                          ],
                        ]),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
