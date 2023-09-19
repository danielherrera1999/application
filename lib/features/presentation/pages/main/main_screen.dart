// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, missing_required_param, avoid_print, dead_code, avoid_unnecessary_containers

import 'dart:async';


import 'package:application/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../size_config.dart';
import '../../cubit/user/auth/auth_cubit.dart';


class MainScreen extends StatefulWidget {
  final String uid;

  const MainScreen({Key? key, required this.uid}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int _currentIndex = 0;

  late PageController pageController;

  // static const List<Widget> _widgetOptions = <Widget>[
  //   HomeScreen(),
  //   MapsScreen(),
  //   HomeScreen(),
  //   MenuScreen(currentUser: currentUser),
  // ];

  bool _isLoading = true;

  @override
  void initState() {
    pageController = PageController();
    // 1. Using Timer
    // Timer(Duration(milliseconds: 1000), () {
    //   setState(() {
    //     BlocProvider.of<GetSingleUserCubit>(context).getSingleUser(uid: widget.uid);
    //     _isLoading = false;
    //   });
    // });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void navigationTapped(int index) {
    pageController.jumpToPage(index);
  }

  void onPageChanged(int index) {
    setState(() {
      print(index);
      _currentIndex = index;
    });
  }


  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
                    // bottomNavigationBar: !_isLoading ? Container(
                    //   color: Palette.backgroundColor,
                    //   child: Padding(
                    //     padding: const EdgeInsets.symmetric(
                    //         horizontal: 15.0, vertical: 5),
                    //     child: GNav(
                    //       backgroundColor: Palette.backgroundColor,
                    //       color: Colors.white,
                    //       activeColor: Colors.white,
                    //       tabBackgroundColor: Colors.grey.shade800,
                    //       gap: 10,
                    //       padding: EdgeInsets.all(16),
                    //       tabs: [
                    //         GButton(
                    //           icon: Icons.home_outlined,
                    //           text: 'Inicio',
                    //         ),
                    //         GButton(
                    //           icon: Icons.map,
                    //           text: 'Rutas',
                    //         ),
                    //         GButton(
                    //           icon: Icons.directions_bus,
                    //           text: 'Rutas',
                    //         ),
                    //         GButton(
                    //           icon: Icons.menu,
                    //           text: 'Menu',
                    //         ),
                    //       ],
                    //       selectedIndex: _currentIndex,
                    //       onTabChange: (index) {
                    //         setState(() {
                    //           _currentIndex = index;
                    //         });
                    //       },
                    //     ),
                    //   ),
                    // ): null,
                    // body: !_isLoading ? <Widget>[
                    //   HomeScreen(),
                    //   MapsScreen(),
                    //   RoutesScreen(),
                    //   MenuScreen(currentUser: currentUser),
                    // ].elementAt(_currentIndex) : null,
                    body: Center(
                      child: Text('FUNCIONA'),
                    )
                  );
          // return Scaffold(
          //   bottomNavigationBar: CupertinoTabBar(
          //     backgroundColor: Palette.backgroundColor,
          //     items: [
          //       BottomNavigationBarItem(icon: Icon(Icons.home_outlined, color: Colors.white), label: ""),
          //       BottomNavigationBarItem(icon: Icon(Icons.map_outlined, color: Colors.white), label: ""),
          //       BottomNavigationBarItem(icon: Icon(Icons.favorite_outline, color: Colors.white), label: ""),
          //       BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined, color: Colors.white), label: ""),

          //     ],
          //     onTap: navigationTapped,
          //   ),
          //   body: PageView(
          //     controller: pageController,
          //     children: [
          //       HomeScreen(),
          //       MapsScreen(),
          //       HomeScreen(),
          //       HomeScreen(),
          //       // SearchPage(),
          //       // UploadPostPage(),
          //       // ActivityPage(),
          //       // ProfilePage(currentUser: currentUser,)
          //     ],
          //     onPageChanged: onPageChanged,
          //   ),
          // );
  }
}