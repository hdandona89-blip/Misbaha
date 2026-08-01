import 'package:adhan/adhan.dart';

class PrayerService {
  static PrayerTimes getPrayerTimes({double latitude = 30.0444, double longitude = 31.2357}) {
    final coordinates = Coordinates(latitude, longitude);
    final params = CalculationMethod.egyptian.getParameters();
    params.madhab = Madhab.shafi;
    return PrayerTimes.today(coordinates, params);
  }
}