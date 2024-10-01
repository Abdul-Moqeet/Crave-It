// ignore_for_file: non_constant_identifier_names

class category_model {
  final String category_name;
  final int istrue;

  category_model({required this.category_name, required this.istrue});
}

List<category_model> category_list = [
  category_model(category_name: 'Foods', istrue: 1),
  category_model(category_name: 'Drinks', istrue: 2),
  category_model(category_name: 'Snacks', istrue: 3),
  category_model(category_name: 'Sauces', istrue: 4),
];

