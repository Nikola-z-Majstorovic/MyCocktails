import 'dart:convert';

class Drink {
  String id;
  String name;
  String imageUrl;
  String? category;
  bool isFavorite;
  Drink({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.category,
    this.isFavorite = false,
  });

  Drink copyWith({String? id, String? name, String? imageUrl, String? category, bool? isFavorite}) {
    return Drink(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      category: category ?? this.category,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'imageUrl': imageUrl, 'category': category};
  }

  factory Drink.fromMap(Map<String, dynamic> map) {
    return Drink(
      id: map['idDrink'] ?? '',
      name: map['strDrink'] ?? '',
      imageUrl: map['strDrinkThumb'] ?? '',
      category: map['category'],  // there's no attribute which tells category
    );
  }

  String toJson() => json.encode(toMap());

  factory Drink.fromJson(String source) => Drink.fromMap(json.decode(source));

  @override
  String toString() => 'Drink(id: $id, name: $name, imageUrl: $imageUrl, category: $category, :isFavorite: $isFavorite)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Drink &&
        other.id == id &&
        other.name == name &&
        other.imageUrl == imageUrl &&
        other.category == category &&
        isFavorite == other.isFavorite;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ imageUrl.hashCode ^ category.hashCode & isFavorite.hashCode;
}
