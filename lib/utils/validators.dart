class Validators {
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return "Name cannot be empty";
    }
    return null;
  }

  static String? validateIpAddress(String? value) {
    final ipPattern =
        r'^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$';
    final regExp = RegExp(ipPattern);
    if (value == null || !regExp.hasMatch(value)) {
      return "Invalid IP Address";
    }
    return null;
  }
}
