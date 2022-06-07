import 'package:flutter/material.dart';
import '../../model/MReview.dart';
import '../review_helper.dart';

class ReviewProvider with ChangeNotifier{

  ReviewHelper _reviewHelperHelper = ReviewHelper();
  List<ReviewModel> reviews = [];

  ReviewProvider.initialize() {
    _loadProduct();
  }

  _loadProduct() async{
    reviews = await _reviewHelperHelper.getReview();
    notifyListeners();
  }

}