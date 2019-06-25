import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong/latlong.dart';
import 'package:location/location.dart';
import 'package:sawari/src/assets/assets.dart';
import 'package:sawari/src/widgets/selection_scaffold/selection_scaffold.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeliverySelectionPage extends StatefulWidget {
  @override
  _DeliverySelectionPageState createState() => _DeliverySelectionPageState();
}

class _DeliverySelectionPageState extends State<DeliverySelectionPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  //Tap Count
  int _tapCount = 0;

  List<Marker> _mapMarkers = [];

  /* Places List */
  List<String> kathamnduList = ["Kapan", "Baneshwor"];
  List<String> pokharaList = ["Lakeside"];
  List<String> chitwanList = ["NawalParasi", "Sauraha"];

  List<String> pickUpList;
  List<String> dropOffList;

  //Color
  List<Color> _buttonBackgroundColorsList = [
    Colors.deepPurpleAccent[400],
    Colors.indigo,
    Colors.green,
  ];

  //Icon
  List<IconData> _buttonIconList = [
    Icons.arrow_upward,
    Icons.arrow_downward,
    Icons.thumb_up,
  ];

  //Text
  List<String> _textList = [
    "Pick up location",
    "Drop off location",
    "Confirm",
  ];

  List<LatLng> _pickUpDropOffLatLngList = [];

  //Has Pick Up data
  bool buttonShows = false;

  String selectedPickupAddress;
  String selectedDropOffCity;
  String selectedDropOffAddress;

  // Switch
  bool _dropOffOnAnotherCitySwitch = false;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: 2,
      initialIndex: 0,
      vsync: this,
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  _handleTap(LatLng point, BuildContext context) {
    setState(() {
      if (_tapCount <= 1) {
        //Only once per button click
        try {
          _mapMarkers.removeAt(_tapCount);
        } catch (e) {
          print(e.toString());
        }

        _pickUpDropOffLatLngList.insert(_tapCount, point);
        _mapMarkers.insert(
            _tapCount,
            Marker(
              width: 80.0,
              height: 80.0,
              point: point,
              builder: (ctx) => new Container(
                    child: Icon(
                      Icons.location_on,
                      color: _buttonBackgroundColorsList[0],
                      size: 40.0,
                    ),
                  ),
            ));
      }
    });
  }

  _saveLatLngData() async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString(
        "pickUpLatLng",
        (_pickUpDropOffLatLngList[0].latitude).toString() +
            "," +
            (_pickUpDropOffLatLngList[1].longitude).toString());
    prefs.setString(
        "dropOffLatLng",
        (_pickUpDropOffLatLngList[0].latitude).toString() +
            "," +
            (_pickUpDropOffLatLngList[1].longitude).toString());
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: ScreenSize.screenWidth,
      height: ScreenSize.screenHeight,
      allowFontScaling: true,
    )..init(context);

    final String pickupCity = ModalRoute.of(context).settings.arguments;

    if (pickupCity == "Kathmandu, Nepal") {
      pickUpList = kathamnduList;
    } else if (pickupCity == "Chitwan, Nepal") {
      pickUpList = chitwanList;
    } else if (pickupCity == "Pokhara, Nepal") {
      pickUpList = pokharaList;
    } else {
      pickUpList = kathamnduList;
    }

    if (pickupCity == "Kathmandu") {
      dropOffList = kathamnduList;
    } else if (pickupCity == "Chitwan") {
      dropOffList = chitwanList;
    } else if (pickupCity == "Pokhara") {
      dropOffList = pokharaList;
    } else {
      dropOffList = kathamnduList;
    }

    return SelectionScaffold(
      city: pickupCity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'How would you like your vehicle?',
            style: TextStyle(
              fontSize: FontSize.fontSize18,
            ),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(10),
          ),
          Text(
            'Note: * Delivery will cost you more based on your location from the nearest showroom.',
            style: TextStyle(
              fontSize: FontSize.fontSize12,
              color: Colors.black26,
            ),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(10),
          ),
          Container(
            child: TabBar(
              labelPadding: EdgeInsets.symmetric(
                vertical: ScreenUtil().setHeight(10),
                horizontal: ScreenUtil().setWidth(10),
              ),
              labelColor: Colors.black54,
              unselectedLabelColor: Colors.black38,
              controller: tabController,
              indicatorColor: Color(AppColors.PURPLE),
              tabs: <Widget>[
                Text(
                  'Goto Showroom',
                  style: TextStyle(
                    fontSize: FontSize.fontSize16,
                  ),
                ),
                Text(
                  'Delivery',
                  style: TextStyle(
                    fontSize: FontSize.fontSize16,
                  ),
                )
              ],
            ),
          ),
          Container(
            height: ScreenUtil().setHeight(360),
            child: TabBarView(
              controller: tabController,
              children: <Widget>[
                Container(
                  child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: ScreenUtil().setHeight(10),
                          ),
                          Text(
                            'Pick up',
                            style: TextStyle(
                              fontSize: FontSize.fontSize12,
                              color: Colors.black38,
                            ),
                          ),
                          TextFormField(
                            initialValue: '$pickupCity, Nepal',
                            enabled: false,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.location_on),
                            ),
                          ),
                          DropdownButtonFormField(
                            hint: Text('Select Address'),
                            value: selectedPickupAddress,
                            onChanged: (value) {
                              setState(() {
                                selectedPickupAddress = value;
                                buttonShows = true;
                              });
                            },
                            items: pickUpList.map((String location) {
                              return DropdownMenuItem(
                                value: location,
                                child: Text(location),
                              );
                            }).toList(),
                          ),
                          SizedBox(
                            height: ScreenUtil().setHeight(30),
                          ),
                          new Column(
                            children: <Widget>[
                              new SwitchListTile(
                                value: _dropOffOnAnotherCitySwitch,
                                onChanged: (bool value) {
                                  setState(() {
                                    _dropOffOnAnotherCitySwitch = value;
                                    buttonShows = false;
                                  });
                                },
                                title: new Text('Drop off in another city.',
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red)),
                              )
                            ],
                          ),
                          if (_dropOffOnAnotherCitySwitch) ...[
                            Text(
                              'Drop off',
                              style: TextStyle(
                                fontSize: FontSize.fontSize12,
                                color: Colors.black38,
                              ),
                            ),
                            DropdownButtonFormField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.location_on),
                              ),
                              hint: Text('Select City'),
                              value: selectedDropOffCity,
                              onChanged: (value) {
                                setState(() {
                                  selectedDropOffCity = value;
                                });
                              },
                              items: [
                                for (int i = 0;
                                    i < Cities.names.length;
                                    i++) ...[
                                  DropdownMenuItem(
                                    value: Cities.names[i],
                                    child: Text(
                                      Cities.names[i],
                                    ),
                                  ),
                                ],
                              ],
                            ),
                            DropdownButtonFormField(
                              hint: Text('Select Address'),
                              value: selectedDropOffAddress,
                              onChanged: (value) {
                                setState(() {
                                  selectedDropOffAddress = value;
                                  buttonShows = true;
                                });
                              },
                              items: dropOffList.map((String location) {
                                return DropdownMenuItem(
                                  value: location,
                                  child: Text(location),
                                );
                              }).toList(),
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(30),
                            ),
                          ],
                          if (buttonShows) ...[
                            Center(
                              child: RaisedButton(
                                onPressed: () {
                                  Navigator.of(context).pushNamed(
                                    AppRoutes.SEARCH_RESULTS_PAGE,
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
                        ]),
                  ),
                ),
                Stack(
                  children: <Widget>[
                    FlutterMap(
                      options: new MapOptions(
                        center: new LatLng(27.7083355, 85.3131555),
                        zoom: 13.0,
                        onTap: (LatLng point) {
                          _handleTap(point, context);
                        },
                      ),
                      layers: [
                        new TileLayerOptions(
                          urlTemplate: "https://api.tiles.mapbox.com/v4/"
                              "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
                          additionalOptions: {
                            'accessToken':
                                'pk.eyJ1IjoiY2hlZW5hIiwiYSI6ImNqeGJybnhkOTA0Yjgzb2xlbDR4cHltOXoifQ.FsoA7drMITgYoFrhAnLtQw',
                            'id': 'mapbox.streets',
                          },
                        ),
                        new MarkerLayerOptions(
                          markers: _mapMarkers,
                        ),
                      ],
                    ),
                    Container(
                      child: Center(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            width: double.infinity,
                            height: 40,
                            child: RaisedButton.icon(
                                icon: Icon(
                                  _buttonIconList[_tapCount],
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (_tapCount == 3) {
                                      Navigator.of(context).pushNamed(
                                        AppRoutes.SEARCH_RESULTS_PAGE,
                                      );
                                      _saveLatLngData();
                                    }
                                    if (_tapCount != 3) {
                                      _tapCount++;
                                    }
                                    print(_tapCount);
                                  });
                                },
                                label: Text(
                                  _textList[_tapCount],
                                  style: TextStyle(color: Colors.white),
                                ),
                                color: _buttonBackgroundColorsList[_tapCount]),
                          ),
                        ),
                      ),
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // List<Marker> markers = [];
  // // GoogleMapController controller;
  // LatLng currentLocation;

  // onMapCreated(GoogleMapController controller) async {
  //   this.controller = controller;
  //   var locationData = await Location().getLocation();
  //   currentLocation = LatLng(locationData.latitude, locationData.longitude);
  //   print(locationData.longitude);
  //   print(locationData.latitude);
  //   setState(() {
  //     markers.add(
  //       Marker(
  //           markerId: MarkerId("Mylocation"),
  //           position: currentLocation,
  //           draggable: true,
  //           onTap: () {
  //             print("tapped");
  //           },
  //           consumeTapEvents: true,
  //           infoWindow: InfoWindow(title: "Your location")),
  //     );
  //   });

  // controller.animateCamera(CameraUpdate.newLatLngZoom(currentLocation, 7));
