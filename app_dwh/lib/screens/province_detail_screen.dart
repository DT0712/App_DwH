import 'package:flutter/material.dart';
import '../models/province.dart';

class ProvinceDetailScreen extends StatelessWidget {
  final Province province;

  const ProvinceDetailScreen({super.key, required this.province});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(province.name)),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(province.imageAsset, fit: BoxFit.cover),
            SizedBox(height: 16),
            Text(province.description, style: TextStyle(fontSize: 16)),
            SizedBox(height: 24),
            Text('Điểm đến', style: Theme.of(context).textTheme.titleLarge),
            ...province.destinations.map(
              (d) => ListTile(
                leading: Image.asset(d.image, width: 50),
                title: Text(d.name),
              ),
            ),
            SizedBox(height: 24),
            Text('Sự kiện', style: Theme.of(context).textTheme.titleLarge),
            ...province.events.map(
              (e) => ListTile(title: Text(e.name), subtitle: Text(e.date)),
            ),
            SizedBox(height: 24),
            Text('Ẩm thực', style: Theme.of(context).textTheme.titleLarge),
            ...province.foods.map(
              (f) => ListTile(
                leading: Image.asset(f.image, width: 50),
                title: Text(f.name),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
