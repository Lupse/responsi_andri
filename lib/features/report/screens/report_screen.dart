import 'package:flutter/material.dart';
import 'package:latihan_responsi_prak_mobile/repo/report_service.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ReportService reportService = ReportService();

    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
          future: reportService.fetchReport(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData) {
              return const Center(
                child: Text('No Report Available!'),
              );
            } else {
              final reports = snapshot.data!;
              return ListView.builder(
                itemCount: reports.length,
                itemBuilder: (context, index) {
                  final report = reports[index];
                  return Card(
                    child: Text(report.title),
                  );
                },
              );
            }
          },
        ));
  }
}
