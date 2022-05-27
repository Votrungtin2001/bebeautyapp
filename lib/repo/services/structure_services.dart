class StructureServices {
  String getStructureName(int structureID) {
    switch (structureID) {
      case 1:
        return "Dạng kem";
      case 2:
        return "Dạng lỏng";
      case 3:
        return "Dạng gel";
      case 4:
        return "Dạng sữa";
      case 5:
        return "Dạng nước";
      case 6:
        return "Dạng giấy";
      case 7:
        return "Dạng serum";
      case 8:
        return "Dạng rắn dẻo";
      case 9:
        return "Dạng tạo bọt sẵn";
      case 10:
        return "Dạng hạt";
      case 11:
        return "Dạng dầu";
      default:
        return "Da rắn";
    }
  }
}