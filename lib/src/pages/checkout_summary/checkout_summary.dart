import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sawari/src/assets/assets.dart';
import 'package:sawari/src/widgets/card_widget/card-widget.dart';

class CheckoutSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: ScreenSize.screenWidth,
      height: ScreenSize.screenHeight,
      allowFontScaling: true,
    )..init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Checkout Summary',
          style: TextStyle(
            color: Colors.black,
            fontSize: FontSize.fontSize18,
          ),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: ScreenUtil().setHeight(10),
          left: ScreenUtil().setWidth(10),
          right: ScreenUtil().setWidth(10),
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CardWidget(
                height: 160,
                width: 340,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Vehicle Details',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: FontSize.fontSize14,
                      ),
                    ),
                    Container(
                      height: ScreenUtil().setSp(1),
                      color: Colors.black12,
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(10),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          Images.mahindra,
                          width: ScreenUtil().setWidth(160),
                          height: ScreenUtil().setHeight(100),
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: ScreenUtil().setWidth(15)),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Type: Car'),
                              Text('Total Fee: Nrs. 8000'),
                              Text('Consumption: 24 Ltr/Km'),
                              Text('4 day(s)'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              CardWidget(
                height: ScreenUtil().setHeight(130),
                width: ScreenUtil().setWidth(340),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Sawaari Details',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: FontSize.fontSize14,
                      ),
                    ),
                    Container(
                      height: ScreenUtil().setSp(1),
                      color: Colors.black12,
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(10),
                    ),
                    Text('Delivered to location: No'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: ScreenUtil().setWidth(100),
                          height: ScreenUtil().setHeight(20),
                          child: Text(
                            'From',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ),
                        Container(
                          width: ScreenUtil().setWidth(100),
                          height: ScreenUtil().setHeight(20),
                          child: Text(
                            'To',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: ScreenUtil().setWidth(100),
                          height: ScreenUtil().setHeight(20),
                          child: Text(
                            '7:00 AM',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          width: ScreenUtil().setWidth(100),
                          height: ScreenUtil().setHeight(20),
                          child: Text(
                            '12:00 AM',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: ScreenUtil().setWidth(100),
                          height: ScreenUtil().setHeight(20),
                          child: Text(
                            '24 Jan, 2019',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          width: ScreenUtil().setWidth(100),
                          height: ScreenUtil().setHeight(20),
                          child: Text(
                            '24 Feb, 2019',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: ScreenUtil().setWidth(100),
                          child: Text(
                            'Jadibuti, Kathmandu',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          width: ScreenUtil().setWidth(100),
                          child: Text(
                            'Bagbazar, Kathmandu',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              CardWidget(
                height: ScreenUtil().setHeight(90),
                width: ScreenUtil().setWidth(340),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Billing Details',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: FontSize.fontSize14,
                      ),
                    ),
                    Container(
                      height: ScreenUtil().setSp(1),
                      color: Colors.black12,
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(10),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: ScreenUtil().setWidth(100),
                          height: ScreenUtil().setHeight(20),
                          child: Text(
                            'Name:',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          width: ScreenUtil().setWidth(100),
                          height: ScreenUtil().setHeight(20),
                          child: Text(
                            'User User',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: ScreenUtil().setWidth(100),
                          height: ScreenUtil().setHeight(20),
                          child: Text(
                            'Address:',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          width: ScreenUtil().setWidth(100),
                          height: ScreenUtil().setHeight(20),
                          child: Text(
                            'User\'s address',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: ScreenUtil().setWidth(100),
                          child: Text(
                            'Contact No.',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          width: ScreenUtil().setWidth(100),
                          child: Text(
                            '1234567890',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              CardWidget(
                height: ScreenUtil().setHeight(170),
                width: ScreenUtil().setWidth(340),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Fare Details',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: FontSize.fontSize14,
                      ),
                    ),
                    Container(
                      height: ScreenUtil().setSp(1),
                      color: Colors.black12,
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(10),
                    ),
                    Text(
                      '4 day(s)',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: FontSize.fontSize14,
                      ),
                    ),
                    Container(
                      height: ScreenUtil().setSp(1),
                      color: Colors.black12,
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(10),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: ScreenUtil().setWidth(100),
                          child: Text(
                            'Total Rent*',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          width: ScreenUtil().setWidth(100),
                          child: Text(
                            'NRs. 6000',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(5),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: ScreenUtil().setWidth(100),
                          child: Text(
                            'Goods and Services Tax',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          width: ScreenUtil().setWidth(100),
                          child: Text(
                            'NRs. 1200',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(5),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: ScreenUtil().setWidth(100),
                          child: Text(
                            'Refundable Deposit',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          width: ScreenUtil().setWidth(100),
                          child: Text(
                            'NRs. 200',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(5),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: ScreenUtil().setWidth(100),
                          child: Text(
                            'Playable Amount',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          width: ScreenUtil().setWidth(100),
                          child: Text(
                            'NRs. 4000',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(5),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: ScreenUtil().setWidth(100),
                          child: Text(
                            'Total Paying Amount',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          width: ScreenUtil().setWidth(100),
                          child: Text(
                            'NRs. 4000',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(15),
              ),
              RaisedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text(
                          'Success ...',
                          style: TextStyle(
                            fontSize: FontSize.fontSize16,
                          ),
                        ),
                        actions: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                AppRoutes.HOME_PAGE,
                                (predicate) => false,
                              );
                            },
                            child: Text(
                              'Ok',
                              style: TextStyle(
                                fontSize: FontSize.fontSize16,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                color: Colors.green,
                child: Text(
                  'Proceed to checkout',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
