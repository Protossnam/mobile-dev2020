import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:stacked/stacked.dart';

import '../book/book_view.dart';
import '../drawer/widgets/drawer_view.dart';
import 'home_view_model.dart';

class HomeView extends StatelessWidget {
  static final routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      onModelReady: (model) => model.init(),
      builder: (context, model, _) => Scaffold(
        appBar: AppBar(title: Text('Dashboard View')),
        drawer: Drawer(child: DrawerView()),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 340,
                color: Colors.grey.shade800,
                padding: EdgeInsets.all(16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Swiper(
                    itemCount: model.slideImages.length,
                    fade: 0.0,
                    autoplay: true,
                    outer: true,
                    itemBuilder: (BuildContext context, int index) {
                      var item = model.slideImages[index];
                      return Column(
                        children: [
                          // Expanded(
                          //   child: GestureDetector(
                          //     onTap: () => Navigator.push(
                          //       context,
                          //       PageRouteBuilder(
                          //         transitionDuration: Duration(seconds: 1),
                          //         pageBuilder: (_, __, ___) => null,
                          //       ),
                          //     ),
                          //     child: Hero(
                          //       tag: 'image$index',
                          //       child: ClipRRect(
                          //         //borderRadius: BorderRadius.circular(10),
                          //         child: Container(
                          //           height: 200,
                          //           width: double.infinity,
                          //           decoration: BoxDecoration(
                          //               image: DecorationImage(
                          //                   image:
                          //                       AssetImage(item['name']))),
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          Container(
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(item.images.first),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: ListTile(
                              subtitle: Text(item.subtitle),
                              title: Text(item.title),
                            ),
                          )
                        ],
                      );
                    },
                    //   Container(
                    //   padding: const EdgeInsets.all(16.0),
                    //   child: Column(
                    //     children: <Widget>[
                    //       Expanded(
                    //           child: GestureDetector(
                    //         onTap: () => Navigator.push(
                    //             context,
                    //             PageRouteBuilder(
                    //                 transitionDuration: Duration(seconds: 1),
                    //                 pageBuilder: (_, __, ___) => AnimationOneDetails(index: index,))),
                    //         child: Hero(
                    //           tag: "image$index",
                    //           child: ClipRRect(
                    //             borderRadius: BorderRadius.circular(20.0),
                    //             child: PNetworkImage(
                    //               images[index],
                    //               fit: BoxFit.cover,
                    //             ),
                    //           ),
                    //         ),
                    //       )),
                    //     ],
                    //   ),
                    // )
                    pagination: SwiperPagination(),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                child: GridView.count(
                  scrollDirection: Axis.vertical,
                  crossAxisCount: model.items.length,
                  children: List.generate(model.items.length, (i) {
                    var item = model.items[i];
                    return Container(
                      child: Card(
                        color: Colors.amber,
                        child: Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(item.images.first),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              )
            ],
          ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
