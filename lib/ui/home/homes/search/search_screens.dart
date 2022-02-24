import 'package:bebeautyapp/constants.dart';
import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate<String>{

  final cities = [
  "Bhandup",
  "Mumbai",
  "Visakhapatnam",
  "Coimbatore",
  "Delhi",
  "Bangalore",
  "Pune",
  "Nagpur",
  "Lucknow"
  "Vadodara"
  "Indore",
  "Jalalpur",
  "Bhopal",
  "Kolkata"
  "Kanpur",
  "New Delhi",
  "Faridabad",
  "Rajkot",
  "Ghaziabad",
  "Chennai",
  "Meerut",
  "Agra",
  "Jaipur",
  "Jabalpur",
  "Varanasi",
  "Allahabad",
  "Hyderabad",
  "Noida",
  "Howrah",
  "Thane"
  ];

  final recent = [
  "New Delhi",
  "Faridabad",
  "Rajkot",
  "Ghaziabad",
  ];


  @override
  List<Widget>? buildActions(BuildContext context) {
  return[ IconButton(onPressed: (){query="";}, icon: Icon(Icons.close))];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: (){
          Navigator.pop(context);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        child: Card(
            color: Colors.red,
            child: Center(
            child: Text(query),
      ), // Center
    ), // Card
    ), // Container
    ); // Center
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recent
        : cities.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: (){showResults(context);},
        trailing: new Column(
          children: <Widget>[
            new Container(
              child: new IconButton(
                icon: new Icon(Icons.close_rounded),
                onPressed: () {},
              ),
            ),
          ],
        ),
          title: RichText(
              text: TextSpan(
                text: suggestionList[index].substring(0, query.length),
                style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold
                ),
                  children: [
                    TextSpan(
                      text: suggestionList[index].substring(query.length),
                      style: TextStyle(color: Colors.grey),
                    ),
                  ]
              ),
          ),
      ),
      itemCount: suggestionList.length,
    );
    }

}