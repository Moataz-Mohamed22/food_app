abstract class AppRegExp {
  static bool isNameValid(String name) {
    return RegExp(r"^[A-Za-z]{2,}$").hasMatch(name);
  }

  static bool isEmailValid(String email) {
    return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  }

  static bool isPhoneNumberValid(String phoneNumber) {
    return RegExp(r"^(?:\+20|0)?1[0125]\d{8}$").hasMatch(phoneNumber);
  }

  static bool isOTPValid(String otp) {
    return RegExp(r"^[0-9]{6}$").hasMatch(otp);
  }

  static bool isNationalIDValid(String nationalID) {
    return RegExp(r"^[0-9]{10}$").hasMatch(nationalID);
  }

  static bool isCardCVVValid(String cardCVV) {
    return RegExp(r"^[0-9]{3,4}$").hasMatch(cardCVV);
  }

  static bool isPasswordValid(String password) {
    return RegExp(
      r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$",
    ).hasMatch(password);
  }

  static bool hasLowerCase(String password) {
    return password.contains(RegExp(r"[a-z]"));
  }

  static bool hasUpperCase(String password) {
    return password.contains(RegExp(r"[A-Z]"));
  }

  static bool hasNumber(String password) {
    return password.contains(RegExp(r"[0-9]"));
  }

  static bool hasSpecialCharacters(String password) {
    return password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  }

  static bool hasMinLength(String password) {
    return password.length >= 6;
  }
}
