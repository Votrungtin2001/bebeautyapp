
import 'package:bebeautyapp/model/MPreference.dart';
import 'package:bebeautyapp/model/user/MUser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PreferenceServices {
  final CollectionReference refPreference = FirebaseFirestore.instance.collection('Preference');

  //Create Preference Collection in Firebase Database
  Future<void> createPreference(MUser user_model) async {
    return await refPreference
        .doc(user_model.id)
        .set({'userID': user_model.address.userID,
      'brandHistory': user_model.preference.brandHistory,
      'skinTypeHistory': user_model.preference.skinTypeHistory,
      'categoryHistory': user_model.preference.categoryHistory,
      'sessionHistory': user_model.preference.sessionHistory,
      'structureHistory': user_model.preference.structureHistory
    });
  }

  //Get User's Preference
  Future<MPreference> getPreference(String userID) async {
    MPreference preference = new MPreference(userID: "", brandHistory: [], skinTypeHistory: [], categoryHistory: [], sessionHistory: [], structureHistory: []);
    await refPreference.where('userID', isEqualTo: userID).get().then((result) {
      for (DocumentSnapshot Preference in result.docs) {
        preference = MPreference.fromSnapshot(Preference);
        return preference;
      }
    });
    return preference;
  }

}