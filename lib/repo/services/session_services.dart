class SessionServices {
  String getSession(int sessionID) {
    switch (sessionID) {
      case 1:
        return "Ngày và đêm";
      case 2:
        return "Ban ngày";
      default:
        return "Ban đêm";
    }
  }
}