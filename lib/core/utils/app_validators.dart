class AppValidators {
  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "This field is required";
    }
    if (!value.contains('@') || !value.endsWith('.com')) {
      return "Enter a valid email for example name@example.com";
    }
    return null;
  }

  static String? phoneValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "This field is required";
    }
    if (!value.startsWith('01')) {
      return "Phone must start with 01";
    }
    if (value.length != 11) {
      return "Phone must be exactly 11 digits";
    }
    return null;
  }

  static String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "This field is required";
    }
    return null;
  }
}
