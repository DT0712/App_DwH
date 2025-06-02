import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/province.dart';

class ProvinceService {
  static Future<List<Province>> loadAllProvinces() async {
    final List<String> provinceFiles = [
      'hcm.json',
      // thêm các tỉnh khác ở đây
    ];

    List<Province> provinces = [];
    for (String file in provinceFiles) {
      final String jsonStr = await rootBundle.loadString('assets/data/$file');
      final Map<String, dynamic> jsonData = json.decode(jsonStr);
      provinces.add(Province.fromJson(jsonData));
    }
    return provinces;
  }
}