//   }
// }

// class Maps extends StatefulWidget {
//   @override
//   _MapsState createState() => _MapsState();
// }

// class _MapsState extends State<Maps> {
//   List<Marker> markers = [];
//   GoogleMapController controller;
//   LatLng currentLocation;

//   onMapCreated(GoogleMapController controller) async {
//     this.controller = controller;
//     var locationData = await Location().getLocation();
//     currentLocation = LatLng(locationData.latitude, locationData.longitude);
//     print(locationData.longitude);
//     print(locationData.latitude);
//     setState(() {
//       markers.add(
//         Marker(
//             markerId: MarkerId("Mylocation"),
//             position: currentLocation,
//             draggable: true,
//             onTap: () {
//               print("tapped");
//             },
//             consumeTapEvents: true,
//             infoWindow: InfoWindow(title: "Your location")),
//       );
//     });

//     controller.animateCamera(CameraUpdate.newLatLngZoom(currentLocation, 15));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Pick your Location'),
//       ),
//       body: GoogleMap(
//           onMapCreated: (controller) => onMapCreated(controller),
//           initialCameraPosition: CameraPosition(
//             target: LatLng(0, 0),
//             zoom: 6,
//           ),
//           markers: Set<Marker>.of(markers)),
//       floatingActionButton: FloatingActionButton.extended(
//         label: Text('Pick'),
//         icon: Icon(Icons.location_on),
//         onPressed: () {
//           Navigator.pop(context, currentLocation);
//         },
//       ),
//     );
//   }
// }
}
