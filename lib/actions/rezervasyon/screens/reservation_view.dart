import 'package:flutter/material.dart';

class ReservationView extends StatelessWidget {
  const ReservationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> image = new List.empty(growable: true);
    image.add(
        "https://cdn.pixabay.com/photo/2017/02/27/19/57/marriage-2104147_1280.jpg");
    image.add(
        "https://www.shaadidukaan.com/vogue/wp-content/uploads/2019/08/hug-kiss-images.jpg");
    image.add(
        "https://images.pexels.com/photos/1133957/pexels-photo-1133957.jpeg");
    image.add(
        "https://www.filmibeat.com/ph-big/2019/10/beautiful_157061627750.jpg");
    image.add(
        "https://images.pexels.com/photos/1133957/pexels-photo-1133957.jpeg");
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: Theme.of(context).iconTheme.color,
          ),
        ),
        body: ListView(
          shrinkWrap: true,
          children: [
            Text("Reservasyon"),
            Container(
              height: 1000,
              child: Expanded(
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.all(12.0),
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (var i = 0; i <= 10; i++)
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text("Blok $i"),
                            for (var i = 0; i <= 10; i++)
                              Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 28,
                                      height: 28,
                                      decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 221, 221, 221),
                                        shape: BoxShape.rectangle,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Container(
                                      width: 28,
                                      height: 28,
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 218, 13, 13),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
