import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class ImageServices {
  firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;

  //Add images in Storage and return list strings
  Future<List<String>> addImagesAndReturnStrings(List<File> imageFiles) async {
    List<String> imagesUrl = [];
    for(int i = 0; i < imageFiles.length; i++) {
      String imageUrl = await addImageAndReturnString(imageFiles[i]);
      imagesUrl.add(imageUrl);
    }

    return imagesUrl;
  }

  //Add images in Storage and return list strings
  Future<String> addImageAndReturnString(File imageFile) async {
    String imageUrl = "";
    firebase_storage.Reference ref = storage.ref().child(imageFile.path);
    firebase_storage.UploadTask uploadTask = ref.putFile(imageFile);
    await uploadTask.whenComplete(() async {
      String url = await ref.getDownloadURL();
      if(url != "") {
        imageUrl = url;
      }
    });

    return imageUrl;
  }
}