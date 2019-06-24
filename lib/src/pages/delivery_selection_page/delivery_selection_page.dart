import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:sawari/src/assets/assets.dart';
import 'package:sawari/src/widgets/selection_scaffold/selection_scaffold.dart';

class DeliverySelectionPage extends StatefulWidget {
  @override
  _DeliverySelectionPageState createState() => _DeliverySelectionPageState();
}

class _DeliverySelectionPageState extends State<DeliverySelectionPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  String selectedPickupAddress;
  String selectedDropOffCity;
  String selectedDropOffAddress;

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

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: ScreenSize.screenWidth,
      height: ScreenSize.screenHeight,
      allowFontScaling: true,
    )..init(context);

    final String pickupCity = ModalRoute.of(context).settings.arguments;

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
                          });
                        },
                        items: [
                          DropdownMenuItem(
                            value: 'Option A',
                            child: Text(
                              'Option A',
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'Option B',
                            child: Text(
                              'Option B',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(30),
                      ),
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
                          for (int i = 0; i < Cities.names.length; i++) ...[
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
                        value: selectedPickupAddress,
                        onChanged: (value) {
                          setState(() {
                            selectedPickupAddress = value;
                          });
                        },
                        items: [
                          DropdownMenuItem(
                            value: 'Option A',
                            child: Text(
                              'Option A',
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'Option B',
                            child: Text(
                              'Option B',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(30),
                      ),
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
                  ),
                ),
                GoogleMap(
                    onMapCreated: (controller) => onMapCreated(controller),
                    initialCameraPosition: CameraPosition(
                      target: LatLng(0, 0),
                      zoom: 6,
                    ),
                    markers: Set<Marker>.of(markers)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Marker> markers = [];
  GoogleMapController controller;
  LatLng currentLocation;

  onMapCreated(GoogleMapController controller) async {
    this.controller = controller;
    var locationData = await Location().getLocation();
    currentLocation = LatLng(locationData.latitude, locationData.longitude);
    print(locationData.longitude);
    print(locationData.latitude);
    setState(() {
      markers.add(
        Marker(
            markerId: MarkerId("Mylocation"),
            position: currentLocation,
            draggable: true,
            onTap: () {
              print("tapped");
            },
            consumeTapEvents: true,
            infoWindow: InfoWindow(title: "Your location")),
      );
    });

    controller.animateCamera(CameraUpdate.newLatLngZoom(currentLocation, 7));
  }
}

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
