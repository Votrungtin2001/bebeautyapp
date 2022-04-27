
import 'package:bebeautyapp/model/MPreference.dart';
import 'package:bebeautyapp/model/MProduct.dart';
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

  Future<void> updatePreference(MUser user, MProduct product) async {
    user.preference.brandHistory.add(product.brandID);
    user.preference.skinTypeHistory.add(product.skinID);
    user.preference.categoryHistory.add(product.categoryID);
    user.preference.sessionHistory.add(product.sessionID);
    user.preference.structureHistory.add(product.structureID);

    if(user.preference.brandHistory.length > 50) {
      user.preference.brandHistory.removeAt(0);
    }
    if(user.preference.skinTypeHistory.length > 50) {
      user.preference.skinTypeHistory.removeAt(0);
    }
    if(user.preference.categoryHistory.length > 50) {
      user.preference.categoryHistory.removeAt(0);
    }
    if(user.preference.sessionHistory.length > 50) {
      user.preference.sessionHistory.removeAt(0);
    }
    if(user.preference.structureHistory.length > 50) {
      user.preference.structureHistory.removeAt(0);
    }

    await refPreference.doc(user.getID().toString()).update({
      'brandHistory': user.preference.brandHistory,
      'categoryHistory': user.preference.categoryHistory,
      'sessionHistory': user.preference.sessionHistory,
      'skinTypeHistory': user.preference.skinTypeHistory,
      'structureHistory': user.preference.structureHistory,
    });
  }

}