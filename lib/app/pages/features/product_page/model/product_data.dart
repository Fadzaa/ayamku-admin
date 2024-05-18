
import 'package:get/get.dart';

import 'product.dart';

RxList<Product> product_data = [
  Product(
    name: "Laptop",
    price: 1000,
    qty: 10,
    description: "A high-performance laptop for all your needs.",
    category: "Minuman",
    image: "https://my.alfred.edu/zoom/_images/foster-lake.jpg",
  ),
  // Product(
  //   name: "Headphones",
  //   price: 100,
  //   qty: 50,
  //   description: "High-quality headphones with noise-cancellation feature.",
  //   category: "Electronics",
  //   image: "headphones.jpg",
  // ),
  // Product(
  //   name: "Backpack",
  //   price: 50,
  //   qty: 20,
  //   description: "A durable backpack for everyday use.",
  //   category: "Fashion",
  //   image: "backpack.jpg",
  // ),
  // Add more products as needed
].obs;