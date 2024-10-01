class products_model {
  final String name;
  final double price;
  final String image;
  final String tag;
  final String description;
  final String category;
  int quantity; // New field for quantity

  products_model({
    required this.category,
    required this.name,
    required this.price,
    String? image,
    required this.description,
    String? tag,
    this.quantity = 1, // Default quantity is 1
  })  : tag = tag ?? name,
        image = '${name.replaceAll(' ', '_')}.png';

  // Method to copy the model with optional new quantity
  products_model copyWith({int? quantity}) {
    return products_model(
      category: this.category,
      name: this.name,
      price: this.price,
      image: this.image,
      tag: this.tag,
      description: this.description,
      quantity: quantity ?? this.quantity,
    );
  }
}

List<products_model> products_list = [
  products_model(
    name: 'Veggie Tomato Mix',
    price: 10,
    description:
        'A vibrant medley of fresh vegetables like bell peppers, zucchini, and carrots simmered in a rich, savory tomato sauce, perfect with rice, pasta, or bread.',
    category: 'foods',
  ),
  products_model(
    name: 'Egg and Cucumber Mix',
    price: 15,
    description:
        'A refreshing blend of diced cucumbers and sliced hard-boiled eggs, tossed with salt, pepper, and lemon juice for a light, crunchy salad.',
    category: 'foods',
  ),
  products_model(
    name: 'Fried chicken mix',
    price: 20,
    description:
        'Golden-brown, crispy fried chicken pieces paired with sides like French fries and coleslaw, creating a satisfying and indulgent meal.',
    category: 'foods',
  ),
  products_model(
    name: 'Macaroni Noodles',
    price: 25,
    description:
        'Classic elbow-shaped pasta, perfect for mac and cheese or pasta salads.',
    category: 'foods',
  ),
  products_model(
    name: 'Tomato Ketchup',
    price: 2,
    description:
        'Classic tomato ketchup with a tangy and sweet flavor, perfect for fries and burgers.',
    category: 'sauces',
  ),
  products_model(
    name: 'Garlic Aioli',
    price: 3,
    description:
        'Creamy aioli sauce infused with garlic, ideal for dipping fries or as a sandwich spread.',
    category: 'sauces',
  ),
  products_model(
    name: 'Barbecue Sauce',
    price: 4,
    description:
        'Smoky barbecue sauce with a rich flavor, great for marinating meats or as a dipping sauce.',
    category: 'sauces',
  ),
  products_model(
    name: 'Soy Sauce',
    price: 2,
    description:
        'Traditional soy sauce with a savory umami taste, essential for Asian cuisine and sushi.',
    category: 'sauces',
  ),
  products_model(
    name: 'Potato Chips',
    price: 2,
    description:
        'Crispy and salty potato chips, a favorite snack for any occasion.',
    category: 'snacks',
  ),
  products_model(
    name: 'Popcorn',
    price: 1,
    description:
        'Light and fluffy popcorn, perfect for movie nights or as a healthy snack option.',
    category: 'snacks',
  ),
  products_model(
    name: 'Pretzels',
    price: 3,
    description:
        'Crunchy pretzels with a salty taste, great for snacking on the go or at parties.',
    category: 'snacks',
  ),
  products_model(
    name: 'Chocolate Bar',
    price: 2,
    description:
        'Rich and indulgent chocolate bar, a satisfying treat for chocolate lovers.',
    category: 'snacks',
  ),
  products_model(
    name: 'Chocolate Milkshake',
    price: 5,
    description:
        'A rich and creamy milkshake made with real chocolate ice cream and topped with whipped cream.',
    category: 'drinks',
  ),
  products_model(
    name: 'Classic Coffee',
    price: 3,
    description:
        'A freshly brewed cup of coffee made from premium roasted beans, perfect for a morning boost.',
    category: 'drinks',
  ),
  products_model(
    name: 'Green Tea',
    price: 4,
    description:
        'A healthy and soothing green tea, rich in antioxidants and perfect for a relaxing break.',
    category: 'drinks',
  ),
  products_model(
    name: 'Strawberry Smoothie',
    price: 6,
    description:
        'A delicious and refreshing smoothie made with fresh strawberries and yogurt.',
    category: 'drinks',
  ),
];
