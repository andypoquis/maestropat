import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:maestropat/app/bindings/home_binding.dart';
import 'package:maestropat/app/ui/theme/colors_app.dart';

import 'app/routes/app_pages.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    print('Error al inicializar Firebase: $e');
    // Manejar el error de inicialización de Firebase según sea necesario
  }

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.HOME,
    theme: ThemeData(
        colorScheme: const ColorScheme.light(
            primary: primaryColor,
            onPrimary: primaryColor,
            background: primaryColor,
            primaryContainer: primaryColor),
        primaryColor: primaryColor,
        focusColor: primaryColor,
        primaryColorDark: primaryColor,
        primaryColorLight: primaryColor,
        inputDecorationTheme: const InputDecorationTheme(
          focusColor: primaryColor,
          hoverColor: primaryColor,
          fillColor: primaryColor,
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: primaryColor, width: 0, style: BorderStyle.solid)),
        )),
    defaultTransition: Transition.fade,
    initialBinding: HomeBinding(),
    getPages: AppPages.pages,
  ));
}
