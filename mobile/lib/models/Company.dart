import 'package:mobile/models/CompanyCategory.dart';
import 'package:mobile/models/OpenHour.dart';

class Company{
  int id;
  String name;
  String image;
  String coverImage;
  bool closedManually;
  double minValue;
  double score;
  String timeDelivery;
  double valueDelivery;
  CompanyCategory companyCategory;
  
}