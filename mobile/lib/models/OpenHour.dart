import 'package:mobile/models/Company.dart';

class OpenHour{
  int id;
  int dayOfWeek;
  DateTime openMorning;
  DateTime closeMorning;
  DateTime openEvening;
  DateTime closeEvening;
  DateTime openNight;
  DateTime closeNight;   
  Company company; 
}