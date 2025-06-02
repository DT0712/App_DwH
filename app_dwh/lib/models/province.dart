class Province {
  final String id;
  final String name;
  final String imageAsset;
  final String description;
  final List<Destination> destinations;
  final List<Event> events;
  final List<Food> foods;

  Province({
    required this.id,
    required this.name,
    required this.imageAsset,
    required this.description,
    required this.destinations,
    required this.events,
    required this.foods,
  });

  factory Province.fromJson(Map<String, dynamic> json) {
    return Province(
      id: json['id'],
      name: json['name'],
      imageAsset: json['imageAsset'],
      description: json['description'],
      destinations:
          (json['destinations'] as List)
              .map((e) => Destination.fromJson(e))
              .toList(),
      events: (json['events'] as List).map((e) => Event.fromJson(e)).toList(),
      foods: (json['foods'] as List).map((e) => Food.fromJson(e)).toList(),
    );
  }
}

class Destination {
  final String name;
  final String image;

  Destination({required this.name, required this.image});

  factory Destination.fromJson(Map<String, dynamic> json) =>
      Destination(name: json['name'], image: json['image']);
}

class Event {
  final String name;
  final String date;

  Event({required this.name, required this.date});

  factory Event.fromJson(Map<String, dynamic> json) =>
      Event(name: json['name'], date: json['date']);
}

class Food {
  final String name;
  final String image;

  Food({required this.name, required this.image});

  factory Food.fromJson(Map<String, dynamic> json) =>
      Food(name: json['name'], image: json['image']);
}
