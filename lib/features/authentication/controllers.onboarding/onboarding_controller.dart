import 'package:ecommerce_using_flutter/features/authentication/screens/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  /// variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  /// update current index when page scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  /// jump to specific dot selected page
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  /// update current index and jump to next page
  void nextPage() {
    if (currentPageIndex.value != 3) {
      currentPageIndex.value++;
      pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    } else {
      Get.offAll(() => const LoginScreen());
    }

    // if (currentPageIndex.value == 3) {
    //   Get.off(() => const LoginScreen());
    // } else {
    //   int page = currentPageIndex.value + 1;
    //   pageController.jumpToPage(page);
    //
    //   // pageController.jumpToPage(currentPageIndex.value++);
    // }
  }

  /// update current index and jump to the last page
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
