import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselHome extends StatefulWidget {
  @override
  _CarouselHomeState createState() => _CarouselHomeState();
}

class _CarouselHomeState extends State<CarouselHome> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    List<int> list = [1, 2, 3, 4, 5];
    return Stack(
      children: [
        Container(
            child: CarouselSlider(
          options: CarouselOptions(onPageChanged: (index, reason) {
            setState(() {
              _current = index;
            });
          }),
          items: list
              .map((item) => Container(
                    child: Center(child: Text(item.toString())),
                    color: Colors.green,
                  ))
              .toList(),
        )),
        Positioned(
          left: 20,
          bottom: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: list.map((url) {
              int index = list.indexOf(url);
              return (_current == index)
                  ? Container(
                      width: 25.0,
                      height: 9.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: _current == index ? Colors.blue : Colors.white,
                      ),
                    )
                  : Container(
                      width: 10.0,
                      height: 9.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == index ? Colors.blue : Colors.white,
                      ),
                    );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
