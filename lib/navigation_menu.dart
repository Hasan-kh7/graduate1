import 'package:e_comm/features/shop/screens/home/home.dart';
import 'package:e_comm/features/shop/screens/store/store.dart';
import 'package:e_comm/utils/constants/colors.dart';
import 'package:e_comm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'features/personalization/screens/settings/settings.dart';
import 'features/shop/screens/wishlist/wishlist.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
        bottomNavigationBar: Obx(
      () => NavigationBar(
        height: 70,
        elevation: 0,
        selectedIndex: controller.selectedIndex.value,
        onDestinationSelected: (index) =>
            controller.selectedIndex.value = index,
        backgroundColor: dark ? TColors.black : TColors.white,
        indicatorColor: dark
            ? TColors.white.withOpacity(0.1)
            : TColors.black.withOpacity(0.1),
        destinations: const [
          NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
          NavigationDestination(icon: Icon(Iconsax.shop), label: 'Shop'),
          NavigationDestination(icon: Icon(Iconsax.heart), label: 'Wishlist'),
          NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
        ],
      ),
    ) ,
    body: Obx( () =>controller.screens[controller.selectedIndex.value],));
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    const HomeScreen(),
   const Store(),
    const FavouriteScreen(),
    const SettingsScreen(),
  ];
}
