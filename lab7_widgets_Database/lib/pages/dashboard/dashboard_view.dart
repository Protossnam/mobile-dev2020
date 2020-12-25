import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../book/book_view.dart';
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
    int max = 100;
    List<Widget> imageList = List<Widget>();
    for (int i = 1; i <= 30; ++i) {
      Random rand = Random();
      String imageId = rand.nextInt(max).toString();

      imageList.add(
        Container(
          child: Image(
            image: NetworkImage(
                'https://picsum.photos/id/' + imageId + '/300/200'),
          ),
        ),
      );
    }

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
                pagination: SwiperPagination(),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              child: GridView.count(
                scrollDirection: Axis.vertical,
                crossAxisCount: 3,
                children: List.generate(6, (index) {
                  return Container(
                    child: Card(
                      child: OutlineButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) {
                                  return BookView();
                                },
                              ),
                            );
                          },
                          icon: Icon(Icons.book),
                          label: Text('Book')),
                      color: Colors.amber,
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
