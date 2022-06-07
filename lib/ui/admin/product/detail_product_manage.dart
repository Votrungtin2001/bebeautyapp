import 'dart:io';

import 'package:bebeautyapp/model/MBrand.dart';
import 'package:bebeautyapp/model/MCategory.dart';
import 'package:bebeautyapp/model/MGender.dart';
import 'package:bebeautyapp/model/MOrigin.dart';
import 'package:bebeautyapp/model/MProduct.dart';
import 'package:bebeautyapp/model/MSession.dart';
import 'package:bebeautyapp/model/MSkin.dart';
import 'package:bebeautyapp/model/MStructure.dart';
import 'package:bebeautyapp/repo/providers/brand_provider.dart';
import 'package:bebeautyapp/repo/providers/category_provider.dart';
import 'package:bebeautyapp/repo/providers/origin_provider.dart';
import 'package:bebeautyapp/ui/authenication/register/widgets/custom_rounded_loading_button.dart';

import 'package:bebeautyapp/ui/home/product_details/components/sticky_label.dart';
import 'package:flutter/material.dart';
import 'package:bebeautyapp/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../../repo/services/product_services.dart';

class DetailsProductManageScreen extends StatefulWidget {
  final MProduct products;

  final productServices = ProductServices();

  DetailsProductManageScreen({
    Key? key,
    required this.products,
  }) : super(key: key);
  @override
  _DetailsProductManageScreenState createState() =>
      _DetailsProductManageScreenState();
}

