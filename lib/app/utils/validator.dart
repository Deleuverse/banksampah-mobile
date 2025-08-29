/// validate the email format
bool validateEmail(String email) {
  final RegExp regex = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
  return regex.hasMatch(email);
}

/// validate the password format with these requirement:
///
/// Minimum 1 Upper case
///
/// Minimum 1 lowercase
///
/// Minimum 1 Numeric Number
///
/// Minimum 1 Special Character
///
/// Common Allow Character ( ! @ # $ & * ~ )
bool validatePassword(String password) {
  final RegExp regex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  return regex.hasMatch(password);
}
