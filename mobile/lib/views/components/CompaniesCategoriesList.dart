import 'package:flutter/cupertino.dart';
import 'package:mobile/models/CompanyCategory.dart';
import 'package:mobile/views/components/CategoryItem.dart';

class CompaniesCategoriesList extends StatelessWidget {
  
  final CompanyCategory companyCategory = CompanyCategory();

  @override
  Widget build(BuildContext context) {
    companyCategory.name = "Lanche";
    companyCategory.icon = "https://media.istockphoto.com/vectors/sandwich-flat-icon-snack-orange-icons-in-trendy-flat-style-bread-and-vector-id1209494865";

    List<Widget> categories = [
      CategoryItem(name: companyCategory.name, icon: companyCategory.icon),
      CategoryItem(name: companyCategory.name, icon: companyCategory.icon),
      CategoryItem(name: companyCategory.name, icon: companyCategory.icon),
      CategoryItem(name: companyCategory.name, icon: companyCategory.icon),
      CategoryItem(name: companyCategory.name, icon: companyCategory.icon),
      CategoryItem(name: companyCategory.name, icon: companyCategory.icon),
      CategoryItem(name: companyCategory.name, icon: companyCategory.icon),
    ];

    return Container( 
      margin: EdgeInsets.all(10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: categories)
      )
    );
  }
}