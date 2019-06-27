import 'package:flutter/material.dart';
import 'package:sawari/src/assets/routes.dart';
import 'package:sawari/src/pages/checkout_summary/checkout_summary.dart';
import 'package:sawari/src/pages/delivery_selection_page/delivery_selection_page.dart';
import 'package:sawari/src/pages/getting_started/getting_started.dart';
import 'package:sawari/src/pages/gps_page/gps_page.dart';
import 'package:sawari/src/pages/home_page/home_page.dart';
import 'package:sawari/src/pages/login/login.dart';
import 'package:sawari/src/pages/profiles_page/profiles_page.dart';
import 'package:sawari/src/pages/search_results/search_results.dart';
import 'package:sawari/src/pages/sign_up/sign_up.dart';
import 'package:sawari/src/pages/vehicle_date_selection_page/vehicle_date_selection.dart';

void main() => runApp(SawariApp());

class SawariApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sawari',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.GETTING_STARTED,
      routes: {
        '/': (context) => GettingStarted(),
        AppRoutes.GETTING_STARTED: (context) => GettingStarted(),
        AppRoutes.LOGIN: (context) => Login(),
        AppRoutes.SIGN_UP: (context) => SignUp(),
        AppRoutes.HOME_PAGE: (context) => HomePage(),
        AppRoutes.VEHICLE_DATE_SELECTION_PAGE: (context) =>
            VehicleDateSelectionpage(),
        AppRoutes.DELIVERY_SELECTION_PAGE: (context) => DeliverySelectionPage(),
        AppRoutes.SEARCH_RESULTS_PAGE: (context) => SearchResultsPage(),
        AppRoutes.GPS_PAGE: (context) => GPSPage(),
        AppRoutes.CHECKOUT_SUMMARY: (context) => CheckoutSummary(),
        AppRoutes.PROFILE: (context) => ProfilesPage(),
      },
    );
  }
}
