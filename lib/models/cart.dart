import 'package:ecommerce_app/models/shoe.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  // list of shoes for sale
  List<Shoe> shoeShop = [
    Shoe(
        name: 'Zoom freak',
        price: '239',
        imagePath: 'lib/images/nike_1.png',
        description: 'The forward-thinking of his latest signature shoe'),
    Shoe(
        name: 'KD treys',
        price: '220',
        imagePath: 'lib/images/nike_2.png',
        description: 'The forward-thinking of his latest signature shoe'),
    Shoe(
        name: 'Air jordan',
        price: '249',
        imagePath: 'lib/images/nike_3.png',
        description: 'The forward-thinking of his latest signature shoe'),
    Shoe(
        name: 'Kyrie 6',
        price: '190',
        imagePath: 'lib/images/nike_4.png',
        description: 'The forward-thinking of his latest signature shoe'),
  ];

  // list of items in usercart
  List<Shoe> userCart = [];

  // get list of shoes for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  // get cart
  List<Shoe> getUserCart() {
    return userCart;
  }

  // add items to cart
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    // to update the state -->
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    // to update the state -->
    notifyListeners();
  }
}
