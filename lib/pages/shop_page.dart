import 'package:ecommerce_app/components/shoe_tile.dart';
import 'package:ecommerce_app/models/cart.dart';
import 'package:ecommerce_app/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // add shoe to cart
  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

    // alert user
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              title: Text('Successfully added!'),
              content: Text('Check your cart'),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder: (context, value, child) => Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Search', style: TextStyle(color: Colors.grey)),
                      Icon(Icons.search, color: Colors.grey)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Text('Everyone flies... some fly longer than others',
                      style: TextStyle(color: Colors.grey[600])),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('Hot picks',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                      Text('See all',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.blue))
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // list of shoes for sale
                SizedBox(
                    height: 300,
                    child: ListView.builder(
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          // get a shoe from shop list
                          Shoe shoe = value.getShoeList()[index];

                          // return the shoe
                          return ShoeTile(
                            shoe: shoe,
                            onTap: () => addShoeToCart(shoe),
                          );
                        })),
              ],
            ));
  }
}
