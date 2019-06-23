import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sawari/src/assets/assets.dart';
import 'package:sawari/src/widgets/booking_not_complete/booking_not_complete.dart';
import 'package:sawari/src/widgets/logo/logo.dart';
import 'package:sawari/src/widgets/vehicle_search_card/vehicle_search_card.dart';

class SearchResultsPage extends StatefulWidget {
  @override
  _SearchResultsPageState createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage> {
  @override
  Widget build(BuildContext context) {
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
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: 8,
          itemBuilder: (context, index) {
            return VehicleSearchCard(
              image: Images.mahindra,
              consumption: 10.4,
              name: 'Mahindra KUV 100',
              price: '10,000',
              days: 3,
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
        ),
      ),
    );
  }
}
