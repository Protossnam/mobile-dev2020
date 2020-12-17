import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../drawer/drawer_view.dart';

class DashboardView extends StatelessWidget {
  final slideImages = [
    'assets/slider1.jpg',
    'assets/slider2.jpg',
    'assets/slider3.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard View'),
      ),
      drawer: Drawer(child: DrawerView()),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 340,
              color: Colors.grey.shade800,
              padding: EdgeInsets.all(16.0),
              child: Swiper(
                itemCount: slideImages.length,
                scale: 0.9,
                fade: 0.0,
                autoplay: true,
                pagination: SwiperPagination(),
                itemBuilder: (BuildContext context, int index) {
                  var item = slideImages[index];
                  return Column(
                    children: [
                      Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0)),
                            image: DecorationImage(
                                image: AssetImage(item), fit: BoxFit.cover)),
                      ),
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0))),
                          child: ListTile(
                            title: Text('Awesome image'),
                            subtitle: Text('awesome image caption'),
                          )),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
