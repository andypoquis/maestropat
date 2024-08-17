import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:maestropat/app/ui/theme/colors_app.dart';
import '../../../controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          toolbarHeight: 100,
          title: Column(
            children: [
              const Text(
                'Maestro PAT',
                style: TextStyle(
                    color: primaryColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Calculator',
                style: TextStyle(color: primaryColor.shade100),
              ),
            ],
          )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () => print('Hola'),
        child: Icon(
          LineIcons.whatSApp,
          color: Colors.white.withOpacity(0.85),
        ),
      ),
      body: SafeArea(
          child: GridView.count(
        padding: const EdgeInsets.all(15),
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        children: List.generate(
            controller.itemsMenu.length,
            (index) => Obx(() => GestureDetector(
                  onTap: () {
                    controller.changeWidth(index);
                  },
                  child: AnimatedContainer(
                      width: controller.containerWidth.value,
                      duration: const Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        gradient:
                            controller.selectedGridItemIndex.value == index
                                ? const LinearGradient(colors: [
                                    primaryColor,
                                    Color.fromARGB(255, 159, 78, 194),
                                    Color.fromARGB(255, 179, 98, 214),
                                    Color.fromARGB(255, 199, 118, 234),
                                    Color.fromARGB(255, 219, 138, 254),
                                    Color.fromARGB(255, 239, 158, 255),
                                  ])
                                : const LinearGradient(
                                    colors: [Colors.white, Colors.white]),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color:
                                controller.selectedGridItemIndex.value == index
                                    ? primaryColor.withOpacity(0.5)
                                    : Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: const Offset(
                                0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          /*Image.network(
                            controller.itemsMenu[index]['image'],
                            height: 100,
                          ),*/
                          Icon(
                            LineIcons.hammer,
                            size: 65,
                            color:
                                controller.selectedGridItemIndex.value == index
                                    ? primaryColor.shade100
                                    : Colors.black87,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Center(
                              child: Text(
                            controller.itemsMenu[index]['title'],
                            style: TextStyle(
                                color: controller.selectedGridItemIndex.value ==
                                        index
                                    ? Colors.white
                                    : Colors.black54),
                            textAlign: TextAlign.center,
                          )),
                        ],
                      )),
                ))),
      )),
    );
  }
}
