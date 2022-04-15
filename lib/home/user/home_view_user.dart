import 'package:flutter/material.dart';
import 'package:library_reservation_liberta_flutter/widgets/background_gradient.dart';
import 'package:library_reservation_liberta_flutter/widgets/searchList.dart';
import 'package:flip_card/flip_card.dart';

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
                      height: 28.0,
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: searchTextField(
                          context, searchOnChanged, "Salon Ara")),
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 218, 218, 218),
                      borderRadius: BorderRadius.all(Radius.elliptical(24, 24)),
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 218, 218, 218),
                      borderRadius: BorderRadius.all(Radius.elliptical(24, 24)),
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 218, 218, 218),
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
                  crossAxisCount: 1,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                  childAspectRatio: 2,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return FlipCard(
                        fill: Fill
                            .fillBack, // Fill the back side of the card to make in the same size as the front.
                        direction: FlipDirection.HORIZONTAL, // default
                        front: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(11),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.teal[100 * (index % 9)],
                              borderRadius: BorderRadius.all(
                                Radius.circular(11),
                              ),
                            ),
                            width: double.infinity,
                            height: double.infinity,
                            padding: EdgeInsets.all(12.0),
                            child: Stack(
                              children: [
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'SALON ON $index',
                                  ),
                                ),
                                Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 38,
                                      height: 38,
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 245, 40, 25),
                                        borderRadius: BorderRadius.all(
                                            Radius.elliptical(32, 32)),
                                      ),
                                    )),
                                Positioned(
                                  bottom: 3,
                                  right: 3,
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 32,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      borderRadius: BorderRadius.all(
                                          Radius.elliptical(32, 32)),
                                    ),
                                    child: Text(
                                      "%98",
                                      style: TextStyle(fontSize: 11.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        back: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(11),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.teal[100 * (index % 9)],
                              borderRadius: BorderRadius.all(
                                Radius.circular(11),
                              ),
                            ),
                            width: double.infinity,
                            height: double.infinity,
                            padding: EdgeInsets.all(12.0),
                            child: Stack(
                              children: [
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'SALON ARKA $index',
                                  ),
                                ),
                                Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 38,
                                      height: 38,
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 245, 40, 25),
                                        borderRadius: BorderRadius.all(
                                            Radius.elliptical(32, 32)),
                                      ),
                                    )),
                                Positioned(
                                  bottom: 3,
                                  right: 3,
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 32,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      borderRadius: BorderRadius.all(
                                          Radius.elliptical(32, 32)),
                                    ),
                                    child: Text(
                                      "%98",
                                      style: TextStyle(fontSize: 11.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ));
                  },
                  childCount: 11,
                ),
              ),
            ),
          ],
        ),
      );
}

//  Expanded(
//                       child: GestureDetector(
//                         onTap: () {},
//                         child: Container(
//                           color: Colors.white,
//                           width: double.infinity,
//                           height: double.infinity,
//                           // width: MediaQuery.of(context).size.width,
//                           decoration: BoxDecoration(
//                             borderRadius: const BorderRadius.all(
//                               Radius.circular(11),
//                             ),
//                           ),
//                           child: Align(
//                             alignment: Alignment.bottomCenter,
//                             child: Container(
//                               height: MediaQuery.of(context).size.width / 9,
//                               child: Align(
//                                 child: Text(
//                                   "title",
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                     fontSize: 13,
//                                     color: Theme.of(context)
//                                         .textTheme
//                                         .bodyLarge!
//                                         .color,
//                                     decoration: TextDecoration.none,
//                                     fontWeight: FontWeight.normal,
//                                   ),
//                                 ),
//                               ),
//                               decoration: const BoxDecoration(
//                                 borderRadius: BorderRadius.only(
//                                   topLeft: Radius.circular(0),
//                                   topRight: Radius.circular(0),
//                                   bottomLeft: Radius.circular(11),
//                                   bottomRight: Radius.circular(11),
//                                 ),
//                                 boxShadow: [
//                                   BoxShadow(
//                                       color: Color.fromRGBO(0, 0, 0, 0.25),
//                                       offset: Offset(0, 4),
//                                       blurRadius: 4)
//                                 ],
//                                 color: Color.fromRGBO(255, 251, 251, 1),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     );