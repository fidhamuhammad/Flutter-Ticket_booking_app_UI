import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AppLayout {
  static getSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }
  static getScreenHeight(){
    assert(Get.context != null, "Get.context is null. Ensure GetX is properly initialized.");
    return Get.height;
  }
  static getScreenWidth(){
    assert(Get.context != null, "Get.context is null. Ensure GetX is properly initialized.");
    return Get.width;
  }
  static getHeight(double pixels){   /* This is a static method named getHeight that takes a double parameter named pixels. pixel parameter here used to pass the number as we need*/
    double x = getScreenHeight() / pixels;  /* the method calls getScreenHeight(), which is presumably a function that returns the height of the screen in pixels.
     It then divides this screen height by the pixels parameter and stores the result in a variable named x.
     getScreenHeight is to get the screen proportion */
    return getScreenHeight() / x; /*  the method divides the screen height by the value of x (calculated in the previous step) and returns this value. */
  }
  static getWidth(double pixels){
    double x = getScreenWidth() / pixels;
    return getScreenWidth() / x;
  }
}

/* getX is an extra-light powerful solution for flutter
   it combines high perfomance state management and intellectual dependencu injection and route management quickly and practically
   GetX has 3 basic principles. This means that these are the priority for all resources in the library: PRODUCTIVITY, PERFORMANCE AND ORGANIZATION. */