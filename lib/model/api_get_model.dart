class ApiGetModel {
  final int id;
  final String name;
  final String description;
  final double price;
  final String image;
  final String category;

  ApiGetModel({
    required this.category,
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
      category: json['category']['name'] ?? '',
      price: (json['price'] as num).toDouble(),
      image: (json['images'] != null && (json['images'] as List).isNotEmpty)
          ? json['images'][0]['url']
          : 'https://imgs.search.brave.com/3RRuhsHHs_2piH7Skyb8Li_sT9w1SZJahNwcu5Mx6cc/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jZG4u/dmVjdG9yc3RvY2su/Y29tL2kvNTAwcC8w/Ny83MC9pbWFnZS1u/b3QtYW4tYXZhaWxh/YmxlLWljb24tdmVj/dG9yLTUzMTEwNzcw/LmpwZw',
    );
  }
}
