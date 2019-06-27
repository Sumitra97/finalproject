import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sawari/src/assets/assets.dart';
import 'package:sawari/src/widgets/date_time_selected_card/date_time_selected_card.dart';
import 'package:sawari/src/widgets/date_time_selection_card.dart/date_time_selection.dart';
import 'package:sawari/src/widgets/selection_scaffold/selection_scaffold.dart';
import 'package:sawari/src/widgets/vehicle_selection_widget/vehicle_selection_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VehicleDateSelectionpage extends StatefulWidget {
  @override
  _VehicleDateSelectionpageState createState() =>
      _VehicleDateSelectionpageState();
}

class _VehicleDateSelectionpageState extends State<VehicleDateSelectionpage> {
  Vehicle selection;
  String selectedVechile;
  Future<List> getVechiles() async {
    http.Response res =

        await http.get('http://sawariapi.nepsify.com/api/vehic_cat/');
    // print(res.body);

    return json.decode(res.body);
  }

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
            height: ScreenUtil().setHeight(20),
          ),
          Flexible(
            flex: 3,
            fit: FlexFit.tight,
            child: FutureBuilder(
              future: getVechiles(),
              builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                if (!snapshot.hasData)
                  return Center(child: CircularProgressIndicator());
                List vechiles = snapshot.data;
                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemCount: vechiles.length,
                    itemBuilder: (context, index) {
                      var vechile = vechiles[index];
                      return GestureDetector(
                          onTap: () {
                            setState(() {
                              selection = getVehicleType(vechile["name"]);
                              selectedVechile = vechile["name"];
                            });
                          },
                          child: VehicleSelectionWidget(
                            vehicle: vechile['name'],
                            image: vechile['image'],
                            selected:
                                selection == getVehicleType(vechile["name"]),
                          ));
                    });
              },
            ),

            Flexible(
              flex: 3,
              fit: FlexFit.tight,
              child: FutureBuilder(
                future: getVechiles(),
                builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                  if (!snapshot.hasData)
                    return Center(child: CircularProgressIndicator());
                  List vechiles = snapshot.data;
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemCount: vechiles.length,
                      itemBuilder: (context, index) {
                        var vechile = vechiles[index];
                        return GestureDetector(
                            onTap: () {
                              setState(() {
                                selection = getVehicleType(vechile["name"]);
                                selectedVechile = vechile["name"];
                                print(selectedVechile);
                              });
                            },
                            child: VehicleSelectionWidget(
                              vehicle: vechile['name'],
                              image: vechile['image'],
                              selected: 
                                  selection == getVehicleType(vechile["name"]),
                            )
                            
                          );
                      });
                },
              ),
// =======
//           ),
//           Flexible(
//               flex: 2,
//               child: SizedBox(
//                 height: 5,
//               )),
//           Text(
//             'Select Date and Time',
//             style: TextStyle(
//               fontSize: FontSize.fontSize16,
// >>>>>>> master
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
          if (pickupTimeSelected && dropOffTimeSelected) ...[
            // SizedBox(height: ScreenUtil().setHeight(100)),
            Center(
              child: RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    AppRoutes.DELIVERY_SELECTION_PAGE,
                    arguments: city,
                  );
                  _storeSelectedViechleToSharedPreferences(selectedVechile);
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
          ]
        ],
      ),
    );
  }

  void pickupDateTimeHandler(Map<String, dynamic> data) {
    pickupTimeSelected = true;
    pickUpTime = data['time'];
    pickUpDate = data['date'];

    print(data);
    setState(() {});
  }

  void dropoffDateTimeHandler(Map<String, dynamic> data) {
    dropOffTimeSelected = true;
    dropOffTime = data['time'];
    dropOffDate = data['date'];
    setState(() {});
  }

  getHoursDiffrence() {
    String dropOffString =
        dropOffDate.toString() + " " + dropOffTime.toString();
    var dropOffArray = dropOffString.split(" ");

    DateTime droppOfDateTime =
        DateTime.parse(dropOffArray[0] + " " + dropOffArray[1]);

    String pickUpString = pickUpDate.toString() + " " + pickUpTime.toString();
    var pickUpArray = pickUpString.split(" ");

    DateTime pickUpDateTime =
        DateTime.parse(pickUpArray[0] + " " + pickUpArray[1]);

        return droppOfDateTime.difference(pickUpDateTime).inHours;
  }

  _storeSelectedViechleToSharedPreferences(selectedVehicle) async {
    final prefs = await SharedPreferences.getInstance();

    int vehicleId;

    switch (selectedVehicle) {
      case "Car":
        vehicleId = 1;
        break;
      case "Bike":
        vehicleId = 2;
        break;
      case "Scooter":
        vehicleId = 3;
        break;
    }

    prefs.setInt("vehicle_type_id", vehicleId);
    _storeDateInfoInSharedPreference();
  }

  _storeDateInfoInSharedPreference() async {
    final prefs = await SharedPreferences.getInstance();

    String dropOffDateTime = dropOffDate.toString() + " " + dropOffTime.toString();

    String pickUpString = pickUpDate.toString() + " " + pickUpTime.toString();
    var pickUpArray = pickUpString.split(" ");

    prefs.setString("drop_off_date", dropOffDateTime.split(" ")[0]);
    prefs.setString("drop_off_time", dropOffDateTime.split(" ")[1]);

    prefs.setString("pick_up_date", pickUpArray[0]);
    prefs.setString("pick_up_time", pickUpArray[1]);

    prefs.setString("hours_rented",    getHoursDiffrence().toString());
    print(getHoursDiffrence());
  }
}

getVehicleType(String type) {
  switch (type) {
    case "Car":
      return Vehicle.CAR;
    case "Bike":
      return Vehicle.BIKE;
    case "Scooter":
      return Vehicle.SCOOTER;
  }
}

enum Vehicle { CAR, BIKE, SCOOTER }
