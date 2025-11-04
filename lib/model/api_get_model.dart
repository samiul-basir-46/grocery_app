class ApiGetModel {
  final int id;
  final String name;
  final String description;
  final double price;
  final String image;

  ApiGetModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });

  factory ApiGetModel.fromJson(Map<String, dynamic> json) {
    return ApiGetModel(
      id: json['id'],
      name: json['name'],
      description: json['description'] ?? '',
      price: (json['price'] as num).toDouble(),
      image: (json['images'] != null && (json['images'] as List).isNotEmpty)
          ? json['images'][0]['url']
          : '',
    );
  }
}
