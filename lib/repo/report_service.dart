// ignore_for_file: non_constant_identifier_names
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:latihan_responsi_prak_mobile/features/report/models/report_model.dart';

class ReportService {
  static const String baseUrl =
      'https://api.spaceflightnewsapi.net/v4/reports/';

  Future<List<ReportModel>> fetchReport() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      final List result = jsonResponse['results'];
      return result
          .map(
            (json) => ReportModel.fromJson(json),
          )
          .toList();
    } else {
      throw Exception('Failed to fetch report');
    }
  }
}
