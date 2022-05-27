class GenderServices {
  String getGender(int genderID) {
    switch (genderID) {
      case 1:
        return "Dành cho mọi giới tính";
      case 2:
        return "Dành cho nữ giới";
      default:
        return "Dành cho nam giới";
    }
  }
}