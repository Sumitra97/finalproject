import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sawari/src/assets/assets.dart';
import 'package:sawari/src/widgets/card-widget/card-widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckoutSummary extends StatefulWidget {
  @override
  _CheckoutSummaryState createState() => _CheckoutSummaryState();
}

class _CheckoutSummaryState extends State<CheckoutSummary> {
  String vehicleName = "";
  String goodsAndServicesTax = "";
  String vehicleRefundableDeposit = "";
  String vehicleTotalCosts = "";
  String vehicleConsumption = "";
  String vehichleTotalHours = "";

  String dropOffDate = "";
  String dropOffTime = "";

  String pickUpDate = "";
  String pickUpTime = "";


  @override
  Widget build(BuildContext context) {
    
    _getVehicleSharedPreferences() async {
      final prefs = await SharedPreferences.getInstance();

      vehicleName = prefs.getString("vehicle_name");
      goodsAndServicesTax = prefs.getString("vehicle_goods_services");
      vehicleRefundableDeposit = prefs.getString("vehicle_refundable_deposit");
      vehicleConsumption = prefs.getString("vehicle_consumption");
      vehicleTotalCosts = prefs.getString("vehicle_total_cost");


      dropOffDate = prefs.getString("drop_off_date");
      dropOffTime = prefs.getString("drop_off_time");

      pickUpDate = prefs.getString("pick_up_date");
      pickUpTime = prefs.getString("pick_up_time");

      vehichleTotalHours = prefs.getString("hours_rented");
    }

    
    _getVehicleSharedPreferences().then((value){
      setState((){});
    });
  
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
                              Text('Name: ' + vehicleName),
                              Text('Cost: Nrs. ' + vehicleTotalCosts),
                              Text('Consumption: ' + vehicleConsumption),
                              Text(vehichleTotalHours + ' hour(s)'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              CardWidget(
                height: ScreenUtil().setHeight(160),
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
                            pickUpTime,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          width: ScreenUtil().setWidth(100),
                          height: ScreenUtil().setHeight(20),
                          child: Text(
                            pickUpTime,
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
                              pickUpDate,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          width: ScreenUtil().setWidth(100),
                          height: ScreenUtil().setHeight(20),
                          child: Text(
                            dropOffDate,
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
                height: ScreenUtil().setHeight(120),
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
                height: ScreenUtil().setHeight(250),
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
                      vehichleTotalHours + " hour(s)",
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
                            'NRs. ' + vehicleTotalCosts,
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
                            'NRs. ' + goodsAndServicesTax,
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
                            'NRs. ' + vehicleRefundableDeposit,
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
                            'NRs. ' + vehicleTotalCosts,
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