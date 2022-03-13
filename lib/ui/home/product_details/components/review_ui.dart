import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../../../../constants.dart';



class ReviewUI extends StatelessWidget {
  final String image, name, date, comment;
  final double rating;
  final Function onTap, onPressed;
  final bool isLess;
  ReviewUI({
    required this.image,
    required this.name,
    required this.date,
    required this.comment,
    required this.rating,
    required this.onTap,
    required this.isLess,
    required this.onPressed,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 2.0,
        bottom: 2.0,
        left: 16.0,
        right: 0.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 45.0,
                width: 45.0,
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/avt.png"),
                ),
                 margin: EdgeInsets.only(right: 16.0),
                // decoration: BoxDecoration(
                //   image: DecorationImage(
                //     image: AssetImage(image),
                //     fit: BoxFit.cover,
                //   ),
                //   borderRadius: BorderRadius.circular(44.0),
                // ),
              ),
              Expanded(
                child: Text(
                  name,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Poppins"
                  ),
                ),
              ),
              IconButton(
                onPressed: (){},
                icon: Icon(Icons.more_vert),
              ),
            ],
          ),

          Row(
            children: [
              SmoothStarRating(
                starCount: 5,
                rating: rating,
                size: 20.0,
                color: Colors.orange,
                borderColor: Colors.orange,
              ),
              SizedBox(width: kFixPadding),
              Text(
                date,
                style: TextStyle(fontSize: 16.0,fontFamily: "Poppins"),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          GestureDetector(
            onTap: (){},
            child: isLess
                ? Text(
              comment,
              style: TextStyle(
                fontSize: 18.0,
                color: kTextLightColor,
                  fontFamily: "Poppins"
              ),
            )
                : Text(
              comment,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16.0,
                color: kTextLightColor,
                  fontFamily: "Poppins"
              ),
            ),
          ),
        ],
      ),
    );
  }
}