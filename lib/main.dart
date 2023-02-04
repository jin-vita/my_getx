import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_getx/controller/user.dart';

import 'controller/person.dart';

void main() {
  _initController();
  _initController2();
  runApp(const MyApp());
}

void _initController() {
  Get.put(User(name: '미정'.obs, count: 0.obs));
}

void _initController2() {
  Get.put(Person(name: '미정'.obs, age: 0.obs, mobile: '010-0000-0000'.obs));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: MyHomePage(title: '내가 만든 앱'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final nameInput = TextEditingController();
  final ageInput = TextEditingController();
  final mobileInput = TextEditingController();
  User user = Get.find();
  void changeName(String name) {
    var count = user.count.value + 1;
    user.applyData(name: name, count: count);
  }

  Person person = Get.find();
  void changePerson() {
    person.applyData(
      name: nameInput.text,
      age: int.parse(ageInput.text),
      mobile: mobileInput.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.yellow,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Obx(
                () => Text(
                  '이름 : ${user.name.value}\n클릭 수 : ${user.count.value}',
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: ElevatedButton.icon(
                icon: const Icon(
                  Icons.add,
                  size: 18,
                ),
                label: const Text('확인'),
                onPressed: () {
                  changeName('홍길동');
                },
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Obx(
                () => Text(
                  '이름 : ${person.name.value}, 나이 : ${person.age.value}\n${person.mobile.value}',
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            Container(
              width: 200,
              alignment: Alignment.centerLeft,
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '이름',
                ),
                controller: nameInput..text = '${person.name}',
              ),
            ),
            Container(
              width: 200,
              alignment: Alignment.centerLeft,
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '나이',
                ),
                controller: ageInput..text = '${person.age}',
              ),
            ),
            Container(
              width: 200,
              alignment: Alignment.centerLeft,
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '전화번호',
                ),
                controller: mobileInput..text = '${person.mobile}',
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: ElevatedButton.icon(
                icon: const Icon(
                  Icons.add,
                  size: 18,
                ),
                label: const Text('확인'),
                onPressed: changePerson,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
