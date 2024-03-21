class Products {
  final int id;
  final String title;
  final dynamic price;
  final String description;
  final String category;
  final String image;
  final Rating rating;

  Products({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    print("model");
    return Products(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rating: Rating(
        rate: json['rating']['rate'].toDouble(),
        count: json['rating']['count'],
      ),
    );
  }

}

enum Category {
    ELECTRONICS,
    JEWELERY,
    MEN_S_CLOTHING,
    WOMEN_S_CLOTHING
}

class Rating {
  final double rate;
  final int count;

  Rating({
    required this.rate,
    required this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: json['rate'],
      count: json['count'],
    );
  }
}