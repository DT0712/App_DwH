import 'package:flutter/material.dart';
import '../models/province.dart';
import '../services/province_service.dart';
import '../screens/province_detail_screen.dart';
import '../widgets/province_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Danh sách tỉnh')),
      body: FutureBuilder<List<Province>>(
        future: ProvinceService.loadAllProvinces(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final provinces = snapshot.data!;
          return GridView.builder(
            padding: EdgeInsets.all(10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: provinces.length,
            itemBuilder: (context, index) {
              final province = provinces[index];
              return ProvinceCard(
                province: province,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (_) =>
                              ProvinceDetailScreen(province: provinces[index]),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
