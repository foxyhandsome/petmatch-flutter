import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:petmatch/JIB_USER/home.dart';
import 'package:petmatch/JIB_USER/loginjib.dart';
import 'package:petmatch/JIB_USER/profiledog.dart';
import 'package:petmatch/JIB_USER/profileuser.dart';

class NavigationMenuBar extends StatefulWidget {
  final String? selectPage;
  const NavigationMenuBar({Key? key, this.selectPage}) : super(key: key);

  @override
  State<NavigationMenuBar> createState() => _NavigationMenuBarState();
}

class _NavigationMenuBarState extends State<NavigationMenuBar> {
  PersistentTabController? _controller =
      PersistentTabController(initialIndex: 0);

  @override
  void initState() {
    super.initState();
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        inactiveColorSecondary: CupertinoColors.black,
        icon: Icon(CupertinoIcons.home),
        title: ("หน้าหลัก"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.blue,
      ),
      PersistentBottomNavBarItem(
          inactiveColorSecondary: CupertinoColors.black,
          icon: Icon(CupertinoIcons.news),
          title: ("ข่าวสาร"),
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.blue,),
      PersistentBottomNavBarItem(
          inactiveColorSecondary: CupertinoColors.black,
          icon: Icon(CupertinoIcons.settings_solid),
          title: ("ตั้งค่า"),
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.blue,),
    ];
  }

  List<Widget> _buildScreens() {
    return [home(), home(), home()];
  }
@override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      hideNavigationBar: false,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.bottomRight,
            colors: [Colors.white, Colors.white],
          )),

      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.once,
      itemAnimationProperties: ItemAnimationProperties(
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 250),
      ),
      navBarStyle:
          NavBarStyle.style3, // Choose the nav bar style with this property.
    );
  }
}