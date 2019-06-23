import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sawari/src/assets/assets.dart';
import 'package:sawari/src/widgets/date_time_selected_card/date_time_selected_card.dart';
import 'package:sawari/src/widgets/date_time_selection_card.dart/date_time_selection.dart';
import 'package:sawari/src/widgets/selection_scaffold/selection_scaffold.dart';
import 'package:sawari/src/widgets/vehicle_selection_widget/vehicle_selection_widget.dart';

class VehicleDateSelectionpage extends StatefulWidget {
  @override
  _VehicleDateSelectionpageState createState() =>
      _VehicleDateSelectionpageState();
}

class _VehicleDateSelectionpageState extends State<VehicleDateSelectionpage> {
  int selection = 0;

  DateTime pickUpDate;
  TimeOfDay pickUpTime;
  bool pickupTimeSelected = false;

  DateTime dropOffDate;
  TimeOfDay dropOffTime;
  bool dropOffTimeSelected = false;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: ScreenSize.screenWidth,
      height: ScreenSize.screenHeight,
      allowFontScaling: true,
    )..init(context);

    final String city = ModalRoute.of(context).settings.arguments;
    return SelectionScaffold(
      city: city,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Choose your Sawaari',
            style: TextStyle(
              fontSize: FontSize.fontSize16,
            ),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  setState(() {
                    selection = 0;
                  });
                },
                child: VehicleSelectionWidget(
                  vehicle: 'Car',
                  image: Images.car,
                  selected: selection == 0 ? true : false,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selection = 1;
                  });
                },
                child: VehicleSelectionWidget(
                  vehicle: 'Bike',
                  image: Images.bike,
                  selected: selection == 1 ? true : false,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selection = 2;
                  });
                },
                child: VehicleSelectionWidget(
                  vehicle: 'Scooter',
                  image: Images.scooter,
                  selected: selection == 2 ? true : false,
                ),
              ),
            ],
          ),
          SizedBox(height: ScreenUtil().setHeight(30)),
          Text(
            'Select Date and Time',
            style: TextStyle(
              fontSize: FontSize.fontSize16,
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(15)),
          Row(
            children: <Widget>[
              Text(
                'Pick up',
                style: TextStyle(
                  fontSize: FontSize.fontSize14,
                  color: Colors.black45,
                ),
              ),
              SizedBox(width: ScreenUtil().setWidth(130)),
              Text(
                'Drop Off',
                style: TextStyle(
                  fontSize: FontSize.fontSize14,
                  color: Colors.black45,
                ),
              ),
            ],
          ),
          SizedBox(height: ScreenUtil().setHeight(10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              if (!pickupTimeSelected) ...[
                DateTimeSelectionCard(
                  title: 'Select pick up time',
                  dateTimeHandler: pickupDateTimeHandler,
                ),
              ] else ...[
                DateTimeSelected(
                  date: pickUpDate,
                  time: pickUpTime,
                ),
              ],
              if (!dropOffTimeSelected) ...[
                DateTimeSelectionCard(
                  title: 'Select drop off time',
                  dateTimeHandler: dropoffDateTimeHandler,
                ),
              ] else ...[
                DateTimeSelected(
                  date: dropOffDate,
                  time: dropOffTime,
                ),
              ],
            ],
          ),
          SizedBox(height: ScreenUtil().setHeight(100)),
          Center(
            child: RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.DELIVERY_SELECTION_PAGE,
                  arguments: city,
                );
              },
              color: Colors.lime,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: ScreenUtil().setHeight(5),
                  horizontal: ScreenUtil().setWidth(10),
                ),
                child: Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: FontSize.fontSize14,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void pickupDateTimeHandler(Map<String, dynamic> data) {
    pickupTimeSelected = true;
    pickUpTime = data['time'];
    pickUpDate = data['date'];
    setState(() {});
  }

  void dropoffDateTimeHandler(Map<String, dynamic> data) {
    dropOffTimeSelected = true;
    dropOffTime = data['time'];
    dropOffDate = data['date'];
    setState(() {});
  }
}
