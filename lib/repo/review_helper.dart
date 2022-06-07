import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/MReview.dart';

class ReviewHelper {
  String collection = "Review";
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<ReviewModel>> getReview() async =>
      firestore.collection(collection).get().then((result) {
        List <ReviewModel> reviews= [];
        for(DocumentSnapshot review in result.docs){
          reviews.add(ReviewModel.fromSnapshot(review));
        }
        return reviews;
      });
}