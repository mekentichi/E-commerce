import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "username not valide";
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "email not valide";
    }
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "phone not valide";
    }
  }
  if (val.isEmpty) {
    return " can't be Empty";
  }
  if (val.length < min) {
    return " can't be less than $min";
  }
  if (val.length > max) {
    return " can't be larger than $max";
  }
}
