import 'package:sawari/src/assets/assets.dart';

class Vehicles {
  static List<String> names = [
    'Car',
    'Bike',
    'Scooter',
  ];

  Map<String, String> vehicleImages = {
    names[0]: Images.car,
    names[1]: Images.bike,
    names[2]: Images.scooter,
  };
}
