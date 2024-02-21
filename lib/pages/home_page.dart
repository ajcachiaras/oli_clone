import 'package:flutter/material.dart';
import 'package:noli/components/AddButton.dart';
import 'package:noli/components/BottomNavBar.dart';
import 'package:noli/pages/check_in_page.dart';
import 'package:noli/pages/oli_page.dart';
import 'package:noli/pages/user_page.dart';

import '../components/UserInfo.dart';
import 'moment_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int _selectedBarIndex = 0;

  AnimationController? animationController;
  List animation = [];
  List icons = [Icons.home, Icons.settings, Icons.location_city];
  // AddButton checkInButton = AddButton(title: 'Check In', page: CheckInPage());
  // var momentButton = AddButton(title: 'Moment', page: MomentPage());

  // List buttons = [
  //   AddButton(
  //       title: 'Check In',
  //       page: CheckInPage(),
  //   ),
  //   AddButton(title: 'Moment', page: MomentPage())
  // ];
  OverlayEntry? overlayEntry;
  GlobalKey globalKey = GlobalKey();

  void navigateBottomBar(int index) {
    setState(() {
      _selectedBarIndex = index;
    });
  }

  final List<Widget> _pages = [const NoliPage(), const UserPage()];

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    for (int i = 2; i > 0; i--) {
      animation.add(Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: animationController!,
          curve: Interval(0.2 * i, 1.0, curve: Curves.ease))));
    }
  }

  _showOverlay() async {
    List buttons = [
      AddButton(
        title: 'Check In',
        onPressed: () async {
          // print('running func');
          animationController!.reverse();
          overlayEntry!.remove();
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CheckInPage()));
        },
      ),
      AddButton(
        title: 'Moment',
        onPressed: () async {
          animationController!.reverse();
          overlayEntry!.remove();
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MomentPage()));
        },
      )
    ];

    RenderBox? renderBox =
        globalKey.currentContext!.findRenderObject() as RenderBox?;
    Offset offset = renderBox!.localToGlobal(Offset.zero);

    OverlayState? overlayState = Overlay.of(context);
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        // left: offset.dx/2.5,
        left: 0,
        right: 0,
        bottom: 0, //renderBox.size.height + 16,
        child: GestureDetector(
          onTap: () async {
            await animationController!.reverse();
            overlayEntry!.remove();
          },
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.black.withOpacity(.25),
            child: Stack(children: [
              Positioned(
                left: 0,
                right: 0,
                bottom: renderBox.size.height + 16,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int i = 0; i < animation.length; i++)
                      ScaleTransition(scale: animation[i], child: buttons[i]),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );

    animationController!.addListener(() {
      overlayState!.setState(() {});
    });
    animationController!.forward();
    overlayState!.insert(overlayEntry!);

    // await Future.delayed(const Duration(seconds: 5))
    //   .whenComplete(() => animationController!.reverse())
    //   .whenComplete(() => overlayEntry!.remove());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          key: globalKey,
          backgroundColor: Colors.cyan[300],
          shape: CircleBorder(),
          child: Icon(Icons.add),
          onPressed: _showOverlay,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavBar(
          onTabChange: (index) => navigateBottomBar(index),
        ),
        body: _pages[_selectedBarIndex]);
  }
}
