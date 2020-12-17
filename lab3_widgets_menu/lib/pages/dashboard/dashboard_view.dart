import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../drawer/drawer_view.dart';

class DashboardView extends StatelessWidget {
  final slideImages = [
    {
      'name': 'assets/slider1.jpg',
      'title': 'Awesome image 1',
      'subtitle': 'awesome image caption 1'
    },
    {
      'name': 'assets/slider2.jpg',
      'title': 'Awesome image 2',
      'subtitle': 'awesome image caption 2'
    },
    {
      'name': 'assets/slider3.jpg',
      'title': 'Awesome image 3',
      'subtitle': 'awesome image caption 3'
    },
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
                fade: 0.0,
                autoplay: true,
                outer: true,
                pagination: SwiperPagination(),
                itemBuilder: (BuildContext context, int index) {
                  var item = slideImages[index];
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(item['name']),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: ListTile(
                            title: Text(item['title']),
                            subtitle: Text(item['subtitle']),
                          ),
                        )
                      ],
                    ),
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
