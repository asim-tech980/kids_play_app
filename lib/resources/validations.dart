class AppValidator {
  static String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return "Please enter email";
    }
    if (!RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    ).hasMatch(value)) {
      return "Please enter valid email";
    }
    return null;
  }

  static String? validateEmpty(String? value) {
    if (value!.trim().isEmpty) {
      return "Please enter value";
    }
    return null;
  }
}
