import 'package:bebeautyapp/model/MCategory.dart';
import 'package:bebeautyapp/ui/home/homes/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Categories extends StatelessWidget {
  late List<MCategory> categories = [];
  Categories(List<MCategory> Categories) {
    this.categories = Categories;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          SectionTitle(
            title: "Categories",
            press: () {},
          ),
          SizedBox(height: 20,),
          Wrap(
            spacing: 16, // gap between adjacent chips
            runSpacing: 9.0, // gap between lines
            direction: Axis.horizontal,
            children: List.generate(
              categories.length,
              (index) => CategoryCard(
                icon: categories[index].imageUri,
                text: categories[index].name,
                press: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String? icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: 55,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                color: Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.network(icon!),
            ),
            SizedBox(height: 5),
            Text(text!, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
