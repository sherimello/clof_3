import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

class GetxDemo extends StatelessWidget {
  const GetxDemo({super.key});

  @override
  Widget build(BuildContext context) {
    RxInt counter = 0.obs;
    RxBool isDark = false.obs;
    var size = Get.size;

    return Obx(() => Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              counter.value = counter.value + 1;
            },
            backgroundColor: CupertinoColors.systemIndigo,
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          appBar: AppBar(
            backgroundColor: CupertinoColors.systemIndigo,
            title: Text(
              "Custom ListView Example",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: size.width * .055),
            ),
          ),
          body: SizedBox(
            width: size.width,
            height: size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  counter.value.toString(),
                  style: const TextStyle(fontSize: 31),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.snackbar(
                      "Snack Bar",
                      "this is a snack bar demo.",
                      backgroundColor: Colors.pink,
                      colorText: Colors.white,
                      snackPosition: SnackPosition.BOTTOM,
                      margin: EdgeInsets.all(17),
                      padding: EdgeInsets.all(17)
                    );
                  },
                  child: Text("show snackbar"),
                ),
                ElevatedButton(onPressed: () {
                  Get.bottomSheet(
                    Padding(
                      padding: const EdgeInsets.all(17.0),
                      child: Container(
                        width: size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          color: Colors.white
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 5.5, horizontal: 17),
                              child: GestureDetector(
                                onTap: () {
                                  Get.changeTheme(ThemeData.light());
                                  Get.changeThemeMode(ThemeMode.light);
                                  isDark.value = false;
                                },
                                child: Text("Light Mode",
                                  style: TextStyle(
                                      fontSize: 21
                                  ),),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 5.5, horizontal: 17),
                              child: GestureDetector(
                                onTap: () {
                                  Get.changeTheme(ThemeData.dark());
                                  Get.changeThemeMode(ThemeMode.dark);
                                  isDark.value = true;
                                },
                                child: Obx(() => Text("Dark Mode",
                                  style: TextStyle(
                                      color: isDark.value ? Colors.red : Colors.black,
                                      fontSize: 21
                                  ),
                                )),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  );
                },
                child: Text("show bottom sheet"),
                ),
                ElevatedButton(onPressed: () {
                  Get.defaultDialog(
                    title: "Title",
                    content: Text("demo dialog box")
                  );
                },
                child: Text("show dialog"),
                )
              ],
            ),
          ),
        ));
  }
}
