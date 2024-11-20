import 'package:flutter/material.dart';
import 'package:latihan_responsi_prak_mobile/features/blog/models/blog_model.dart';
import 'package:latihan_responsi_prak_mobile/features/news/model/news_model.dart';
import 'package:latihan_responsi_prak_mobile/features/report/models/report_model.dart';
import 'package:latihan_responsi_prak_mobile/repo/api_service.dart';

class ApiDetail<T> extends StatelessWidget {
  final String menu;
  final int id;
  final T Function(Map<String, dynamic>) fromJson;

  const ApiDetail(
      {super.key,
      required this.menu,
      required this.id,
      required this.fromJson});

  @override
  Widget build(BuildContext context) {
    final ApiService apiService = ApiService();
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.black87,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: FutureBuilder<T>(
        future: apiService.fetchDetail(menu, id, fromJson),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData) {
            return const Center(child: Text("No Detail Found"));
          } else {
            final detail = snapshot.data!;
            if (detail is NewsModel) {
              return Column(
                children: [
                  ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                      child: Image.network(
                        detail.image_url,
                        height: 500,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )),
                  SizedBox(
                    height: 16,
                  ),
                  Text(detail.title),
                  Text(detail.summary),
                  ElevatedButton(
                      onPressed: () {
                        detail.url;
                      },
                      child: Text('Helo'))
                ],
              );
            } else if (detail is BlogModel) {
              return Text("Blog Title: ${detail.title}");
            } else if (detail is ReportModel) {
              return Text("Report Title: ${detail.title}");
            } else {
              return const Text("Unknown Data Type");
            }
          }
        },
      ),
    );
  }
}
