import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adc_nakama/screens/booking_screen.dart';
import 'package:adc_nakama/screens/layanan_screen.dart';
import 'package:adc_nakama/screens/more_screen.dart';
import 'package:adc_nakama/screens/profile_screen.dart';
import 'package:adc_nakama/screens/fasilitas_screen.dart';
import 'package:adc_nakama/screens/event_screen.dart';
import 'package:adc_nakama/screens/partner_detail_screen.dart';
import 'package:adc_nakama/screens/detail_notif_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class FasilitasPage extends StatefulWidget {
  @override
  FasilitasPageState createState() => FasilitasPageState();
}

class EventPage extends StatefulWidget {
  @override
  EventPageState createState() => EventPageState();
}

class PartnerDetailPage extends StatefulWidget {
  @override
  PartnerDetailPageState createState() => PartnerDetailPageState();
}

class DetailNotifPage extends StatefulWidget {
  @override
  DetailNotifPageState createState() => DetailNotifPageState();
}

class FasilitasPageState extends State<FasilitasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FasilitasScreen(),
    );
  }
}

class EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EventScreen(),
    );
  }
}

class PartnerDetailPageState extends State<PartnerDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PartnerDetailScreen(),
    );
  }
}

class DetailNotifPageState extends State<DetailNotifPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DetailNotifScreen(),
    );
  }
}

class _HomePageState extends State<HomePage> {
  int bottomNavBarIndex;
  PageController pageController;

  @override
  void initState() {
    super.initState();
    bottomNavBarIndex = 0;
    pageController = PageController(initialPage: bottomNavBarIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              bottomNavBarIndex = index;
            });
          },
          children: [
            HomeScreen(),
            LayananScreen(),
            BookingScreen(),
            ProfileScreen(),
            MoreScreen(),
          ],
        ),
        bottomNavbar(),
      ],
    );
  }

  Widget bottomNavbar() => Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 60,
        // decoration: BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.grey, spreadRadius: 0, blurRadius: 10, offset: Offset(0, 3)),]),
        child: BottomNavigationBar(
          selectedItemColor: Color(0xFF2962FF),
          unselectedItemColor: Color(0xFFD0D0D0),
          showUnselectedLabels: true,
          currentIndex: bottomNavBarIndex,
          onTap: (index) {
            setState(() {
              bottomNavBarIndex = index;
              pageController.jumpToPage(index);
            });
          },
          items: [
            BottomNavigationBarItem(
              label: "Home",
              icon: (bottomNavBarIndex == 0)
                  ? SvgPicture.asset('assets/icons/home_active.svg')
                  : SvgPicture.asset('assets/icons/home.svg'),
            ),
            BottomNavigationBarItem(
              label: "Layanan",
              icon: (bottomNavBarIndex == 1)
                  ? SvgPicture.asset('assets/icons/medical_active.svg')
                  : SvgPicture.asset('assets/icons/medical.svg'),
            ),
            BottomNavigationBarItem(
              label: "Booking",
              icon: (bottomNavBarIndex == 2)
                  ? SvgPicture.asset('assets/icons/calendar_active.svg')
                  : SvgPicture.asset('assets/icons/calendar.svg'),
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: (bottomNavBarIndex == 3)
                  ? SvgPicture.asset('assets/icons/user_active.svg')
                  : SvgPicture.asset('assets/icons/user.svg'),
            ),
            BottomNavigationBarItem(
              label: "More",
              icon: (bottomNavBarIndex == 4)
                  ? SvgPicture.asset('assets/icons/more_active.svg')
                  : SvgPicture.asset('assets/icons/more.svg'),
            ),
          ],
        ),
      ));
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
