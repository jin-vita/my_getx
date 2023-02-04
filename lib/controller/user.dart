import 'package:get/get.dart';

class User extends GetxController {
  Rx<String> name;
  Rx<int> count;

  User({required this.name, required this.count});

  void setData({name, count}) {
    this.name.value = name;
    this.count.value = count;
  }

  void applyData({name, count}) {
    setData(name: name, count: count);
    update();
  }
}
