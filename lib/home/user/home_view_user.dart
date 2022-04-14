import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:library_reservation_liberta_flutter/widgets/background_gradient.dart';
import 'package:library_reservation_liberta_flutter/widgets/searchList.dart';

class HomeViewUser extends StatelessWidget {
  const HomeViewUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: homeUserBody(context),
      // floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: Icon(Icons.lock),
      // )

      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarItem(label: "Ahmet", icon: Icon(Icons.lock)),
      //     BottomNavigationBarItem(label: "Ahmet", icon: Icon(Icons.lock))
      //   ],
      // ),
    );
  }

  dynamic searchOnChanged(value) {}
  Container homeUserBody(context) => Container(
        decoration: pageBackgroundGradient(context),
        child: CustomScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          slivers: [
            SliverAppBar(
              // actions: [
              //   IconButton(
              //       onPressed: () {},
              //       icon: Icon(
              //         Icons.create_rounded,
              //       ))
              // ],
              // excludeHeaderSemantics: true,
              backgroundColor: Colors.transparent,
              // title: Text(
              //   "GAUN",
              //   style: TextStyle(
              //       color: Theme.of(context).textTheme.bodySmall!.color),
              // ),
              pinned: false,
              elevation: 6.0,
              expandedHeight: MediaQuery.of(context).size.height / 8,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding:
                    EdgeInsetsDirectional.only(start: 16, top: 16, bottom: 8),
                title: Container(
                  padding: EdgeInsets.only(
                    top: 15,
                  ),
                  child: SizedBox(
                    height: 35.0,
                    child: Stack(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "GAUN",
                            style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .fontSize,
                              color:
                                  Theme.of(context).textTheme.bodySmall!.color,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "Kutuphane Salonlari",
                            style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .fontSize,
                              color:
                                  Theme.of(context).textTheme.bodySmall!.color,
                            ),
                          ),
                        ),
                        // Positioned(
                        //   bottom: 18,
                        //   child: Text(
                        //     "GAUN",
                        //     style: TextStyle(
                        //       fontSize: Theme.of(context)
                        //           .textTheme
                        //           .titleMedium!
                        //           .fontSize,
                        //       color: Theme.of(context)
                        //           .textTheme
                        //           .titleMedium!
                        //           .color,
                        //     ),
                        //   ),
                        // ),
                        // Positioned(
                        //   bottom: 0.0,
                        //   child: Text(
                        //     "Kutuphane Salonlari",
                        //     style: TextStyle(
                        //       fontSize: Theme.of(context)
                        //           .textTheme
                        //           .titleSmall!
                        //           .fontSize,
                        //       color:
                        //           Theme.of(context).textTheme.titleSmall!.color,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Row(
                children: [
                  SizedBox(
                      height: 34,
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: searchTextField(
                          context, searchOnChanged, "Salon Ara")),
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 129, 99, 99),
                      borderRadius: BorderRadius.all(Radius.elliptical(24, 24)),
                    ),
                  ),
                ],
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(
                16.0,
              ),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                  childAspectRatio: 1.0,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Card(
                      color: Colors.teal[100 * (index % 9)],
                      child: Container(
                          alignment: Alignment.center,
                          child: Text('grid item $index')),
                    );
                  },
                  childCount: 11,
                ),
              ),
            ),
          ],
        ),
      );
}
