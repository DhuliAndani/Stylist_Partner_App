import 'package:app/models/businessLayer/baseRoute.dart';
import 'package:app/screens/appointmentHistoryScreen.dart';
import 'package:app/screens/homeScreen.dart';
import 'package:app/screens/profileScreen.dart';
import 'package:app/screens/requestScreen.dart';
import 'package:app/widgets/drawerWidget.dart';
import 'package:flutter/material.dart';
import 'package:app/models/businessLayer/global.dart' as global;
// import 'package:rolling_nav_bar/rolling_nav_bar.dart';

class BottomNavigationWidget extends BaseRoute {
  final int screenId;
  BottomNavigationWidget({a, o, this.screenId})
      : super(a: a, o: o, r: 'BottomNavigationWidget');
  @override
  _BottomNavigationWidgetState createState() =>
      new _BottomNavigationWidgetState(screenId: screenId);
}

class _BottomNavigationWidgetState extends BaseRouteState {
  int screenId = 0;
  int _currentIndex = 0;
  int locationIndex = 0;
  int selectedIndex = 0;

  _BottomNavigationWidgetState({this.screenId}) : super();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _currentIndex = screenId != null ? screenId : 0;
    if (screenId != null && screenId == 1) {
      locationIndex = screenId;
      screenId = 0;
    }
  }

  // PageController _myPage = PageController(initialPage: 0);
  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return null;
      },
      child: sc(
        Scaffold(
          resizeToAvoidBottomInset: false,
          key: _scaffoldState,
          bottomNavigationBar: BottomAppBar(
              color: Colors.transparent,
              notchMargin: 2,
              shape: CircularNotchedRectangle(),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)),
                child: SizedBox(
                  height: 58,
                  child: BottomNavigationBar(
                    selectedItemColor: Color(0xFFFA692C),
                    unselectedItemColor: Colors.grey.shade600,
                    backgroundColor: Color(0xFF171D2C),

                    type: BottomNavigationBarType.fixed,
                    currentIndex: _currentIndex,
                    unselectedFontSize: 0,
                    selectedFontSize: 0,
                    onTap: (index) {
                      _currentIndex = index;
                      locationIndex = 0;
                      setState(() {});
                    },
                    // onItemTap,
                    items: [
                      BottomNavigationBarItem(
                        label: '',
                        icon: Icon(Icons.home, size: 30),
                        tooltip: 'Home',
                      ),
                      BottomNavigationBarItem(
                          label: '',
                          tooltip: 'Location',
                          icon: Padding(
                            padding: global.isRTL
                                ? EdgeInsets.only(left: 15)
                                : EdgeInsets.only(right: 15),
                            child: Icon(Icons.message_outlined, size: 30),
                          )),
                      BottomNavigationBarItem(
                          label: '',
                          tooltip: 'Favourite',
                          icon: Padding(
                            padding: global.isRTL
                                ? EdgeInsets.only(right: 15)
                                : EdgeInsets.only(left: 15),
                            child: Icon(Icons.menu_book_outlined, size: 30),
                          )),
                      BottomNavigationBarItem(
                          label: '',
                          icon: Icon(Icons.person, size: 30),
                          tooltip: 'Profile')
                    ],
                  ),
                ),
              )),
          drawer: _currentIndex == _currentIndex /* 0 */
              ? DrawerWidget(
                  a: widget.analytics,
                  o: widget.observer,
                )
              : null,
          body: Stack(
            children: [
              _children().elementAt(_currentIndex),
              Positioned(
                left: 15,
                top: 20,
                // right: 0,
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor,
                  radius: 23,
                  child: IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: Colors.black,
                      size: 18,
                    ),
                    onPressed: () {
                      _scaffoldState.currentState.openDrawer();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool isloading = true;
  onItemTap(int index) {
    _currentIndex != index;
    setState(() {});
  }

  List<Widget> _children() => [
        HomeScreen(a: widget.analytics, o: widget.observer),
        RequestScreen(a: widget.analytics, o: widget.observer),
        AppointmentHistoryScreen(a: widget.analytics, o: widget.observer),
        ProfileScreen(a: widget.analytics, o: widget.observer)
      ];
}
