import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:latihan_responsi_prak_mobile/features/news/model/news_model.dart';
import 'package:latihan_responsi_prak_mobile/repo/api_detail.dart';
import 'package:latihan_responsi_prak_mobile/repo/api_service.dart';
import 'package:latihan_responsi_prak_mobile/repo/news_service.dart';

class NewsScreen extends StatelessWidget {
  final String menu;
  const NewsScreen({super.key, required this.menu});

  @override
  Widget build(BuildContext context) {
    final ApiService apiService = ApiService();

    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Berita Terkini')),
        ),
        body: FutureBuilder<List<NewsModel>>(
          future: apiService.fetchList(menu, NewsModel.fromJson),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else if (!snapshot.hasData) {
              return const Center(child: Text("No News Available!"));
            } else {
              final newses = snapshot.data!;
              return ListView.builder(
                itemCount: newses.length,
                itemBuilder: (context, index) {
                  final news = newses[index];
                  return InkWell(
                    onTap: () {
                      Get.to(() => ApiDetail(
                            id: news.id,
                            menu: menu,
                            fromJson: NewsModel.fromJson,
                          ));
                    },
                    child: SizedBox(
                      height: 350,
                      child: Card(
                        margin: const EdgeInsets.all(8.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            side: const BorderSide(color: Colors.black)),
                        child: Container(
                          width: 300,
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  news.image_url,
                                  height: 200,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    }
                                    return SizedBox(
                                      height: 200,
                                      child: Center(
                                          child: CircularProgressIndicator()),
                                    );
                                  },
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      height: 200,
                                      width: 300,
                                      color: Colors.grey[300],
                                      child: const Center(
                                        child: Icon(
                                          Icons.broken_image,
                                          size: 50,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                news.title,
                                textAlign: TextAlign.center,
                              ),
                              Center(
                                child: Text(
                                  news.published_at,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: Icon(Icons.arrow_forward)),

                                  
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ));
  }
}
