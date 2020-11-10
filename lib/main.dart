import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:adc_nakama/screens/booking_screen.dart';
import 'package:adc_nakama/screens/layanan_screen.dart';
import 'package:adc_nakama/screens/more_screen.dart';
import 'package:adc_nakama/screens/profile_screen.dart';
import 'package:adc_nakama/screens/fasilitas_screen.dart';
import 'package:adc_nakama/screens/event_screen.dart';
import 'package:adc_nakama/screens/partner_detail_screen.dart';
import 'package:adc_nakama/screens/detail_notif_screen.dart';
import 'package:adc_nakama/screens/tentang_kami_screen.dart';
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
