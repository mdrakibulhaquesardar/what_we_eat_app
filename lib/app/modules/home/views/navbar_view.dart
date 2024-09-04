import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:what_we_eat/app/modules/barScan/views/bar_scan_view.dart';
import 'package:what_we_eat/app/modules/profile/views/profile_view.dart';
import 'package:what_we_eat/app/modules/requests/views/requests_view.dart';

import 'home_view.dart';

class Navbar extends StatelessWidget {
  const Navbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      tabs: [
        PersistentTabConfig(
          screen: const HomeView(),
          item: ItemConfig(
            activeColorSecondary: Colors.white,
            activeForegroundColor: Colors.green,
            icon: const Icon(Icons.home),
            title: "Home",
          ),
        ),
        PersistentTabConfig(
          screen: const RequestsView(),

          item: ItemConfig(
            activeColorSecondary: Colors.white,
            activeForegroundColor: Colors.deepPurpleAccent,
            icon: const Icon(Icons.add_box_rounded,color: Colors.white,),
            title: "Add Product",
          ),
        ),
        PersistentTabConfig(
          screen: const ProfileView(),
          item: ItemConfig(
            activeColorSecondary: Colors.white,
            activeForegroundColor: Colors.green,
            icon: const Icon(Icons.person),
            title: "Profile",
          ),
        ),
      ],
      navBarBuilder: (navBarConfig) => Style13BottomNavBar(
        navBarConfig: navBarConfig,
      ),
    );
  }
}