import 'package:bebeautyapp/model/MBrand.dart';
import 'package:bebeautyapp/repo/services/brand_services.dart';
import 'package:flutter/cupertino.dart';

class BrandProvider with ChangeNotifier {
  BrandServices brandServices = BrandServices();
  List<MBrand> brands = [];

  BrandProvider.initialize(){
    loadBrands();
  }

  loadBrands() async {
    brands = await brandServices.getBrands();
    notifyListeners();
  }
}