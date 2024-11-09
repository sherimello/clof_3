import 'package:clof_3/pages/custom_list_view.dart';
import 'package:clof_3/pages/form_validation_with_ListView_dot_builder.dart';
import 'package:clof_3/pages/getx_demo.dart';
import 'package:clof_3/pages/stack_with_animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      home: GetxDemo(),
    );
  }
}
