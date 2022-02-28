import 'package:bebeautyapp/introduction_screen/introduction_screen.dart';
import 'package:bebeautyapp/model/user/MUser.dart';
import 'package:bebeautyapp/repo/function/sign_in.dart';
import 'package:bebeautyapp/repo/function/sign_up.dart';
import 'package:bebeautyapp/repo/providers/brand_provider.dart';
import 'package:bebeautyapp/repo/providers/category_provider.dart';
import 'package:bebeautyapp/repo/providers/product_provider.dart';
import 'package:bebeautyapp/repo/providers/user_provider.dart';
import 'package:bebeautyapp/repo/services/authentication_services.dart';
import 'package:bebeautyapp/ui/authenication/login/login_screen.dart';
import 'package:bebeautyapp/ui/authenication/register/register_screen.dart';
import 'package:bebeautyapp/wrapper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MultiProvider(
    providers: [
      ChangeNotifierProvider<SignIn_Function>(
          create: (context) => SignIn_Function()),
      ChangeNotifierProvider<SignUp_Function>(
          create: (context) => SignUp_Function()),
      ChangeNotifierProvider.value(value: UserProvider.initialize()),
      ChangeNotifierProvider.value(value: ProductProvider.initialize()),
      ChangeNotifierProvider.value(value: BrandProvider.initialize()),
      ChangeNotifierProvider.value(value: CategoryProvider.initialize()),
    ],
    child: const MyApp(),
  ));
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
  //..customAnimation = CustomAnimation();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    /*String chemicalComposition7 = 'Water, Glycerin, Myristic Acid, Stearic Acid, Palmitic Acid, Sodium Lauroyl Sarcosinate, Potassium Hydroxide, Lauric Acid, Polyquaternium-10, DMDM Hydantoin, Fragrance, Tetrasodium Etidronate, Pentasodium Pentetate, Linalool, Benzyl Benzoate, Benzyl Salicylate, Alpha-Isomethyl Ionone, Iodopropynyl Butylcarbamate, Niacinamide.';
    String guideLine7 = '- Làm ướt mặt. \n- Lấy một lượng sản phẩm ra tay, thêm chút nước để tạo bọt thật kỹ. \n- Mát xa khắp mặt và rửa lại với nước.';
    List<String> images7 = [];
    images7.add("https://media.hasaki.vn/catalog/product/s/u/sua-rua-mat-olay-tao-bot-ngan-ngua-lao-hoa-da-100g-1_img_800x800_eb97c5_fit_center.jpg");
    images7.add("https://media.hasaki.vn/catalog/product/t/e/tem-phu-sua-rua-mat-olay-tao-bot-ngan-ngua-lao-hoa-da-100g_img_800x800_eb97c5_fit_center.jpg");
    images7.add("https://media.hasaki.vn/catalog/product/s/u/sua-rua-mat-olay-tao-bot-ngan-ngua-lao-hoa-da-100g-2_img_800x800_eb97c5_fit_center.jpg");
    FirebaseFirestore.instance.collection('Product').doc('347').set({
      'id': 347,
      'name': "Sữa Rửa Mặt Olay Tạo Bọt Ngăn Ngừa Lão Hoá Da 100g",
      'engName': "Total Effects 7 In 1 Foaming Cleanser",
      'brandID': 51,
      'categoryID': 2,
      'originID': 3,
      'skinID': 1,
      'sessionID': 1,
      'genderID': 1,
      'structureID': 5,
      'soldOut': 0,
      'totalStarRating': 0,
      'totalRating': 0,
      'marketPrice': 149000,
      'importPrice': 99000,
      'defaultDiscountRate': 20,
      'price': 119000,
      'chemicalComposition': chemicalComposition7,
      'guideLine': guideLine7,
      'image': images7,
      'userFavorite': [],
      'available': 50,
      'searchCount': 0,
      'popularSearchTitle': 'Sữa Rửa Mặt Olay'
    });

    String chemicalComposition8 = 'Water, Glycerin, Myristic Acid, Stearic Acid, Palmitic Acid, Sodium Lauroyl Sarcosinate, Potassium Hydroxide, Lauric Acid, Polyquaternium-10, DMDM Hydantoin, Fragrance, Tetrasodium Etidronate, Pentasodium Pentetate, Linalool, Butylphenyl Methylpropional, Iodopropynyl Butylcarbamate.';
    String guideLine8 = '- Làm ướt mặt. \n- Lấy một lượng sản phẩm ra tay, thêm chút nước để tạo bọt thật kỹ. \n- Mát xa khắp mặt và rửa lại với nước.';
    List<String> images8 = [];
    images8.add("https://media.hasaki.vn/catalog/product/s/u/sua-rua-mat-olay-lam-sang-da-giam-tham-nam-dang-kem-100g-1_img_800x800_eb97c5_fit_center.jpg");
    images8.add("https://media.hasaki.vn/catalog/product/s/u/sua-rua-mat-olay-lam-sang-da-giam-tham-nam-dang-kem-100g-3_img_800x800_eb97c5_fit_center.jpg");
    images8.add("https://media.hasaki.vn/catalog/product/s/u/sua-rua-mat-olay-lam-sang-da-giam-tham-nam-dang-kem-100g-5_img_800x800_eb97c5_fit_center.jpg");
    FirebaseFirestore.instance.collection('Product').doc('348').set({
      'id': 348,
      'name': "Sữa Rữa Mặt Olay Làm Sáng Da, Mờ Thâm Nám Dạng Kem 100g",
      'engName': "White Radiance Brightening Foaming Cleanser",
      'brandID': 51,
      'categoryID': 2,
      'originID': 3,
      'skinID': 5,
      'sessionID': 1,
      'genderID': 1,
      'structureID': 5,
      'soldOut': 1,
      'totalStarRating': 0,
      'totalRating': 0,
      'marketPrice': 112000,
      'importPrice': 70000,
      'defaultDiscountRate': 21,
      'price': 89000,
      'chemicalComposition': chemicalComposition8,
      'guideLine': guideLine8,
      'image': images8,
      'userFavorite': [],
      'available': 49,
      'searchCount': 0,
      'popularSearchTitle': 'Sữa Rửa Mặt Olay'
    });

    String chemicalComposition9 = 'Nội dung đang được cập nhật';
    String guideLine9 = '- Đắp mặt nạ và thư giãn từ 15-20 phút. \n- Tháo bỏ mặt nạ, nhẹ nhàng massage để thấm tinh chất. \n- Không cần rửa lại với nước, tiếp tục các bước dưỡng da khác.';
    List<String> images9 = [];
    images9.add("https://media.hasaki.vn/catalog/product/g/o/google-shopping-mat-na-olay-tinh-chat-hoa-tra-nhat-ban-nuoi-duong-da-28g-1_img_800x800_eb97c5_fit_center.jpg");
    images9.add("https://media.hasaki.vn/catalog/product/m/a/mat-na-olay-tinh-chat-hoa-tra-nhat-ban-nuoi-duong-da-28g-2_img_800x800_eb97c5_fit_center.jpg");
    images9.add("https://media.hasaki.vn/catalog/product/m/a/mat-na-olay-tinh-chat-hoa-tra-nhat-ban-nuoi-duong-da-28g-4_img_800x800_eb97c5_fit_center.jpg");
    FirebaseFirestore.instance.collection('Product').doc('349').set({
      'id': 349,
      'name': "Mặt Nạ Olay Tinh Chất Hoa Trà Nhật Bản Nuôi Dưỡng Da 28g",
      'engName': "Skinfusion Masks Camellia",
      'brandID': 51,
      'categoryID': 4,
      'originID': 3,
      'skinID': 1,
      'sessionID': 1,
      'genderID': 2,
      'structureID': 6,
      'soldOut': 0,
      'totalStarRating': 0,
      'totalRating': 0,
      'marketPrice': 59000,
      'importPrice': 40000,
      'defaultDiscountRate': 2,
      'price': 58000,
      'chemicalComposition': chemicalComposition9,
      'guideLine': guideLine9,
      'image': images9,
      'userFavorite': [],
      'available': 48,
      'searchCount': 0,
      'popularSearchTitle': 'Mặt Nạ Olay'
    });

    String chemicalComposition10 = 'Nội dung đang được cập nhật';
    String guideLine10 = '- Đắp mặt nạ và thư giãn từ 15-20 phút. \n- Tháo bỏ mặt nạ, nhẹ nhàng massage để thấm tinh chất. \n- Không cần rửa lại với nước, tiếp tục các bước dưỡng da khác.';
    List<String> images10 = [];
    images10.add("https://media.hasaki.vn/catalog/product/g/o/google-shopping-mat-na-olay-tinh-chat-tao-bien-nhat-ban-lam-sang-da-28g_img_800x800_eb97c5_fit_center.jpg");
    images10.add("https://media.hasaki.vn/catalog/product/m/a/mat-na-olay-tinh-chat-tao-bien-nhat-ban-lam-sang-da-28g-6_img_800x800_eb97c5_fit_center.jpg");
    images10.add("https://media.hasaki.vn/catalog/product/m/a/mat-na-olay-tinh-chat-tao-bien-nhat-ban-lam-sang-da-28g-3_img_800x800_eb97c5_fit_center.jpg");
    FirebaseFirestore.instance.collection('Product').doc('350').set({
      'id': 350,
      'name': "Mặt Nạ Olay Tinh Chất Tảo Biển Nhật Bản Làm Sáng Da 28g",
      'engName': "Skinfusion Masks Deep Sea",
      'brandID': 51,
      'categoryID': 4,
      'originID': 3,
      'skinID': 5,
      'sessionID': 1,
      'genderID': 1,
      'structureID': 6,
      'soldOut': 0,
      'totalStarRating': 0,
      'totalRating': 0,
      'marketPrice': 59000,
      'importPrice': 25000,
      'defaultDiscountRate': 29,
      'price': 42000,
      'chemicalComposition': chemicalComposition10,
      'guideLine': guideLine10,
      'image': images10,
      'userFavorite': [],
      'available': 47,
      'searchCount': 0,
      'popularSearchTitle': 'Mặt Nạ Olay'
    });

    String chemicalComposition11 = 'Nước, Cyclopentasiloxane, Glycerin, Niacinamide, nhôm bột Octenylsuccinate, Dimethicone, Panthenol, Dimenthicone Crosspolymer, polyethylene, Palmitoyl Pentapeptide-4, Sodium Hyaluronate, Camellia sinensis leaf extract, tocopheryl acetate, carnosine, Allantoin, Dimenthicone , Polyacrylamide, C13-14 isoparaffin, Laureth-4, Laureth-7, citric acid, Peg-100 Stearate, DMDM Hydantoin, BHT, Disodium Edta, Oxide tin, hương, Iodopropynyl butyl carbamate, titanium dioxide, Mica.';
    String guideLine11 = '- Dùng ngón tay lấy một lượng kem vừa đủ thoa đều lên mặt và cổ. \n- Massage nhẹ nhàng theo hình tròn từ dưới lên trên, tập trung ở vùng nhiều nếp nhăn. \n- Có thể dùng hàng ngày vào buổi sáng và tối. \n- Dùng trước khi trang điểm hoặc sau khi rửa mặt vào buổi tối.';
    List<String> images11 = [];
    images11.add("https://media.hasaki.vn/catalog/product/t/i/tinh-chat-vi-duong-olay-regenerist-ngua-lao-hoa-50ml-1_img_800x800_eb97c5_fit_center.jpg");
    images11.add("https://media.hasaki.vn/catalog/product/t/i/tinh-chat-vi-duong-olay-regenerist-ngua-lao-hoa-50ml-2_img_800x800_eb97c5_fit_center.jpg");
    images11.add("https://media.hasaki.vn/catalog/product/t/i/tinh-chat-vi-duong-olay-regenerist-ngua-lao-hoa-50ml-3_img_800x800_eb97c5_fit_center.jpg");
    FirebaseFirestore.instance.collection('Product').doc('351').set({
      'id': 351,
      'name': "Tinh Chất Vi Dưỡng Olay Regenerist Ngừa Lão Hóa 50ml",
      'engName': "Regenerist Micro-Sculpting Serum",
      'brandID': 51,
      'categoryID': 7,
      'originID': 3,
      'skinID': 1,
      'sessionID': 1,
      'genderID': 1,
      'structureID': 7,
      'soldOut': 9,
      'totalStarRating': 5,
      'totalRating': 1,
      'marketPrice': 549000,
      'importPrice': 399000,
      'defaultDiscountRate': 22,
      'price': 429000,
      'chemicalComposition': chemicalComposition11,
      'guideLine': guideLine11,
      'image': images11,
      'userFavorite': [],
      'available': 46,
      'searchCount': 0,
      'popularSearchTitle': 'Tinh Chất Olay'
    });

    String chemicalComposition12 = 'Water, Dimethicone, Glycerin, Retinol, Retinyl Propionate, Niacinamide*, Palmitoyl Pentapeptide-4**, Dimethiconol, C13-14 Isoparaffin, Laureth-4, Polysorbate 20, Laureth-7, Disodium Edta, Dimethicone Crosspolymer, Polyacrylamide, Titanium Dioxide, Mica, Dmdm Hydantoin, Iodopropynyl Butylcarbamate.';
    String guideLine12 = '- Sử dụng sản phẩm vào buổi tối, sau bước làm sạch da. \n- Dùng đầu ngón tay lấy một lượng nhỏ sản phẩm và thoa lên mặt và vùng cổ. Sau đó, thoa đều theo hình tròn và theo chiều kim đồng hồ. \n- Kết thúc chu trình chăm sóc da với Kem Dưỡng Ẩm Đêm Olay Regenerist Retinol 24 Night Moisturiser Fragrance-Free. \n- Vào ban ngày, sử dụng kem chống nắng có chỉ số SFP từ 30 trở lên để bảo vệ da.';
    List<String> images12 = [];
    images12.add("https://media.hasaki.vn/catalog/product/f/a/facebook-dynamic-tinh-chat-olay-ngua-lao-hoa-chiet-xuat-retinol-24-30ml_img_800x800_eb97c5_fit_center.jpg");
    images12.add("https://media.hasaki.vn/catalog/product/t/i/tinh-chat-olay-ngua-lao-hoa-chiet-xuat-retinol-24-30ml_img_800x800_eb97c5_fit_center.jpg");
    images12.add("https://media.hasaki.vn/catalog/product/g/o/google-shopping-tinh-chat-olay-ngua-lao-hoa-chiet-xuat-retinol-24-30ml_img_800x800_eb97c5_fit_center.jpg");
    FirebaseFirestore.instance.collection('Product').doc('352').set({
      'id': 352,
      'name': "Tinh Chất Olay Ngừa Lão Hoá Chiết Xuất Retinol 24 30ml",
      'engName': "Regenerist Retinol 24 Night Serum Fragrance-Free",
      'brandID': 51,
      'categoryID': 7,
      'originID': 3,
      'skinID': 1,
      'sessionID': 3,
      'genderID': 1,
      'structureID': 7,
      'soldOut': 2,
      'totalStarRating': 0,
      'totalRating': 0,
      'marketPrice': 549000,
      'importPrice': 344000,
      'defaultDiscountRate': 30,
      'price': 384000,
      'chemicalComposition': chemicalComposition12,
      'guideLine': guideLine12,
      'image': images12,
      'userFavorite': [],
      'available': 45,
      'searchCount': 0,
      'popularSearchTitle': 'Tinh Chất Olay'
    });

    String chemicalComposition13 = 'Nội dung đang được cập nhật.';
    String guideLine13 = '- Dùng ngón tay lấy một lượng kem vừa đủ thoa đều lên mặt và cổ. \n- Massage nhẹ nhàng theo hình tròn từ dưới lên trên, tập trung ở vùng nhiều nếp nhăn. \n- Dùng hàng ngày vào buổi sáng. \n- Dùng trước khi trang điểm.';
    List<String> images13 = [];
    images13.add("https://media.hasaki.vn/catalog/product/f/a/facebook-dynamic-kem-duong-am-ban-ngay-olay-lam-sang-da-chong-nang-50g_img_800x800_eb97c5_fit_center.jpg");
    images13.add("https://media.hasaki.vn/catalog/product/k/e/kem-duong-am-ban-ngay-olay-lam-sang-da-chong-nang-50g_img_800x800_eb97c5_fit_center.jpg");
    images13.add("https://media.hasaki.vn/catalog/product/k/e/kem-duong-am-ban-ngay-olay-lam-sang-da-chong-nang-50g_1_img_800x800_eb97c5_fit_center.jpg");
    FirebaseFirestore.instance.collection('Product').doc('353').set({
      'id': 353,
      'name': "Kem Dưỡng Ẩm Ban Ngày Olay Làm Sáng Da Chống Nắng 50g",
      'engName': "Luminous Whip UV Moisturizer SPF 30 PA+++",
      'brandID': 51,
      'categoryID': 9,
      'originID': 3,
      'skinID': 1,
      'sessionID': 2,
      'genderID': 1,
      'structureID': 1,
      'soldOut': 7,
      'totalStarRating': 0,
      'totalRating': 0,
      'marketPrice': 549000,
      'importPrice': 387000,
      'defaultDiscountRate': 25,
      'price': 414000,
      'chemicalComposition': chemicalComposition13,
      'guideLine': guideLine13,
      'image': images13,
      'userFavorite': [],
      'available': 44,
      'searchCount': 0,
      'popularSearchTitle': 'Kem Dưỡng Ẩm Ban Ngày Olay'
    });

    String chemicalComposition14 = 'Nước, Glycerin, Isohexadecane, Niacinamide, Isopropyl, Isostearate, Dimethicone…';
    String guideLine14 = '- Dùng ngón tay lấy một lượng kem vừa đủ thoa đều lên mặt và cổ. \n- Massage nhẹ nhàng theo hình tròn từ dưới lên trên, tập trung ở vùng nhiều nếp nhăn. \n- Dùng hàng ngày vào buổi sáng. \n- Dùng trước khi trang điểm.';
    List<String> images14 = [];
    images14.add("https://media.hasaki.vn/catalog/product/k/e/kem-duong-ban-ngay-olay-regenerist-ngua-lao-hoa-50g-2_img_800x800_eb97c5_fit_center.jpg");
    images14.add("https://media.hasaki.vn/catalog/product/k/e/kem-duong-ban-ngay-olay-regenerist-ngua-lao-hoa-50g-3_img_800x800_eb97c5_fit_center.jpg");
    images14.add("https://media.hasaki.vn/catalog/product/g/o/google-shopping-kem-duong-ban-ngay-olay-regenerist-ngua-lao-hoa-50g_img_800x800_eb97c5_fit_center.jpg");
    FirebaseFirestore.instance.collection('Product').doc('354').set({
      'id': 354,
      'name': "Kem Dưỡng Ban Ngày Olay Regenerist Ngừa Lão Hóa 50g",
      'engName': "Olay Regenerist Micro-Sculpting Cream",
      'brandID': 51,
      'categoryID': 9,
      'originID': 3,
      'skinID': 6,
      'sessionID': 2,
      'genderID': 1,
      'structureID': 1,
      'soldOut': 7,
      'totalStarRating': 5,
      'totalRating': 1,
      'marketPrice': 499000,
      'importPrice': 309000,
      'defaultDiscountRate': 30,
      'price': 348000,
      'chemicalComposition': chemicalComposition14,
      'guideLine': guideLine14,
      'image': images14,
      'userFavorite': [],
      'available': 43,
      'searchCount': 0,
      'popularSearchTitle': 'Kem Dưỡng Ẩm Ban Ngày Olay'
    });

    String chemicalComposition15 = 'Water, Dimethicone, Glycerin, Tapioca Starch, Dimethicone Crosspolymer, Retinol, Retinyl Propionate, Niacinamide*, Palmitoyl Pentapeptide-4**, C13-14 Isoparaffin, Dimethiconol, Polysorbate 20, Laureth-4, Laureth-7, Disodium Edta, Polyacrylamide, Acrylates/C10-30 Alkyl Acrylate Crosspolymer, Aminomethyl Propanol, Polymethylsilsesquioxane, Titanium Dioxide, Dmdm Hydantoin, Iodopropynyl Butylcarbamate.';
    String guideLine15 = '- Sử dụng sản phẩm vào buổi tối, sau bước làm sạch và tinh chất Olay Regenerist Retinol 24 Night Serum Fragrance-Free (nếu có). \n- Dùng đầu ngón tay lấy một lượng nhỏ sản phẩm, sau đó thoa lên da mặt & vùng cổ. Thoa đều theo hình tròn và theo chiều kim đồng hồ. \n- Vào ban ngày, sử dụng kem chống nắng có chỉ số SFP từ 30 trở lên để bảo vệ da.';
    List<String> images15 = [];
    images15.add("https://media.hasaki.vn/catalog/product/f/a/facebook-dynamic-kem-duong-dem-olay-ngua-lao-hoa-chiet-xuat-retinol-24-50g_img_800x800_eb97c5_fit_center.jpg");
    images15.add("https://media.hasaki.vn/catalog/product/g/o/google-shopping-kem-duong-dem-olay-ngua-lao-hoa-chiet-xuat-retinol-24-50g_img_800x800_eb97c5_fit_center.jpg");
    images15.add("https://media.hasaki.vn/catalog/product/k/e/kem-duong-dem-olay-ngua-lao-hoa-chiet-xuat-retinol-24-50g-1_img_800x800_eb97c5_fit_center.jpg");
    FirebaseFirestore.instance.collection('Product').doc('355').set({
      'id': 355,
      'name': "Kem Dưỡng Đêm Olay Ngừa Lão Hóa Chiết Xuất Retinol 24 50g",
      'engName': "Regenerist Retinol 24 Night Moisturiser Fragrance-Free",
      'brandID': 51,
      'categoryID': 9,
      'originID': 3,
      'skinID': 1,
      'sessionID': 3,
      'genderID': 1,
      'structureID': 1,
      'soldOut': 14,
      'totalStarRating': 0,
      'totalRating': 0,
      'marketPrice': 549000,
      'importPrice': 365000,
      'defaultDiscountRate': 30,
      'price': 384000,
      'chemicalComposition': chemicalComposition15,
      'guideLine': guideLine15,
      'image': images15,
      'userFavorite': [],
      'available': 42,
      'searchCount': 0,
      'popularSearchTitle': 'Kem Dưỡng Ẩm Ban Đêm Olay'
    });

    String chemicalComposition16 = 'Water, Glycerin, Niacinamide, Isohexadecane, Dimethicone, Isopropyl, Polyacrylamide, Cocos Nucifera (Coconut) Oil, Stearyl Alcohol, Sucrose Polycottonseedate, C13-14 Isoparaffin, Tocopheryl Acetate, Cetyl Alcohol, Behenyl Alcohol, Panthenol, Polymethylsilsesquioxane, Titanium Dioxide, Benzyl Alcohol, Dimethiconol, Hydrolyzed Wheat Protein, Ethylparaben, Laureth-7, Fragrance, Cetearyl Alcohol, Cetearyl Glucoside, PEG-100 Stearate, Propylparaben, Sodium Ascorbyl Phosphate, Stearic Acid, Disodium EDTA, BHT, Zinc Oxide, Camellia Sinensis Leaf Extract, Ammonium Polyacrylate, Triethoxycaprylylsilane';
    String guideLine16 = '- Sử dụng sản phẩm vào buổi tối, sau bước làm sạch và tinh chất Olay Regenerist Retinol 24 Night Serum Fragrance-Free (nếu có). \n- Dùng đầu ngón tay lấy một lượng nhỏ sản phẩm, sau đó thoa lên da mặt & vùng cổ. Thoa đều theo hình tròn và theo chiều kim đồng hồ. \n- Vào ban ngày, sử dụng kem chống nắng có chỉ số SFP từ 30 trở lên để bảo vệ da.';
    List<String> images16 = [];
    images16.add("https://media.hasaki.vn/catalog/product/k/e/kem-duong-ban-dem-olay-total-effects-ngua-lao-hoa-50g-1_img_800x800_eb97c5_fit_center.jpg");
    images16.add("https://media.hasaki.vn/catalog/product/k/e/kem-duong-ban-dem-olay-total-effects-ngua-lao-hoa-50g-3_img_800x800_eb97c5_fit_center.jpg");
    images16.add("https://media.hasaki.vn/catalog/product/k/e/kem-duong-ban-dem-olay-total-effects-ngua-lao-hoa-50g-2_img_800x800_eb97c5_fit_center.jpg");
    FirebaseFirestore.instance.collection('Product').doc('356').set({
      'id': 356,
      'name': "Kem Dưỡng Ban Đêm Olay Total Effects Ngừa Lão Hóa 50g",
      'engName': "Total Effects 7 in One Night Cream",
      'brandID': 51,
      'categoryID': 9,
      'originID': 3,
      'skinID': 1,
      'sessionID': 3,
      'genderID': 1,
      'structureID': 1,
      'soldOut': 19,
      'totalStarRating': 4,
      'totalRating': 1,
      'marketPrice': 329000,
      'importPrice': 225000,
      'defaultDiscountRate': 21,
      'price': 259000,
      'chemicalComposition': chemicalComposition16,
      'guideLine': guideLine16,
      'image': images16,
      'userFavorite': [],
      'available': 41,
      'searchCount': 0,
      'popularSearchTitle': 'Kem Dưỡng Ẩm Ban Đêm Olay'
    });

    String chemicalComposition17 = 'Salicylic Acid, Isopropylmethylphenol, Dipotassium Glycyrrhizate , Water, Palmitic Acid, Glycerin, Stearic Acid, Lauric Acid, Potassium Hydroxide, Myristic Acid, Butylene Glycol, Cocamidopropyl Betaine, Sorbitol, Cocamide Methyl MEA, Polyquaternium-7, Ethanol, Glyceryl Stearate, Salvia Officinalis (Sage) Leaf Extract, Algae Extract, Menthol, Hydroxypropyl Methylcellulose Stearoxy Ether, Fragrance, BHT, Disodium EDTA.';
    String guideLine17 = '- Làm ướt mặt với nước sạch. \n- Lấy một lượng kem vừa đủ (khoảng 1 hạt đậu) vào lòng bàn tay, tạo bọt rồi thoa đều lên mặt và massage nhẹ nhàng từ 30s - 1 phút. \n- Sau đó rửa lại với thật nhiều nước.';
    List<String> images17 = [];
    images17.add("https://media.hasaki.vn/catalog/product/k/e/kem-rua-mat-oxy-sach-nhon-mat-lanh-100g_img_800x800_eb97c5_fit_center.jpg");
    images17.add("https://media.hasaki.vn/catalog/product/k/e/kem-rua-mat-oxy-sach-nhon-mat-lanh-100g_img_800x800_eb97c5_fit_center.jpg");
    images17.add("https://media.hasaki.vn/catalog/product/k/e/kem-rua-mat-oxy-sach-nhon-mat-lanh-100g_img_800x800_eb97c5_fit_center.jpg");
    FirebaseFirestore.instance.collection('Product').doc('357').set({
      'id': 357,
      'name': "Kem Rửa Mặt Oxy Sạch Nhờn Mát Lạnh 100g",
      'engName': "Perfect Wash",
      'brandID': 52,
      'categoryID': 2,
      'originID': 2,
      'skinID': 3,
      'sessionID': 1,
      'genderID': 3,
      'structureID': 1,
      'soldOut': 3,
      'totalStarRating': 10,
      'totalRating': 2,
      'marketPrice': 72000,
      'importPrice': 55000,
      'defaultDiscountRate': 3,
      'price': 70000,
      'chemicalComposition': chemicalComposition17,
      'guideLine': guideLine17,
      'image': images17,
      'userFavorite': [],
      'available': 40,
      'searchCount': 0,
      'popularSearchTitle': 'Kem Rửa Mặt Oxy'
    });

    String chemicalComposition18 = 'Hạt than (Charcoal Powder), Chiết xuất tảo biển (Algae Extract), Water, Glycerin, Palmitic Acid, Lauric Acid, Potassium Hydroxide, Myristic Acid, Stearic Acid, Maltooligosyl Glucoside, Hydrogenated Starch Hydrolysate, Polylactic Acid, Lactide, Lactic Acid, Menthol, Bambusa Arundinacea Stem Powder, Salvia Officinalis (Sage) Leaf Extract, Butylene Glycol, Disodium EDTA, Fragrance.';
    String guideLine18 = '- Làm ướt mặt với nước sạch. \n- Lấy một lượng kem vừa đủ (khoảng 1 hạt đậu) vào lòng bàn tay, tạo bọt rồi thoa đều lên mặt và massage nhẹ nhàng từ 30s - 1 phút. \n- Sau đó rửa lại với thật nhiều nước.';
    List<String> images18 = [];
    images18.add("https://media.hasaki.vn/catalog/product/k/e/kem-rua-mat-oxy-co-hat-sach-sau-100g_img_800x800_eb97c5_fit_center.jpg");
    images18.add("https://media.hasaki.vn/catalog/product/k/e/kem-rua-mat-oxy-co-hat-sach-sau-100g_img_800x800_eb97c5_fit_center.jpg");
    images18.add("https://media.hasaki.vn/catalog/product/k/e/kem-rua-mat-oxy-co-hat-sach-sau-100g_img_800x800_eb97c5_fit_center.jpg");
    FirebaseFirestore.instance.collection('Product').doc('358').set({
      'id': 358,
      'name': "Kem Rửa Mặt Oxy Có Hạt Sạch Sâu 100g",
      'engName': "Deep Wash Scrub Formula",
      'brandID': 52,
      'categoryID': 2,
      'originID': 2,
      'skinID': 3,
      'sessionID': 1,
      'genderID': 3,
      'structureID': 10,
      'soldOut': 1,
      'totalStarRating': 4,
      'totalRating': 1,
      'marketPrice': 76000,
      'importPrice': 52000,
      'defaultDiscountRate': 3,
      'price': 74000,
      'chemicalComposition': chemicalComposition18,
      'guideLine': guideLine18,
      'image': images18,
      'userFavorite': [],
      'available': 39,
      'searchCount': 0,
      'popularSearchTitle': 'Kem Rửa Mặt Oxy'
    });

    String chemicalComposition19 = 'Salicylic Acid, Dipotassium Glycyrrhizate, Sodium Ascorbyl Phosphate, Water, Palmitic Acid, Glycerin, Stearic Acid, Lauric Acid, Myristic Acid, Potassium Hydroxide, Butylene Glycol, Sorbitol, Cocamide Methyl MEA, Cocamidopropyl Betaine, Ethanol, Glyceryl Stearate, Glycol Distearate, Menthol, Hydroxypropyl Methylcellulose Stearoxy Ether, Isopropylmethylphenol, BHT, Algae Extract, Salvia Officinalis Leaf Extract, Disodium EDTA, Polyquaternium-7, Methylparaben, Propylparaben, Fragrance, CI 19140, CI 42090.';
    String guideLine19 = '- Làm ướt mặt với nước sạch. \n- Lấy một lượng kem vừa đủ (khoảng 1 hạt đậu) vào lòng bàn tay, tạo bọt rồi thoa đều lên mặt và massage nhẹ nhàng từ 30s - 1 phút. \n- Sau đó rửa lại với thật nhiều nước.';
    List<String> images19 = [];
    images19.add("https://media.hasaki.vn/catalog/product/k/e/kem-rua-mat-oxy-sach-khuan-mun-kiem-soat-nhon-100g_img_800x800_eb97c5_fit_center.jpg");
    images19.add("https://media.hasaki.vn/catalog/product/k/e/kem-rua-mat-oxy-sach-khuan-mun-kiem-soat-nhon-100g_img_800x800_eb97c5_fit_center.jpg");
    images19.add("https://media.hasaki.vn/catalog/product/k/e/kem-rua-mat-oxy-sach-khuan-mun-kiem-soat-nhon-100g_img_800x800_eb97c5_fit_center.jpg");
    FirebaseFirestore.instance.collection('Product').doc('359').set({
      'id': 359,
      'name': "Kem Rửa Mặt Oxy Sạch Khuẩn Mụn, Kiểm Soát Nhờn 100g",
      'engName': "Total Anti-Acne",
      'brandID': 52,
      'categoryID': 2,
      'originID': 2,
      'skinID': 2,
      'sessionID': 1,
      'genderID': 3,
      'structureID': 1,
      'soldOut': 1,
      'totalStarRating': 4,
      'totalRating': 1,
      'marketPrice': 76000,
      'importPrice': 40000,
      'defaultDiscountRate': 22,
      'price': 59000,
      'chemicalComposition': chemicalComposition19,
      'guideLine': guideLine19,
      'image': images19,
      'userFavorite': [],
      'available': 38,
      'searchCount': 0,
      'popularSearchTitle': 'Kem Rửa Mặt Oxy'
    });

    String chemicalComposition20 = 'Salicylic Acid, Water, Ethanol, Salicylic Acid, PEG-8/SMDI Copolymer (Polyolprepolymer-15), Isoceteth-20, Fragrance, Triethanolamine, Trisodium EDTA';
    String guideLine20 = 'Lau nhẹ nhàng vùng da sần sùi hay vùng da có mụn, lỗ chân lông bị dơ, mụn đầu đen bằng miếng pad. Không dùng quanh vùng mắt.';
    List<String> images20 = [];
    images20.add("https://media.hasaki.vn/catalog/product/m/i/mieng-lam-sach-da-mat-ngua-mun-oxy-55-mieng20_img_800x800_eb97c5_fit_center.jpg");
    images20.add("https://media.hasaki.vn/catalog/product/m/i/mieng-lam-sach-da-mat-ngua-mun-oxy-55-mieng20_img_800x800_eb97c5_fit_center.jpg");
    images20.add("https://media.hasaki.vn/catalog/product/m/i/mieng-lam-sach-da-mat-ngua-mun-oxy-55-mieng20_img_800x800_eb97c5_fit_center.jpg");
    FirebaseFirestore.instance.collection('Product').doc('360').set({
      'id': 360,
      'name': "Miếng Làm Sạch Da Oxy Giúp Ngừa Mụn 55 miếng",
      'engName': "Perfect Clear Pad",
      'brandID': 52,
      'categoryID': 13,
      'originID': 2,
      'skinID': 2,
      'sessionID': 1,
      'genderID': 3,
      'structureID': 12,
      'soldOut': 3,
      'totalStarRating': 0,
      'totalRating': 0,
      'marketPrice': 86000,
      'importPrice': 70000,
      'defaultDiscountRate': 1,
      'price': 85000,
      'chemicalComposition': chemicalComposition20,
      'guideLine': guideLine20,
      'image': images20,
      'userFavorite': [],
      'available': 37,
      'searchCount': 0,
      'popularSearchTitle': 'Miếng Làm Sạch Da Oxy'
    });

    String chemicalComposition21 = 'Water (Aqua), Sodium Lauroamphoacetate, Sodium Cocoyl Isethionate (cleansing), Stearic Acid (texture-enhancing), Glycerin (hydration/skin replenishing), Glycol Distearate (texture-enhancing), Helianthus Annuus (Sunflower) Seed Oil (non-fragrant antioxidant plant oil), Acrylates Copolymer, Cetearyl Alcohol, Sodium Hyaluronate, Ceramide NP, Ceramide AP, Ceramide EOP (hydration/skin replenishing), Phytosphingosine (skin-restoring), Phospholipids, Sphingolipids (hydration/skin replenishing), Lecithin (skin-restoring), Arginine (amino acid/hydration/skin replenishing), Cholesterol (hydration/skin replenishing), Aloe Barbadensis Leaf Extract (hydration/skin-soothing), Disodium EDTA (stabilizer), Sodium Chloride (stabilizer), Sodium Hydroxide (pH adjuster), Sodium Lauroyl Lactylate (texture-enhancing), Xanthan Gum, Carbomer (texture-enhancing), Hexylene Glycol, Phenoxyethanol (preservatives), Caprylyl Glycol.';
    String guideLine21 = 'Làm ướt mặt và thoa một lượng kem vừa đủ lên da, massage nhẹ nhàng, sau đó rửa lại với nước và tiếp tục thực hiện các bước chăm sóc da tiếp theo.';
    List<String> images21 = [];
    images21.add("https://media.hasaki.vn/catalog/product/s/u/sua-rua-mat-paula-s-choice-can-bang-da-190ml-05_img_800x800_eb97c5_fit_center.jpg");
    images21.add("https://media.hasaki.vn/catalog/product/s/u/sua-rua-mat-can-bang-da-paula-s-choice-190mlb_img_800x800_eb97c5_fit_center.jpg");
    images21.add("https://media.hasaki.vn/catalog/product/s/u/sua-rua-mat-paula-s-choice-can-bang-da-190ml-06_img_800x800_eb97c5_fit_center.jpg");
    FirebaseFirestore.instance.collection('Product').doc('361').set({
      'id': 361,
      'name': "Sữa Rửa Mặt Paula’s Choice Cân Bằng Độ Ẩm Da 190ml",
      'engName': "Resist Perfectly Balanced Foaming Cleanser",
      'brandID': 53,
      'categoryID': 2,
      'originID': 3,
      'skinID': 3,
      'sessionID': 1,
      'genderID': 1,
      'structureID': 4,
      'soldOut': 5,
      'totalStarRating': 5,
      'totalRating': 1,
      'marketPrice': 760000,
      'importPrice': 530000,
      'defaultDiscountRate': 25,
      'price': 573000,
      'chemicalComposition': chemicalComposition21,
      'guideLine': guideLine21,
      'image': images21,
      'userFavorite': [],
      'available': 36,
      'searchCount': 0,
      'popularSearchTitle': 'Sữa Rửa Mặt Paula’s Choice'
    });

    String chemicalComposition22 = 'Water (Aqua), Sodium Lauroyl Sarcosinate, Acrylates/Steareth-20 Methacrylate Copolymer, Glycerin, PEG-200 Hydrogenated Glyceryl Palmate, Sodium Laureth Sulfate, Arginine, Butylene Glycol, PEG-7 Glyceryl Cocoate, Panthenol, Disodium EDTA, Citric Acid, PEG-60 Hydrogenated Castor Oil, Sodium Citrate, Phenoxyethanol, Caprylyl Glycol, Chlorphenesin.';
    String guideLine22 = '- Làm ướt mặt và thoa một lượng kem vừa đủ lên da mặt và vùng quanh mắt, massage nhẹ nhàng và sau đó làm sạch với nước. \n- Nếu trên da có lớp trang điểm, bạn có thể kết hợp với dầu tẩy trang/nước tẩy trang để đạt hiệu quả làm sạch tốt nhất.';
    List<String> images22 = [];
    images22.add("https://media.hasaki.vn/catalog/product/s/u/sua-rua-mat-paula-s-choice-ngua-mun-se-lo-chan-long-177ml_img_800x800_eb97c5_fit_center.png");
    images22.add("https://media.hasaki.vn/catalog/product/s/u/sua-rua-mat-paula-s-choice-ngua-mun-se-lo-chan-long-177ml-1_img_800x800_eb97c5_fit_center.jpg");
    images22.add("https://media.hasaki.vn/catalog/product/s/u/sua-rua-mat-paula-s-choice-ngua-mun-se-lo-chan-long-177ml-3_img_800x800_eb97c5_fit_center.jpg");
    FirebaseFirestore.instance.collection('Product').doc('362').set({
      'id': 362,
      'name': "Sữa Rửa Mặt Paula's Choice Ngừa Mụn, Se Lỗ Chân Lông 177ml",
      'engName': "Clear Pore Normalizing Cleanser",
      'brandID': 53,
      'categoryID': 2,
      'originID': 3,
      'skinID': 2,
      'sessionID': 1,
      'genderID': 1,
      'structureID': 4,
      'soldOut': 6,
      'totalStarRating': 0,
      'totalRating': 0,
      'marketPrice': 579000,
      'importPrice': 390000,
      'defaultDiscountRate': 26,
      'price': 429000,
      'chemicalComposition': chemicalComposition22,
      'guideLine': guideLine22,
      'image': images22,
      'userFavorite': [],
      'available': 35,
      'searchCount': 0,
      'popularSearchTitle': 'Sữa Rửa Mặt Paula’s Choice'
    });

    String chemicalComposition23 = 'Water (Aqua), Methylpropanediol (hydration), Butylene Glycol (hydration), Salicylic Acid (beta hydroxy acid/exfoliant), Polysorbate 20 (stabilizer), Camellia Oleifera Leaf Extract (green tea/skin calming/antioxidant), Sodium Hydroxide (pH balancer), Tetrasodium EDTA (stabilizer).';
    String guideLine23 = '- Dùng từ 1 đến 2 lần mỗi ngày sau bước rửa mặt và toner. Nhẹ nhàng đổ ra tấm bông tẩy trang rồi thoa đều lên toàn bộ khuôn mặt, bao gồm cả vùng mắt (tránh tác động trực tiếp vào mi và lông mi), không cần rửa lại bằng nước. Bên cạnh đó, có thể dùng tay để apply trực tiếp lên da. \n- Lưu ý: vào ban ngày, sử dụng kem chống nắng có chỉ số chống nắng có SPF từ 25 đến 30 sau khi sử dụng Skin Perfecting 2% BHA Liquid.';
    List<String> images23 = [];
    images23.add("https://media.hasaki.vn/catalog/product/d/u/dung-dich-loai-bo-te-bao-chet-paula-s-choice-bha-2-118ml-06_img_800x800_eb97c5_fit_center.jpg");
    images23.add("https://media.hasaki.vn/catalog/product/d/u/dung-dich-tay-da-chet-paula-s-choice-bha-2-118ml-1_1_img_800x800_eb97c5_fit_center.jpg");
    images23.add("https://media.hasaki.vn/catalog/product/d/u/dung-dich-tay-da-chet-paula-s-choice-bha-2-118ml-1_img_800x800_eb97c5_fit_center.jpg");
    FirebaseFirestore.instance.collection('Product').doc('363').set({
      'id': 363,
      'name': "Dung Dịch Tẩy Da Chết Paula’s Choice BHA 2% 118ml",
      'engName': "Skin Perfecting 2% BHA Liquid",
      'brandID': 53,
      'categoryID': 3,
      'originID': 3,
      'skinID': 3,
      'sessionID': 3,
      'genderID': 1,
      'structureID': 5,
      'soldOut': 714,
      'totalStarRating': 320,
      'totalRating': 66,
      'marketPrice': 949000,
      'importPrice': 555000,
      'defaultDiscountRate': 38,
      'price': 591000,
      'chemicalComposition': chemicalComposition23,
      'guideLine': guideLine23,
      'image': images23,
      'userFavorite': [],
      'available': 34,
      'searchCount': 0,
      'popularSearchTitle': 'Dung Dịch Tẩy Da Chết Paula’s Choice'
    });

    String chemicalComposition24 = 'Water (Aqua), Butylene Glycol, Cetyl Alcohol, Cyclopentasiloxane, Dimethicone, Salicylic Acid, Avena Sativa (Oat) Bran Extract, Allantoin, Camellia Sinensis (Green Tea) Leaf Extract, Glycyrrhiza Glabra (Licorice) Root Extract, Epilobium Angustifolium Flower/Leaf/Stem Extract, Lauric Acid, Glycerin, Polysorbate 20, Sorbitan Stearate, Magnesium Aluminum Silicate, Ammonium Acryloyldimethyltaurate/VP Copolymer, PEG-40 Stearate, Xanthan Gum, Hexylene Glycol, Sodium Hydroxide, Ethylhexylglycerin, Disodium EDTA, Phenoxyethanol, Caprylyl Glycol.';
    String guideLine24 = '- Dùng từ 1 đến 2 lần mỗi ngày sau bước rửa mặt và toner. Nhẹ nhàng đổ ra tấm bông tẩy trang rồi thoa đều lên toàn bộ khuôn mặt, bao gồm cả vùng mắt (tránh tác động trực tiếp vào mi và lông mi), không cần rửa lại bằng nước. Bên cạnh đó, có thể dùng tay để apply trực tiếp lên da. \n- Lưu ý: vào ban ngày, sử dụng kem chống nắng có chỉ số chống nắng có SPF từ 25 đến 30 sau khi sử dụng Skin Perfecting 2% BHA Liquid.';
    List<String> images24 = [];
    images24.add("https://media.hasaki.vn/catalog/product/f/a/facebook-dynamic-tay-da-chet-paula-s-choice-diu-nhe-cho-da-nhay-cam-30ml_img_800x800_eb97c5_fit_center.jpg");
    images24.add("https://media.hasaki.vn/catalog/product/t/a/tay-da-chet-paula-s-choice-diu-nhe-cho-da-nhay-cam-30ml-1_img_800x800_eb97c5_fit_center.jpg");
    images24.add("https://media.hasaki.vn/catalog/product/t/a/tay-da-chet-paula-s-choice-diu-nhe-cho-da-nhay-cam-30ml_img_800x800_eb97c5_fit_center.jpg");
    FirebaseFirestore.instance.collection('Product').doc('364').set({
      'id': 364,
      'name': "Tẩy Da Chết Paula’s Choice Dịu Nhẹ Cho Da Nhạy Cảm 30ml",
      'engName': "Calm Redness Relief 1% BHA Lotion Exfoliant",
      'brandID': 53,
      'categoryID': 3,
      'originID': 3,
      'skinID': 6,
      'sessionID': 1,
      'genderID': 1,
      'structureID': 2,
      'soldOut': 31,
      'totalStarRating': 5,
      'totalRating': 1,
      'marketPrice': 339000,
      'importPrice': 555000,
      'defaultDiscountRate': 16,
      'price': 285000,
      'chemicalComposition': chemicalComposition24,
      'guideLine': guideLine24,
      'image': images24,
      'userFavorite': [],
      'available': 33,
      'searchCount': 0,
      'popularSearchTitle': 'Tẩy Da Chết Paula’s Choice'
    });

    String chemicalComposition25 = 'Water, Glycerin (skin-repairing ingredient), Butylene Glycol (water-binding agent), Niacinamide (vitamin B3/cell-communcating ingredient), Adenosine Triphosphate (cell-communicating ingredient/skin conditioning agent), Anthemis Nobilis (Chamomile) Flower Extract (anti-irritant), Arctium Lappa (Burdock) Root Extract (antioxidant), Hydrolyzed Jojoba Esters, Hydrolyzed Vegetable Protein (skin conditioning agents), Sodium PCA, Panthenol, Sodium Hyaluronate (skin-repairing ingredients), Sodium Chondroitin Sulfate (skin conditioning agent), Ceramide 3, Ceramide 6 II, Ceramide 1, Phytosphingosine, Cholesterol (lipid-based skin-repairing ingredients), Tetrahexyldecyl Ascorbate (vitamin C/antioxidant), Oleth-10, DEA-Oleth-10 Phosphate, Sodium Lauroyl Lactylate (emulsifiers), Polysorbate-20 (skin conditioning agent), Caprylyl Glycol, Hexylene Glycol (preservatives), Sodium Citrate (pH adjuster), Xanthan Gum (thickener), Trisodium EDTA (chelating agent), Phenoxyethanol (preservative).';
    String guideLine25 = '- Rửa sạch mặt. Sau đó, lấy một lượng nhỏ ra bông tẩy trang, nhẹ nhàng thoa lên cổ và mặt. Không rửa lại với nước \n- Sử dụng vào buổi sáng và buổi tối. \n Nên dùng kèm kem chống nắng';
    List<String> images25 = [];
    images25.add("https://media.hasaki.vn/catalog/product/n/u/nuoc-can-bang-paula-s-choice-dieu-chinh-lo-chan-long-190ml_img_800x800_eb97c5_fit_center.jpg");
    images25.add("https://media.hasaki.vn/catalog/product/n/u/nuoc-can-bang-paula-s-choice-dieu-chinh-lo-chan-long-190ml-3_img_800x800_eb97c5_fit_center.jpg");
    images25.add("https://media.hasaki.vn/catalog/product/n/u/nuoc-can-bang-paula-s-choice-dieu-chinh-lo-chan-long-190ml-4_img_800x800_eb97c5_fit_center.jpg");
    FirebaseFirestore.instance.collection('Product').doc('365').set({
      'id': 365,
      'name': "Nước Cân Bằng Paula’s Choice Điều Chỉnh Lỗ Chân Lông 190ml",
      'engName': "Skin Balancing Pore-Reducing Toner",
      'brandID': 53,
      'categoryID': 5,
      'originID': 3,
      'skinID': 3,
      'sessionID': 1,
      'genderID': 1,
      'structureID': 5,
      'soldOut': 10,
      'totalStarRating': 10,
      'totalRating': 2,
      'marketPrice': 729000,
      'importPrice': 500000,
      'defaultDiscountRate': 25,
      'price': 545000,
      'chemicalComposition': chemicalComposition25,
      'guideLine': guideLine25,
      'image': images25,
      'userFavorite': [],
      'available': 32,
      'searchCount': 0,
      'popularSearchTitle': 'Nước Cân Bằng Paula’s Choice'
    });

    String chemicalComposition26 = 'Water (Aqua), Glycerin (hydration/skin replenishing), Ethoxydiglycol (hydration), Niacinamide (skin-restoring), Acetyl Glucosamine (hydration/skin replenishing), Salix Nigra (Willow) Bark Extract (skin-soothing), Resveratrol (grape-derived antioxidant), Sodium Hyaluronate (hydration/skin replenishing), Palmitoyl Tetrapeptide-7 (skin-restoring), Palmitoyl Tripeptide-1 (skin-restoring), Phospholipids (hydration/skin replenishing), Epigallocatechin Gallate (antioxidant), Carnosine (skin-restoring), Genistein (antioxidant), Glycyrrhiza Glabra (Licorice) Root Extract (skin-soothing), Adenosine (skin-restoring), Xanthan Gum (texture-enhancing), Citric Acid (pH adjuster), Polysorbate 20 (texture-enhancing), Butylene Glycol (hydration), Ethylhexylglycerin (preservative), Carbomer (texture-enhancing), Tetrasodium EDTA (stabilizer), Phenoxyethanol (preservative).';
    String guideLine26 = '- Rửa sạch mặt. Sau đó, lấy một lượng nhỏ ra bông tẩy trang, nhẹ nhàng thoa lên cổ và mặt. Không rửa lại với nước \n- Sử dụng vào buổi sáng và buổi tối. \n Nên dùng kèm kem chống nắng';
    List<String> images26 = [];
    images26.add("https://media.hasaki.vn/catalog/product/t/o/toner-paula-s-choice-sieu-nhe-cho-da-dau-lao-hoa-118ml_img_800x800_eb97c5_fit_center.jpg");
    images26.add("https://media.hasaki.vn/catalog/product/t/o/toner-paula-s-choice-sieu-nhe-cho-da-dau-lao-hoa-118ml-1_img_800x800_eb97c5_fit_center.jpg");
    images26.add("https://media.hasaki.vn/catalog/product/t/o/toner-paula-s-choice-sieu-nhe-cho-da-dau-lao-hoa-118ml-2_img_800x800_eb97c5_fit_center.jpg");
    FirebaseFirestore.instance.collection('Product').doc('366').set({
      'id': 366,
      'name': "Toner Paula's Choice Siêu Nhẹ Cho Da Dầu & Lão Hóa 118ml",
      'engName': "Resist Weightless Advanced Repairing Toner",
      'brandID': 53,
      'categoryID': 5,
      'originID': 3,
      'skinID': 1,
      'sessionID': 1,
      'genderID': 1,
      'structureID': 5,
      'soldOut': 2,
      'totalStarRating': 0,
      'totalRating': 0,
      'marketPrice': 860000,
      'importPrice': 630000,
      'defaultDiscountRate': 20,
      'price': 688000,
      'chemicalComposition': chemicalComposition26,
      'guideLine': guideLine26,
      'image': images26,
      'userFavorite': [],
      'available': 31,
      'searchCount': 0,
      'popularSearchTitle': 'Nước Cân Bằng Paula’s Choice'
    });

    String chemicalComposition27 = 'Water, Glycolic Acid (alpha hydroxy acid/exfoliant), Cyclopentasiloxane (hydration), Dimethicone (hydration), Glycerin (hydration/skin replenishing), Glyceryl Stearate (texture-enhancing), Stearic Acid (texture-enhancing), Cetyl Alcohol (texture-enhancing), Butyrospermum Parkii (shea butter/emollient/antioxidant), Sodium Hydroxide (pH adjuster), PEG-100 Stearate (texture-enhancing), Tetrahexyldecyl Ascorbate (stabilized vitamin C/antioxidant), Tocopheryl Acetate (vitamin E/antioxidant), Chamomilla Recutita Matricaria Flower Extract (chamomile extract/skin-soothing), Vitis Vinifera Seed Oil (grape extract/non-fragrant oil/emollient/antioxidant), Camellia Oleifera Extract (green tea extract/antioxidant), Epilobium Angustifolium Flower/Leaf/Stem Extract (willow herb extract (skin-soothing), Allantoin (skin-soothing), Butylene Glycol (hydration), Xanthan Gum (texture-enhancing), Disodium EDTA (stabilizer), sodium benzoate (preservative), phenoxyethanol (preservative).';
    String guideLine27 = 'Lấy một lượng nhỏ sản phẩm để làm sạch da. Có thể được sử dụng hàng ngày đối với toàn bộ cơ thể hoặc loại bỏ tại chỗ với một vùng da khi cần thiết. Hãy kết hợp với các sản phẩm dưỡng ẩm tốt khác để đạt hiệu quả tốt nhất.';
    List<String> images27 = [];
    images27.add("https://media.hasaki.vn/catalog/product/f/a/facebook-dynamic-kem-duong-the-paula-s-choice-10-aha-lam-sang-da-210ml_img_800x800_eb97c5_fit_center.jpg");
    images27.add("https://media.hasaki.vn/catalog/product/k/e/kem-duong-the-paula-s-choice-10-aha-lam-sang-da-210ml_img_800x800_eb97c5_fit_center.jpg");
    images27.add("https://media.hasaki.vn/catalog/product/k/e/kem-duong-the-paula-s-choice-10-aha-lam-sang-da-210ml-2_img_800x800_eb97c5_fit_center.jpg");
    FirebaseFirestore.instance.collection('Product').doc('367').set({
      'id': 367,
      'name': "Kem Dưỡng Thể Paula’s Choice 10% AHA Làm Sáng Da 210ml",
      'engName': "Resist Skin Revealing Body Lotion with 10% AHA",
      'brandID': 53,
      'categoryID': 8,
      'originID': 3,
      'skinID': 1,
      'sessionID': 1,
      'genderID': 1,
      'structureID': 1,
      'soldOut': 6,
      'totalStarRating': 4,
      'totalRating': 1,
      'marketPrice': 950000,
      'importPrice': 711000,
      'defaultDiscountRate': 20,
      'price': 760000,
      'chemicalComposition': chemicalComposition27,
      'guideLine': guideLine27,
      'image': images27,
      'userFavorite': [],
      'available': 30,
      'searchCount': 0,
      'popularSearchTitle': 'Kem Dưỡng Thể Paula’s Choice'
    });

    String chemicalComposition28 = 'Water (Aqua), Carthamus Tinctorius (Safflower) Seed Oil (non-fragrant antioxidant plant oil), Cetyl Alcohol, Stearyl Alcohol (texture enhancers/emollients), Glycerin (skin-replenishing), Butyrospermum Parkii (Shea) Butter Extract (emollient/antioxidant), Butylene Glycol (texture enhancer), Glyceryl Stearate, PEG-100 Stearate (texture enhancers), Dimethicone (hydration), Persea Gratissima (Avocado) Oil, Simmondsia Chinensis (Jojoba) Seed Oil (non-fragrant plant oils), Ceramide AP, Ceramide NP, Ceramide EOP (skin-replenishing), Squalane (olive-derived emollient), Cholesterol (skin-replenishing), Allantoin (skin-soothing), Tocopherol (vitamin E/antioxidant), Vitis Vinifera (Grape) Seed Oil (non-fragrant antioxidant plant oil), Camellia Oleifera (Green Tea) Leaf Extract (antioxidant), Epilobium Angustifolium (Willow Herb) Flower/Leaf/Stem Extract (skin-soothing), Hydrolyzed Acacia Macrostachya Seed Extract (antioxidant), Phytosphingosine (skin-restoring), Myristoyl Tripeptide-31 (skin-restoring), Lecithin (skin-restoring fatty acid), Panthenol (hydration), Hydrogenated Lecithin (skin-restoring fatty acid), Caprylyl Caprylate/Caprate (coconut-derived emollient), Ethylhexyl Olivate (olive-derived emollient), Lactic Acid (hydration), Cyclohexasiloxane, Cyclopentasiloxane, Cellulose Gum (texture enhancers), Maltodextrin (sugar-derived hydrator), Sodium Lauroyl Lactylate (hydration), Sodium Hydroxide (pH adjuster), Acrylates/C10-30 Alkyl Acrylate Crosspolymer (film-forming agent), Xanthan Gum, Carbomer (texture enhancer), Behenyl Alcohol, Myristyl Alcohol, Lauryl Alcohol, Arachidyl Alcohol (plant-derived emollients), Phenoxyethanol, Benzoic Acid, Dehydroacetic Acid (preservatives).';
    String guideLine28 = 'Lấy một lượng nhỏ sản phẩm để làm sạch da. Có thể được sử dụng hàng ngày đối với toàn bộ cơ thể hoặc loại bỏ tại chỗ với một vùng da khi cần thiết. Hãy kết hợp với các sản phẩm dưỡng ẩm tốt khác để đạt hiệu quả tốt nhất.';
    List<String> images28 = [];
    images28.add("https://media.hasaki.vn/catalog/product/f/a/facebook-dynamic-kem-duong-the-paula-s-choice-cap-am-cho-da-mem-min-210ml_img_800x800_eb97c5_fit_center.jpg");
    images28.add("https://media.hasaki.vn/catalog/product/k/e/kem-duong-the-paula-s-choice-cap-am-cho-da-mem-min-210ml-4_img_800x800_eb97c5_fit_center.jpg");
    images28.add("https://media.hasaki.vn/catalog/product/k/e/kem-duong-the-paula-s-choice-cap-am-cho-da-mem-min-210ml-5_img_800x800_eb97c5_fit_center.jpg");
    FirebaseFirestore.instance.collection('Product').doc('368').set({
      'id': 368,
      'name': "Kem Dưỡng Thể Paula’s Choice Cấp Ẩm Cho Da Mềm Mịn 210ml",
      'engName': "Daily Replenishing Body Cream",
      'brandID': 53,
      'categoryID': 8,
      'originID': 3,
      'skinID': 1,
      'sessionID': 1,
      'genderID': 1,
      'structureID': 1,
      'soldOut': 0,
      'totalStarRating': 0,
      'totalRating': 0,
      'marketPrice': 639000,
      'importPrice': 399000,
      'defaultDiscountRate': 30,
      'price': 450000,
      'chemicalComposition': chemicalComposition28,
      'guideLine': guideLine28,
      'image': images28,
      'userFavorite': [],
      'available': 29,
      'searchCount': 0,
      'popularSearchTitle': 'Kem Dưỡng Thể Paula’s Choice'
    });

    String chemicalComposition29 = 'Water (Aqua), Dimethicone (skin-softening), Glycerin (skin-replenishing), Butylene Glycol (hydrating), Isononyl Isononanoate (emollient), Castor Isostearate Succinate (skin-softening ), Glyceryl Stearate (texture enhancer), C12-15 Alkyl Benzoate (emollient), Dimethicone Crosspolymer (texture enhancer), PEG-33 (stabilizer), Polysorbate 20 (texture enhancer), Behenyl Alcohol (texture enhancer), PEG-100 Stearate (texture enhancer), Pentaerythrityl Tetraisostearate (stabilizer), Polymethylsilsesquioxane (texture enhancer), Tetrahexyldecyl Ascorbate (vitamin C/antioxidant), Retinol (skin-restoring), Ceramide NG (skin-replenishing) , Palmitoyl Tetrapeptide-7 (skin-restoring), Palmitoyl Hexapeptide-12 (skin-restoring), Sodium Hyaluronate (skin-replenishing ), Dipotassium Glycyrrhizate (antioxidant plant extracts/skin-soothing), Glycyrrhiza Glabra Root Extract (licorice extract/antioxidant/skin-soothing), Avena Sativa Kernel Extract (oat extract/antioxidant/skin-soothing), Arctium Lappa Root Extract (burdock extract/antioxidant/skin-soothing), Salix Alba Bark Extract (willow bark extract/antioxidant/skin-soothing), Glycine Soja Sterols (antioxidant/skin-softening ), Lecithin (skin-restoring), Allantoin (skin-soothing), Tocopheryl Acetate (vitamin E/antioxidant), Hydrolyzed Soy Protein (antioxidant/skin-softening), Sorbitan Laurate (texture enhancer), Acetyl Dipeptide-1 Cetyl Ester (skin-soothing), Disodium EDTA (stabilizer), Hydroxyethylcellulose (texture enhancer), Palmitoyl Tripeptide-1 (skin-restoring), Sodium Hydroxide (pH adjuster), Tribehenin (emollient), Caprylyl Glycol (skin-softening), Ethylhexylglycerin (skin-softening), Pentylene Glycol (hydrating), PEG-75 Shea Butter Glycerides (emollient), PPG-12/SMDI Copolymer (stabilizer), PEG-10 Phytosterol (fatty acid-based emollient), PEG-8 Dimethicone (skin-softening), PEG-14 (texture enhancer), Magnesium Aluminum Silicate (texture enhancer), Arachidyl Glucoside (texture enhancer), Arachidyl Alcohol (texture enhancer), Sclerotium Gum (texture enhancer), Carbomer (gel-based texture enhancer), Phenoxyethanol (preservative), Benzoic Acid (preservative).';
    String guideLine29 = '- Với những người mới sử dụng lần đầu không nên dùng quá 3 lần/ tuần mà thoa với tần suất tăng dần để da quen dần với sản phẩm. \n– Sử dụng sau bước rửa mặt và toner. \n– Tránh sử dụng lên vùng môi, mắt. \n–  Nếu muốn giảm thiểu kích ứng, hãy thử kết hợp từ 2-3 giọt của Resist Moisturizer Renewal Oil Booster. \n– Có thể sử dụng cùng lúc với tẩy da chết AHA hoặc BHA của bạn, nhưng hãy để ý xem làn da của bạn phản ứng như thế nào. Nếu bạn nhận thấy dấu hiệu căng rát, hãy sử dụng tẩy da chết AHA hoặc BHA vào buổi sáng và cải thiện vào ban đêm hoặc giảm tần suất sử dụng Clinical 1% Retinol Treatment xuống.';
    List<String> images29 = [];
    images29.add("https://media.hasaki.vn/catalog/product/t/i/tinh-chat-paula-s-choice-ngua-lao-hoa-nam-nep-nhan-30ml_img_800x800_eb97c5_fit_center.jpg");
    images29.add("https://media.hasaki.vn/catalog/product/t/i/tinh-chat-paula-s-choice-ngua-lao-hoa-nam-nep-nhan-30ml-1_img_800x800_eb97c5_fit_center.jpg");
    images29.add("https://media.hasaki.vn/catalog/product/t/i/tinh-chat-paula-s-choice-ngua-lao-hoa-nam-nep-nhan-30ml-3_img_800x800_eb97c5_fit_center.jpg");
    FirebaseFirestore.instance.collection('Product').doc('369').set({
      'id': 369,
      'name': "Tinh Chất Paula’s Choice Ngừa Lão Hóa, Nám & Nếp Nhăn 30ml",
      'engName': "Clinical 1% Retinol Treatment",
      'brandID': 53,
      'categoryID': 7,
      'originID': 3,
      'skinID': 1,
      'sessionID': 3,
      'genderID': 1,
      'structureID': 7,
      'soldOut':33,
      'totalStarRating': 9,
      'totalRating': 2,
      'marketPrice': 1950000,
      'importPrice': 1388000,
      'defaultDiscountRate': 20,
      'price': 14590000,
      'chemicalComposition': chemicalComposition29,
      'guideLine': guideLine29,
      'image': images29,
      'userFavorite': [],
      'available': 28,
      'searchCount': 0,
      'popularSearchTitle': 'Tinh Chất Paula’s Choice'
    });

    String chemicalComposition30 = 'Water (Aqua), Ascorbic Acid, Butylene Glycol, Ethoxydiglycol, Glycerin, PPG-26-Buteth-26, PEG-40 Hydrogenated Castor Oil, Pentylene Glycol, Tocopherol, Sodium Hyaluronate, Hexanoyl Dipeptide-3 Norleucine Acetate, Lecithin, Ferulic Acid, Panthenol, Bisabolol, Oryza Sativa (Rice) Bran Extract, Propyl Gallate, Sodium Gluconate, Sodium Hydroxide, Phenoxyethanol, Ethylhexylglycerin.';
    String guideLine30 = '- Sử dụng từ 1 đến 2 lần một ngày sau bước sữa rửa mặt, toner và tẩy da chết. \n- Nhỏ từ 2 -3 giọt vào lòng bàn tay và thoa đều trên làn da. \n- Bạn có thể sử dụng độc lập hoặc trộn chung cùng với serum, kem dưỡng ẩm yêu thích khác. \n- Vào ban ngày, luôn luôn sử dụng kem chống nắng có chỉ số SPF 30 trở lên.';
    List<String> images30 = [];
    images30.add("https://media.hasaki.vn/catalog/product/t/i/tinh-chat-paula-s-choice-15-vitamin-c-lam-sang-da-20ml_img_800x800_eb97c5_fit_center.jpg");
    images30.add("https://media.hasaki.vn/catalog/product/t/i/tinh-chat-paula-s-choice-15-vitamin-c-lam-sang-da-20ml-1_img_800x800_eb97c5_fit_center.jpg");
    images30.add("https://media.hasaki.vn/catalog/product/t/i/tinh-chat-paula-s-choice-15-vitamin-c-lam-sang-da-20ml-3_img_800x800_eb97c5_fit_center.jpg");
    FirebaseFirestore.instance.collection('Product').doc('370').set({
      'id': 370,
      'name': "Tinh Chất Paula's Choice 15% Vitamin C Làm Sáng Da 20ml",
      'engName': "Resist C15 Super Booster",
      'brandID': 53,
      'categoryID': 7,
      'originID': 3,
      'skinID': 1,
      'sessionID': 1,
      'genderID': 1,
      'structureID': 7,
      'soldOut':7,
      'totalStarRating': 0,
      'totalRating': 0,
      'marketPrice': 1600000,
      'importPrice': 1057000,
      'defaultDiscountRate': 26,
      'price': 1189000,
      'chemicalComposition': chemicalComposition30,
      'guideLine': guideLine30,
      'image': images30,
      'userFavorite': [],
      'available': 28,
      'searchCount': 0,
      'popularSearchTitle': 'Tinh Chất Paula’s Choice'
    });

    String chemicalComposition31 = 'Water (Aqua), Ethyl Macadamiate (hydration), Glycerin (skin-replenishing), Cetearyl Alcohol (texture enhancer), Propanediol (hydration), Triethylhexanoin (skin-smoothing), Sodium Acrylates Copolymer (texture enhancer), Glyceryl Stearate, PEG-100 Stearate (thickeners), Glycyrrhiza Glabra (Licorice) Root Extract (skin- soothing), Hydrolyzed Pumpkin Seedcake (skin-replenishing), Vaccinium Angustifolium (Blueberry) Fruit Extract (antioxidant), Euterpe Oleracea (Acai) Fruit Extract (antioxidant), Prunus Serotina (Wild Cherry) Fruit Extract (skin-soothing/antioxidant), Niacinamide (skin-restoring),Tripeptide-29 (skin-restoring), Ceramide NP, Ceramide AP, Ceramide EOP (skin-replenishing), Sodium Hyaluronate (skin-replenishing/hydration), Phytosphingosine (skin-restoring), Cholesterol (skin-replenishing), Panthenol (hydration), Sodium PCA (skin-replenishing), Adenosine (skin-restoring), Lecithin (skin-restoring/hydration), Arginine (amino acid/hydration), Sodium Lauroyl Lactylate (emulsifier) Sodium Gluconate (hydration/chelation), Citric Acid (pH adjuster), Isohexadecane (solvent/texture enhancer), Xanthan Gum, Carbomer (thickeners), Phenoxyethanol, Ethylhexylglycerin (preservatives).';
    String guideLine31 = 'Vào ban đêm, sử dụng như bước cuối cùng trong quy trình chăm sóc da của bạn. Sản phẩm này có thể sử dụng vào ban ngày với điều kiện bắt buộc sử dụng cùng kem chống nắng phổ rộng SPF 30 trở lên.';
    List<String> images31 = [];
    images31.add("https://media.hasaki.vn/catalog/product/k/e/kem-duong-am-paula-s-choice-danh-cho-da-mun-60ml-4_img_800x800_eb97c5_fit_center.jpg");
    images31.add("https://media.hasaki.vn/catalog/product/k/e/kem-duong-am-paula-s-choice-danh-cho-da-mun-60ml-4_1_img_800x800_eb97c5_fit_center.jpg");
    images31.add("https://media.hasaki.vn/catalog/product/k/e/kem-duong-am-paula-s-choice-danh-cho-da-mun-60ml-5_img_800x800_eb97c5_fit_center.jpg");
    FirebaseFirestore.instance.collection('Product').doc('371').set({
      'id': 371,
      'name': "Kem Dưỡng Ẩm Paula's Choice Dành Cho Da Mụn 60ml",
      'engName': "Clear Oil-Free Moisturizer",
      'brandID': 53,
      'categoryID': 9,
      'originID': 3,
      'skinID': 2,
      'sessionID': 1,
      'genderID': 1,
      'structureID': 1,
      'soldOut': 11,
      'totalStarRating': 0,
      'totalRating': 0,
      'marketPrice': 899000,
      'importPrice': 666000,
      'defaultDiscountRate': 18,
      'price': 739000,
      'chemicalComposition': chemicalComposition31,
      'guideLine': guideLine31,
      'image': images31,
      'userFavorite': [],
      'available': 27,
      'searchCount': 0,
      'popularSearchTitle': "Kem Dưỡng Ẩm Paula's Choice"
    });

    String chemicalComposition32 = 'Water (Aqua), Cyclopentasiloxane (texture enhancer/hydration), Octyldodecyl Neopentanoate (texture enhancer), Vinyl Dimethicone/Methicone Silsesquioxane Crosspolymer (texture enhancer/film-forming agent), Glycerin (skin-replenishing), Sodium Ascorbyl Phosphate (vitamin C/antioxidant), Cetyl Alcohol (emollient), Niacinamide (skin-restoring), Dimethicone (hydration), Cetearyl Alcohol (emollient), Butylene Glycol (slip agent/hydration), Glyceryl Stearate (texture enhancer), PEG-100 Stearate (texture enhancer), Adenosine (skin-restoring), Epigallocatechin Gallate (green tea-derived antioxidant), Glucose Oxidase (hydration), Lactoperoxidase (hydration/soothing), Boerhavia Diffusa Root Extract (skin-soothing), Cocos Nucifera (Coconut) Fruit Extract (antioxidant), Lactobacillus (hydration/skin-soothing), Polysilicone-11 (texture enhancer), Sodium Chloride (texture enhancer), Potassium Thiocyanate (hydration), Glucose (hydration), Xanthan Gum (thickener), Ceteareth-20 (solubilizing agent), Decyl Glucoside (surfactant), Citric Acid (pH adjuster), Phenoxyethanol (preservative).';
    String guideLine32 = 'Vào ban đêm, sử dụng như bước cuối cùng trong quy trình chăm sóc da của bạn. Sản phẩm này có thể sử dụng vào ban ngày với điều kiện bắt buộc sử dụng cùng kem chống nắng phổ rộng SPF 30 trở lên.';
    List<String> images32 = [];
    images32.add("https://media.hasaki.vn/catalog/product/f/a/facebook-dynamic-kem-duong-paula-s-choice-lam-sang-da-ngua-lao-hoa-50ml_img_800x800_eb97c5_fit_center.jpg");
    images32.add("https://media.hasaki.vn/catalog/product/k/e/kem-duong-paula-s-choice-lam-sang-da-ngua-lao-hoa-50ml_img_800x800_eb97c5_fit_center.jpg");
    images32.add("https://media.hasaki.vn/catalog/product/k/e/kem-duong-paula-s-choice-lam-sang-da-ngua-lao-hoa-50ml-1_img_800x800_eb97c5_fit_center.jpg");
    FirebaseFirestore.instance.collection('Product').doc('372').set({
      'id': 372,
      'name': "Kem Dưỡng Paula’s Choice Làm Sáng Da, Ngừa Lão Hóa 50ml",
      'engName': "Resist Anti-Aging Clear Skin Hydrator",
      'brandID': 53,
      'categoryID': 9,
      'originID': 3,
      'skinID': 1,
      'sessionID': 1,
      'genderID': 1,
      'structureID': 1,
      'soldOut': 2,
      'totalStarRating': 5,
      'totalRating': 1,
      'marketPrice': 1050000,
      'importPrice': 709000,
      'defaultDiscountRate': 25,
      'price': 789000,
      'chemicalComposition': chemicalComposition32,
      'guideLine': guideLine32,
      'image': images32,
      'userFavorite': [],
      'available': 26,
      'searchCount': 0,
      'popularSearchTitle': "Kem Dưỡng Ẩm Paula's Choice"
    });

    String chemicalComposition33 = 'Water (Aqua), Cyclopentasiloxane (texture enhancer/hydration), Octyldodecyl Neopentanoate (texture enhancer), Vinyl Dimethicone/Methicone Silsesquioxane Crosspolymer (texture enhancer/film-forming agent), Glycerin (skin-replenishing), Sodium Ascorbyl Phosphate (vitamin C/antioxidant), Cetyl Alcohol (emollient), Niacinamide (skin-restoring), Dimethicone (hydration), Cetearyl Alcohol (emollient), Butylene Glycol (slip agent/hydration), Glyceryl Stearate (texture enhancer), PEG-100 Stearate (texture enhancer), Adenosine (skin-restoring), Epigallocatechin Gallate (green tea-derived antioxidant), Glucose Oxidase (hydration), Lactoperoxidase (hydration/soothing), Boerhavia Diffusa Root Extract (skin-soothing), Cocos Nucifera (Coconut) Fruit Extract (antioxidant), Lactobacillus (hydration/skin-soothing), Polysilicone-11 (texture enhancer), Sodium Chloride (texture enhancer), Potassium Thiocyanate (hydration), Glucose (hydration), Xanthan Gum (thickener), Ceteareth-20 (solubilizing agent), Decyl Glucoside (surfactant), Citric Acid (pH adjuster), Phenoxyethanol (preservative).';
    String guideLine33 = 'Vào ban đêm, sử dụng như bước cuối cùng trong quy trình chăm sóc da của bạn. Sản phẩm này có thể sử dụng vào ban ngày với điều kiện bắt buộc sử dụng cùng kem chống nắng phổ rộng SPF 30 trở lên.';
    List<String> images33 = [];
    images33.add("https://media.hasaki.vn/catalog/product/f/a/facebook-dynamic-kem-duong-paula-s-choice-lam-sang-da-ngua-lao-hoa-50ml_img_800x800_eb97c5_fit_center.jpg");
    images33.add("https://media.hasaki.vn/catalog/product/k/e/kem-duong-paula-s-choice-lam-sang-da-ngua-lao-hoa-50ml_img_800x800_eb97c5_fit_center.jpg");
    images33.add("https://media.hasaki.vn/catalog/product/k/e/kem-duong-paula-s-choice-lam-sang-da-ngua-lao-hoa-50ml-1_img_800x800_eb97c5_fit_center.jpg");
    FirebaseFirestore.instance.collection('Product').doc('373').set({
      'id': 373,
      'name': "Kem Dưỡng Paula’s Choice Làm Sáng Da, Ngừa Lão Hóa 50ml",
      'engName': "Resist Anti-Aging Clear Skin Hydrator",
      'brandID': 54,
      'categoryID': 9,
      'originID': 3,
      'skinID': 1,
      'sessionID': 1,
      'genderID': 1,
      'structureID': 1,
      'soldOut': 2,
      'totalStarRating': 5,
      'totalRating': 1,
      'marketPrice': 1050000,
      'importPrice': 709000,
      'defaultDiscountRate': 25,
      'price': 789000,
      'chemicalComposition': chemicalComposition33,
      'guideLine': guideLine33,
      'image': images33,
      'userFavorite': [],
      'available': 25,
      'searchCount': 0,
      'popularSearchTitle': "Kem Dưỡng Ẩm Paula's Choice"
    });*/

    //FirebaseFirestore.instance.collection('Product').doc('7').get().then((value) => print(value.get('guideLine')));
    return StreamProvider<MUser_IsNotLogout?>.value(
      initialData: null,
      catchError: (_, err) => null,
      value: AuthenticationServices().user,
      child: MaterialApp(
        home: Wrapper(),
        builder: EasyLoading.init(),
        debugShowCheckedModeBanner: false,
        title: 'Be Beauty App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
      ),
    );
  }
}
