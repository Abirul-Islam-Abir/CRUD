import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

void displaySuccessMotionToast(context, {desc}) {
  MotionToast toast = MotionToast.success(
    title: const Text(
      "Success",
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    description: Text(
      desc,
      style: const TextStyle(fontSize: 12),
    ),
    layoutOrientation: ToastOrientation.rtl,
    animationType: AnimationType.fromRight,
    dismissable: true,
  );
  toast.show(context);
  Future.delayed(const Duration(seconds: 4)).then((value) {
    toast.dismiss();
  });
}

void displayWarningMotionToast(context) {
  MotionToast.warning(
    title: const Text(
      'Warning Motion Toast',
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    description: const Text('This is a Warning'),
    animationCurve: Curves.bounceIn,
    borderRadius: 0,
    animationDuration: const Duration(milliseconds: 1000),
  ).show(context);
}

void displayErrorMotionToast(context) {
  MotionToast.error(
    title: const Text(
      'Error!',
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    description: const Text('Something went wrong'),
    position: MotionToastPosition.top,
    barrierColor: Colors.black.withOpacity(0.3),
    width: 300,
    height: 80,
    dismissable: false,
  ).show(context);
}

void displayInfoMotionToast(context) {
  MotionToast.info(
    title: const Text(
      'Info Motion Toast',
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    position: MotionToastPosition.center,
    description: const Text('Example of Info Toast'),
  ).show(context);
}

void displayDeleteMotionToast(context) {
  MotionToast.delete(
    title: const Text(
      'Deleted',
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    description: const Text('The item is deleted'),
    animationType: AnimationType.fromTop,
    position: MotionToastPosition.top,
  ).show(context);
}

void displayResponsiveMotionToast(context) {
  MotionToast(
    icon: Icons.rocket_launch,
    primaryColor: Colors.purple,
    title: const Text(
      'Custom Toast',
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    description: const Text(
      'Hello my name is Flutter dev',
    ),
  ).show(context);
}

void displayCustomMotionToast(context) {
  MotionToast(
    primaryColor: Colors.pink,
    title: const Text(
      'Bugatti',
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    dismissable: false,
    description: const Text(
      'Automobiles Ettore Bugatti was a German then French manufacturer of high-performance automobiles. The company was founded in 1909 in the then-German city of Molsheim, Alsace, by the Italian-born industrial designer Ettore Bugatti. ',
    ),
  ).show(context);
}

void displayMotionToastWithoutSideBar(context) {
  MotionToast(
    icon: Icons.zoom_out,
    primaryColor: Colors.orange[500]!,
    secondaryColor: Colors.grey,
    backgroundType: BackgroundType.solid,
    title: const Text('Two Color Motion Toast'),
    description: const Text('Another motion toast example'),
    displayBorder: true,
    displaySideBar: false,
  ).show(context);
}

void displayMotionToastWithBorder(context) {
  MotionToast(
    icon: Icons.zoom_out,
    primaryColor: Colors.deepOrange,
    title: const Text('Top Motion Toast'),
    description: const Text('Another motion toast example'),
    position: MotionToastPosition.top,
    animationType: AnimationType.fromTop,
    displayBorder: true,
    width: 350,
    height: 100,
    padding: const EdgeInsets.only(
      top: 30,
    ),
  ).show(context);
}

void displayTwoColorsMotionToast(context) {
  MotionToast(
    icon: Icons.zoom_out,
    primaryColor: Colors.orange[500]!,
    secondaryColor: Colors.grey,
    backgroundType: BackgroundType.solid,
    title: const Text(
      'Two Color Motion Toast',
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    description: const Text('Another motion toast example'),
    position: MotionToastPosition.top,
    animationType: AnimationType.fromTop,
    width: 350,
    height: 100,
  ).show(context);
}

void displayTransparentMotionToast(context) {
  MotionToast(
    icon: Icons.zoom_out,
    primaryColor: Colors.grey[400]!,
    secondaryColor: Colors.yellow,
    backgroundType: BackgroundType.transparent,
    title: const Text(
      'Two Color Motion Toast',
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    description: const Text('Another motion toast example'),
    position: MotionToastPosition.center,
    width: 350,
    height: 100,
  ).show(context);
}

void displaySimultaneouslyToasts(context) {
  MotionToast.warning(
    title: const Text(
      'Warning Motion Toast',
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    description: const Text('This is a Warning'),
    animationCurve: Curves.bounceIn,
    borderRadius: 0,
    animationDuration: const Duration(milliseconds: 1000),
  ).show(context);

  MotionToast.error(
    title: const Text(
      'Error',
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    description: const Text('Please enter your name'),
    animationType: AnimationType.fromLeft,
    position: MotionToastPosition.top,
    width: 300,
    height: 80,
  ).show(context);
}
