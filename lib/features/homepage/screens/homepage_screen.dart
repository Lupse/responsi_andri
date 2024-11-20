import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:hive/hive.dart';
import 'package:latihan_responsi_prak_mobile/features/blog/screens/blog_screen.dart';
import 'package:latihan_responsi_prak_mobile/features/homepage/controllers/homepage_controller.dart';
import 'package:latihan_responsi_prak_mobile/features/news/screens/news_screen.dart';
import 'package:latihan_responsi_prak_mobile/features/report/screens/report_screen.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomepageController homepageController = Get.find();
    var sessionBox = Hive.box('session');
    String? loggedInUser = sessionBox.get('loggedInUser');

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Hai, $loggedInUser!')),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                height: 650,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.count(
                    crossAxisCount: 1,
                    childAspectRatio: 2,
                    mainAxisSpacing: 16,
                    children: [
                      //card view 1
                      InkWell(
                        onTap: () {
                          Get.to(() => NewsScreen(
                                menu: 'articles',
                              ));
                        },
                        child: SizedBox(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.purple.shade100,
                                borderRadius: BorderRadius.circular(16)),
                            child: const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [Text('News'), Text('News')],
                              ),
                            ),
                          ),
                        ),
                      ),

                      //card view 2
                      InkWell(
                        onTap: () {
                          Get.to(() => const BlogScreen(
                                menu: 'blogs',
                              ));
                        },
                        child: SizedBox(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.purple.shade100,
                                borderRadius: BorderRadius.circular(16)),
                            child: const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [Text('Blog'), Text('Blog')],
                              ),
                            ),
                          ),
                        ),
                      ),

                      //card view 3
                      InkWell(
                        onTap: () {
                          Get.to(() => const ReportScreen());
                        },
                        child: SizedBox(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.purple.shade100,
                                borderRadius: BorderRadius.circular(16)),
                            child: const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [Text('Report'), Text('Report')],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),

            //logout
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                    onPressed: () {
                      homepageController.logout();
                    },
                    child: const Text("Logout")),
              ),
            )
          ],
        ),
      ),
    );
  }
}
