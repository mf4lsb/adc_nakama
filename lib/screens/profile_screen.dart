import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smkdev_nakama/color_palette.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with SingleTickerProviderStateMixin{

  TabController _tabController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, initialIndex: 0, length: 2);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: blueTitleDoktor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Padding(
            padding: const EdgeInsets.only(left: 15, top: 16),
            child: Text(
              "Profile",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: blueTitleDoktor,
            ),
            Positioned(
              top: 84,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 66,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Irfan Trianto"),
                        Text("Laki - Laki"),
                        Text("0895351577557"),
                      ],
                    ),
                    Container(
                      height: 45,
                      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(7), color: greyButtonDoktor,),
                      child: Row(children: [
                        Expanded(
                          flex: 5,
                          child: ButtonTheme(
                            height: 40,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                            child: FlatButton(
                              color: _getBackgroundColor(0),
                              onPressed: () {
                                setState(() {
                                  _tabController.animateTo(0);
                                  _currentIndex = 0;
                                });
                              },
                              child: Text("Notifikasi"),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: ButtonTheme(
                            height: 40,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                            child: FlatButton(
                              color: _getBackgroundColor(1),
                              onPressed: () {
                                setState(() {
                                  _tabController.animateTo(1);
                                  _currentIndex = 1;
                                });
                              },
                              child: Text("Notifikasi"),
                            ),
                          ),
                        ),
                      ]),
                    ),
                    Flexible(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          ListView.builder(
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: blueTitleDoktor.withOpacity(0.1)),
                                      width: 48,
                                      height: 48,
                                    ),
                                    SizedBox(width: 12,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Waktunya Kontrol Nih"),
                                        Text("Ingat Jadwal kontrol rutin mingguan anda dengan dr. Sandy Sucipto hari selasa", overflow: TextOverflow.ellipsis,),
                                        SizedBox(height: 6,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("2 jam yang lalu"),
                                            Text("New")
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                )
                              );
                            },
                          ),
                          ListView.builder(
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Text("Page 2 - $index");
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 34,
              left: 130,
              right: 130,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  'https://images.unsplash.com/photo-1574168849546-427632ef799e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                ),
              ),
            ),
            Positioned(
              top: 100,
              right: 20,
              child: SvgPicture.asset(
                "assets/icons/more-horizontal.svg",
                width: 24,
                height: 24,
                fit: BoxFit.cover,
              ),
            )
          ],
        ));
  }

  _getBackgroundColor(int index) {
    if(index == _currentIndex) {
      return Colors.white;
    } else {
      return greyButtonDoktor;
    }
  }
}


// ClipRRect(
//               borderRadius: BorderRadius.circular(20),
//               child: Image.network(
//             'https://images.unsplash.com/photo-1574168849546-427632ef799e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',
//             fit: BoxFit.cover,
//             width: 100,
//             height: 100,
//               ),
//             ))
