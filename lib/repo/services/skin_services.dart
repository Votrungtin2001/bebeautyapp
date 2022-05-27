class SkinServices {
  String getSkinName(int skinID) {
    switch (skinID) {
      case 1:
        return "Mọi loại da";
      case 2:
        return "Da mụn";
      case 3:
        return "Da dầu";
      case 4:
        return "Da khô";
      case 5:
        return "Da hỗn hợp";
      case 6:
        return "Da nhạy cảm";
      case 7:
        return "Da vùng mắt";
      case 8:
        return "Da sẹo";
      default:
        return "Da vùng môi";
    }
  }
}