import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:get/get.dart';
import 'package:library_reservation_liberta_flutter/home/home_controller.dart';
import 'package:library_reservation_liberta_flutter/home/utils/fl_charts/chart_model.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  // final HomeController homeViewController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return Column(
      children: [
        SingleChildScrollView(
          padding: EdgeInsets.all(24),
          scrollDirection: Axis.horizontal,
          child: Row(children: [
            InkWell(
              onTap: () {
                Get.snackbar(
                  "Başarılı.",
                  "Birim bilgileri kayıt edildi.",
                  icon: Icon(Icons.done, color: Colors.white),
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Color.fromARGB(255, 50, 139, 53),
                  borderRadius: 20,
                  margin: EdgeInsets.all(15),
                  colorText: Colors.white,
                  duration: Duration(seconds: 10),
                  isDismissible: true,
                  dismissDirection: DismissDirection.horizontal,
                  forwardAnimationCurve: Curves.easeOutBack,
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: SizedBox(
                  width: 154.0,
                  height: 185.0,
                  child: ListTile(
                    contentPadding: EdgeInsets.all(18.0),
                    title: Text(
                      "Liberta",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.w900),
                    ),
                    subtitle: Text(
                      "Yazilim",
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  ),
                ),
                color: Colors.amber,
              ),
            ),
            SizedBox(
              width: 16.0,
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0),
              ),
              child: SizedBox(
                width: 154.0,
                height: 185.0,
                child: ListTile(
                  contentPadding: EdgeInsets.all(18.0),
                  title: Text(
                    "Liberta",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w900),
                  ),
                  subtitle: Text(
                    "Yazilim",
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                ),
              ),
              color: Color.fromARGB(255, 21, 97, 44),
            ),
            SizedBox(
              width: 16.0,
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0),
              ),
              child: SizedBox(
                width: 154.0,
                height: 185.0,
                child: ListTile(
                  contentPadding: EdgeInsets.all(18.0),
                  title: Text(
                    "Liberta",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w900),
                  ),
                  subtitle: Text(
                    "Yazilim",
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                ),
              ),
              color: Color.fromARGB(255, 27, 67, 128),
            ),
            SizedBox(
              width: 16.0,
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0),
              ),
              child: SizedBox(
                width: 154.0,
                height: 185.0,
                child: ListTile(
                  contentPadding: EdgeInsets.all(18.0),
                  title: Text(
                    "Liberta",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w900),
                  ),
                  subtitle: Text(
                    "Yazilim",
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                ),
              ),
              color: Color.fromARGB(255, 255, 98, 7),
            ),
            SizedBox(
              width: 16.0,
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0),
              ),
              child: SizedBox(
                width: 154.0,
                height: 185.0,
                child: ListTile(
                  contentPadding: EdgeInsets.all(18.0),
                  title: Text(
                    "Liberta",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w900),
                  ),
                  subtitle: Text(
                    "Yazilim",
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                ),
              ),
              color: Color.fromARGB(255, 145, 11, 56),
            ),
          ]),
        ),
        // SizedBox(
        //   width: 16.0,
        //   height: 48.0,
        // ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(24),
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return ChartList.chartList[index];
              },
              itemCount: ChartList.chartList.length,
              pagination: SwiperPagination(
                builder: SwiperPagination.dots,
              ),
//control: SwiperControl(),
            ),
          ),
        ),

        // PieChartSample2(),
        //BarChartSample2()
      ],
    );
  }
}