class _DetailsProductManageScreenState
    extends State<DetailsProductManageScreen> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _engNameController = TextEditingController();
  final TextEditingController _guideLineController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _popularSearchTitleController =
      TextEditingController();

  final TextEditingController _marketPriceController = TextEditingController();
  final TextEditingController _importPriceController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _discountRateController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  late int brandId,
      categoryId,
      genderId,
      originId,
      skinId,
      structureId,
      sessionId;
  List<String> imageProduct = [];
  @override
  void initState() {
    super.initState();
    _nameController.text = widget.products.name;
    _nameController.text = widget.products.name;
    _engNameController.text = widget.products.engName;
    _guideLineController.text = widget.products.guideLine;
    _descriptionController.text = widget.products.description;
    _popularSearchTitleController.text = widget.products.popularSearchTitle;
    _marketPriceController.text =
        widget.products.marketPrice.toStringAsFixed(0);
    _importPriceController.text =
        widget.products.importPrice.toStringAsFixed(0);
    _priceController.text = widget.products.price.toStringAsFixed(0);
    _discountRateController.text =
        widget.products.defaultDiscountRate.toStringAsFixed(0);

    _quantityController.text = widget.products.available.toStringAsFixed(0);
    brandId = widget.products.getBrandID();
    categoryId = widget.products.getCategoryID();
    genderId = widget.products.getGenderID();
    originId = widget.products.getOriginID();
    skinId = widget.products.getSkinID();
    structureId = widget.products.getStructureID();
    sessionId = widget.products.getSessionID();
    imageProduct = widget.products.images;
  }

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();

    final editButtonController = RoundedLoadingButtonController();

    final brandProvider = Provider.of<BrandProvider>(context);
    final brands = brandProvider.brands;

    final categoryProvider = Provider.of<CategoryProvider>(context);
    final categories = categoryProvider.categories;

    final originProvider = Provider.of<OriginProvider>(context);
    final origin = originProvider.origins;

    List<MSkin> skins = [
      MSkin(id: 0, name: "Mọi loại da"),
      MSkin(id: 1, name: "Da mụn"),
      MSkin(id: 2, name: "Da dầu"),
      MSkin(id: 3, name: "Da khô"),
      MSkin(id: 4, name: "Da hỗn hợp"),
      MSkin(id: 5, name: "Da nhạy cảm"),
      MSkin(id: 6, name: "Da vùng mắt"),
      MSkin(id: 7, name: "Da sẹo"),
      MSkin(id: 8, name: "Da vùng môi"),
    ];

    List<MSession> session = [
      MSession(id: 0, name: "Ngày và đêm"),
      MSession(id: 1, name: "Ban ngày"),
      MSession(id: 2, name: "Ban đêm"),
    ];

    List<MGender> gender = [
      MGender(id: 0, name: "Dành cho mọi giới tính"),
      MGender(id: 1, name: "Dành cho nữ giới"),
      MGender(id: 2, name: "Dành cho nam tính"),
    ];

    List<MStructure> structure = [
      MStructure(id: 0, name: "Dạng kem"),
      MStructure(id: 1, name: "Dạng lỏng"),
      MStructure(id: 2, name: "Dạng gel"),
      MStructure(id: 3, name: "Dạng sữa"),
      MStructure(id: 4, name: "Dạng nước"),
      MStructure(id: 5, name: "Dạng giấy"),
      MStructure(id: 6, name: "Dạng serum"),
      MStructure(id: 7, name: "Dạng rắn dẻo"),
      MStructure(id: 8, name: "Dạng tạo bọt sẵn"),
      MStructure(id: 9, name: "Dạng hạt"),
      MStructure(id: 10, name: "Dạng dầu"),
      MStructure(id: 11, name: "Dạng rắn")
    ];

    final ImagePicker imagePicker = ImagePicker();
    List<XFile>? imageFileList = [];
    List<dynamic> images = [];
    void selectImages() async {
      final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
      if (selectedImages!.isNotEmpty) {
        imageFileList.addAll(selectedImages);
      }
      setState(() {
        images = imageFileList.map((e) => e.name).toList();
      });
      print("Image List Length:" + imageFileList.length.toString());
      setState(() {});
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(
          color: kPrimaryColor,
        ),
        title: Text('Product'),
        titleTextStyle: const TextStyle(
            color: kPrimaryColor,
            fontSize: 20,
            fontFamily: 'Laila',
            fontWeight: FontWeight.w700),
        centerTitle: true,
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              children: [
                StickyLabel(text: 'Name', textStyle: TextStyle(fontSize: 14)),
                TextFormField(
                  onChanged: (value) {
                    _nameController.text = value;
                  },
                  controller: _nameController,
                  cursorColor: kTextColor,
                  maxLines: 2,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Name is empty';
                    } else
                      return null;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: kPrimaryColor, width: 1),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.red, width: 1),
                    ),
                  ),
                ),
                StickyLabel(
                    text: 'English Name', textStyle: TextStyle(fontSize: 14)),
                TextFormField(
                  onChanged: (value) {
                    _engNameController.text = value;
                  },
                  controller: _engNameController,
                  maxLines: 2,
                  cursorColor: kTextColor,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'English Name is empty';
                    } else
                      return null;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: kPrimaryColor, width: 1),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.red, width: 1),
                    ),
                  ),
                ),
                StickyLabel(
                    text: 'Category', textStyle: TextStyle(fontSize: 14)),
                Padding(
                    padding: EdgeInsets.only(top: 4.0, bottom: 4.0),
                    child: Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: DropdownButton<String>(
                          hint: Text("Select"),
                          dropdownColor: Colors.white,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 36,
                          isExpanded: true,
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 16,
                          ),
                          underline: SizedBox(),
                          value: categoryId.toString(),
                          onChanged: (String? newValue) {
                            setState(() {
                              categoryId = int.parse(newValue.toString());
                            });
                          },
                          items: categories
                              .map<DropdownMenuItem<String>>((MCategory value) {
                            return DropdownMenuItem<String>(
                              value: value.id.toString(),
                              child: Text(value.getName()),
                            );
                          }).toList(),
                        ))),
                StickyLabel(text: 'Brand', textStyle: TextStyle(fontSize: 14)),
                Padding(
                    padding: EdgeInsets.only(top: 4.0, bottom: 4.0),
                    child: Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: DropdownButton<String>(
                          hint: Text("Select"),
                          dropdownColor: Colors.white,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 36,
                          isExpanded: true,
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 16,
                          ),
                          underline: SizedBox(),
                          value: brandId.toString(),
                          onChanged: (String? newValue) {
                            setState(() {
                              brandId = int.parse(newValue.toString());
                            });
                          },
                          items: brands
                              .map<DropdownMenuItem<String>>((MBrand value) {
                            return DropdownMenuItem<String>(
                              value: value.id.toString(),
                              child: Text(value.getName()),
                            );
                          }).toList(),
                        ))),
                StickyLabel(text: 'Origin', textStyle: TextStyle(fontSize: 14)),
                Padding(
                    padding: EdgeInsets.only(top: 4.0, bottom: 4.0),
                    child: Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: DropdownButton<String>(
                          hint: Text("Select"),
                          dropdownColor: Colors.white,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 36,
                          isExpanded: true,
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 16,
                          ),
                          underline: SizedBox(),
                          value: originId.toString(),
                          onChanged: (String? newValue) {
                            setState(() {
                              originId = int.parse(newValue.toString());
                            });
                          },
                          items: origin
                              .map<DropdownMenuItem<String>>((MOrigin value) {
                            return DropdownMenuItem<String>(
                              value: value.id.toString(),
                              child: Text(value.getName()),
                            );
                          }).toList(),
                        ))),
                StickyLabel(text: 'Skin', textStyle: TextStyle(fontSize: 14)),
                Padding(
                    padding: EdgeInsets.only(top: 4.0, bottom: 4.0),
                    child: Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: DropdownButton<String>(
                          hint: Text("Select"),
                          dropdownColor: Colors.white,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 36,
                          isExpanded: true,
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 16,
                          ),
                          underline: SizedBox(),
                          value: skinId.toString(),
                          onChanged: (String? newValue) {
                            setState(() {
                              skinId = int.parse(newValue.toString());
                            });
                          },
                          items: skins
                              .map<DropdownMenuItem<String>>((MSkin value) {
                            return DropdownMenuItem<String>(
                              value: value.id.toString(),
                              child: Text(value.getName()),
                            );
                          }).toList(),
                        ))),
                StickyLabel(
                    text: 'Session', textStyle: TextStyle(fontSize: 14)),
                Padding(
                    padding: EdgeInsets.only(top: 4.0, bottom: 4.0),
                    child: Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: DropdownButton<String>(
                          hint: Text("Select"),
                          dropdownColor: Colors.white,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 36,
                          isExpanded: true,
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 16,
                          ),
                          underline: SizedBox(),
                          value: sessionId.toString(),
                          onChanged: (String? newValue) {
                            setState(() {
                              sessionId = int.parse(newValue.toString());
                            });
                          },
                          items: session
                              .map<DropdownMenuItem<String>>((MSession value) {
                            return DropdownMenuItem<String>(
                              value: value.id.toString(),
                              child: Text(value.getName()),
                            );
                          }).toList(),
                        ))),
                StickyLabel(text: 'Gender', textStyle: TextStyle(fontSize: 14)),
                Padding(
                    padding: EdgeInsets.only(top: 4.0, bottom: 4.0),
                    child: Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: DropdownButton<String>(
                          hint: Text("Select"),
                          dropdownColor: Colors.white,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 36,
                          isExpanded: true,
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 16,
                          ),
                          underline: SizedBox(),
                          value: genderId.toString(),
                          onChanged: (String? newValue) {
                            setState(() {
                              genderId = int.parse(newValue.toString());
                            });
                          },
                          items: gender
                              .map<DropdownMenuItem<String>>((MGender value) {
                            return DropdownMenuItem<String>(
                              value: value.id.toString(),
                              child: Text(value.getName()),
                            );
                          }).toList(),
                        ))),
                StickyLabel(
                    text: 'Structure', textStyle: TextStyle(fontSize: 14)),
                Padding(
                    padding: EdgeInsets.only(top: 4.0, bottom: 4.0),
                    child: Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: DropdownButton<String>(
                          hint: Text("Select"),
                          dropdownColor: Colors.white,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 36,
                          isExpanded: true,
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 16,
                          ),
                          underline: SizedBox(),
                          value: structureId.toString(),
                          onChanged: (String? newValue) {
                            setState(() {
                              structureId = int.parse(newValue.toString());
                            });
                          },
                          items: structure.map<DropdownMenuItem<String>>(
                              (MStructure value) {
                            return DropdownMenuItem<String>(
                              value: value.id.toString(),
                              child: Text(value.getName()),
                            );
                          }).toList(),
                        ))),
                StickyLabel(
                    text: 'Market Price(đ)',
                    textStyle: TextStyle(fontSize: 14)),
                TextFormField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    _marketPriceController.text = value;
                  },
                  controller: _marketPriceController,
                  cursorColor: kTextColor,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Market Price is empty';
                    } else
                      return null;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: kPrimaryColor, width: 1),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.red, width: 1),
                    ),
                  ),
                ),
                StickyLabel(
                    text: 'Discount Rate(%)',
                    textStyle: TextStyle(fontSize: 14)),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      _discountRateController.text = value;
                    });
                  },
                  keyboardType: TextInputType.number,
                  controller: _discountRateController,
                  cursorColor: kTextColor,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Discount Rate is empty';
                    } else
                      return null;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: kPrimaryColor, width: 1),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.red, width: 1),
                    ),
                  ),
                ),
                StickyLabel(
                    text: 'Import Price(đ)',
                    textStyle: TextStyle(fontSize: 14)),
                TextFormField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    _importPriceController.text = value;
                  },
                  controller: _importPriceController,
                  cursorColor: kTextColor,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Import Price is empty';
                    } else
                      return null;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: kPrimaryColor, width: 1),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.red, width: 1),
                    ),
                  ),
                ),
                StickyLabel(
                    text: 'Guideline', textStyle: TextStyle(fontSize: 14)),
                TextFormField(
                  onChanged: (value) {
                    _guideLineController.text = value;
                  },
                  controller: _guideLineController,
                  maxLines: 4,
                  cursorColor: kTextColor,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Guideline is empty';
                    } else
                      return null;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: kPrimaryColor, width: 1),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.red, width: 1),
                    ),
                  ),
                ),
                StickyLabel(
                    text: 'Description', textStyle: TextStyle(fontSize: 14)),
                TextFormField(
                  onChanged: (value) {
                    _descriptionController.text = value;
                  },
                  controller: _descriptionController,
                  maxLines: 8,
                  cursorColor: kTextColor,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Description is empty';
                    } else
                      return null;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: kPrimaryColor, width: 1),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.red, width: 1),
                    ),
                  ),
                ),
                StickyLabel(
                    text: 'Quantity', textStyle: TextStyle(fontSize: 14)),
                TextFormField(
                  onChanged: (value) {
                    _quantityController.text = value;
                  },
                  keyboardType: TextInputType.number,
                  controller: _quantityController,
                  cursorColor: kTextColor,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Available is empty';
                    } else
                      return null;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: kPrimaryColor, width: 1),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.red, width: 1),
                    ),
                  ),
                ),
                StickyLabel(
                    text: 'Popular Search Title',
                    textStyle: TextStyle(fontSize: 14)),
                TextFormField(
                  onChanged: (value) {
                    _popularSearchTitleController.text = value;
                  },
                  controller: _popularSearchTitleController,
                  cursorColor: kTextColor,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Popular Search Title is empty';
                    } else
                      return null;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: kPrimaryColor, width: 1),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.red, width: 1),
                    ),
                  ),
                ),
                MaterialButton(
                  color: kPrimaryColor,
                  onPressed: () {
                    selectImages();
                  },
                  child: Text(
                    'Select Images',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                images.isNotEmpty
                    ? Container(
                        height: 200,
                        child: GridView.count(
                          scrollDirection: Axis.horizontal,
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          children: List.generate(images.length, (index) {
                            return Image.file(
                              File(imageFileList[index].path),
                              fit: BoxFit.cover,
                            );
                          }),
                        ),
                      )
                    : Container(
                        height: 200,
                        child: GridView.count(
                          scrollDirection: Axis.horizontal,
                          crossAxisCount: 2,
                          crossAxisSpacing: 0,
                          children: List.generate(imageProduct.length, (index) {
                            return Image.network(
                              imageProduct[index],
                              fit: BoxFit.cover,
                            );
                          }),
                        )),
                CustomRoundedLoadingButton(
                  text: 'Save',
                  controller: editButtonController,
                  onPress: () {},
                ),
                SizedBox(
                  height: 16.0,
                )
              ],
            ),
          )),
    );
  }
}
