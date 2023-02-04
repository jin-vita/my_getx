import 'package:get/get.dart';

class Person extends GetxController {
  Rx<String> name;
  Rx<int> age;
  Rx<String> mobile;

  Person({
    required this.name,
    required this.age,
    required this.mobile,
  });

  void setData({
    name,
    age,
    mobile,
  }) {
    this.name.value = name;
    this.age.value = age;
    this.mobile.value = mobile;
  }

  void applyData({name, age, mobile}) {
    setData(
      name: name,
      age: age,
      mobile: mobile,
    );
    update();
  }
}
