import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:latihan_responsi_prak_mobile/features/blog/models/blog_model.dart';
import 'package:latihan_responsi_prak_mobile/repo/api_detail.dart';
import 'package:latihan_responsi_prak_mobile/repo/api_service.dart';
import 'package:latihan_responsi_prak_mobile/repo/blog_service.dart';

class BlogScreen extends StatelessWidget {
  final String menu;
  const BlogScreen({super.key, required this.menu});

  @override
  Widget build(BuildContext context) {
    final ApiService apiService = ApiService();
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder<List<BlogModel>>(
          future: apiService.fetchList(menu, BlogModel.fromJson),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData) {
              return const Text('No Blogs Available!');
            } else {
              final blogs = snapshot.data!;
              return ListView.builder(
                itemCount: blogs.length,
                itemBuilder: (context, index) {
                  final blog = blogs[index];
                  return InkWell(
                    onTap: () {
                      Get.to(() => ApiDetail(
                          menu: menu,
                          id: blog.id,
                          fromJson: BlogModel.fromJson));
                    },
                    child: SizedBox(
                      height: 350,
                      child: Card(
                        margin: EdgeInsets.all(8.0),
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
                                  blog.image_url,
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
                              Center(
                                child: Text(
                                  blog.title,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Center(
                                child: Text(
                                  blog.published_at,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: Icon(Icons.arrow_forward))
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
