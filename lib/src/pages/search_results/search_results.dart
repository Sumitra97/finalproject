import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sawari/src/assets/assets.dart';
import 'package:sawari/src/widgets/booking_not_complete/booking_not_complete.dart';
import 'package:sawari/src/widgets/logo/logo.dart';
import 'package:sawari/src/widgets/vehicle_search_card/vehicle_search_card.dart';
import 'package:http/http.dart' as http;

class SearchResultsPage extends StatefulWidget {
  @override
  _SearchResultsPageState createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage> {
  @override
  Widget build(BuildContext context) {
    _getVehicleInformation();
    ScreenUtil.instance = ScreenUtil(
      width: ScreenSize.screenWidth,
      height: ScreenSize.screenHeight,
      allowFontScaling: true,
    )..init(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
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
        centerTitle: true,
        title: Logo(
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: ScreenUtil().setHeight(20),
          right: ScreenUtil().setHeight(20),
          top: ScreenUtil().setHeight(5),
        ),
        child: FutureBuilder(
          future: _getVehicleInformation(),
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator());

            List vehicles = snapshot.data;

            return ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                var vehicle = vehicles[index];
                return VehicleSearchCard(
                  image: vehicle["image"],
                  consumption: double.parse(vehicle["consumption"]),
                  name: vehicle["status"],
                  price: vehicle["perHrPrice"],
                  hours: 24,
                  book: () {
                    // Booking function goes here
                    showDialog(
                      context: context,
                      builder: (context) {
                        return BookingNotComplete();
                      },
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }

  Future<List> _getVehicleInformation() async {
    http.Response res =
        await http.get('http://sawariapi.nepsify.com/api/vehic_type/');
    print(res.body);
    return json.decode(res.body);
  }
}
