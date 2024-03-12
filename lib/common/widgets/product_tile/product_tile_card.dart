import 'package:flutter/material.dart';
import 'package:store_app_using_bloc/features/home/bloc/home_bloc.dart';
import 'package:store_app_using_bloc/models/home_product_data_model.dart';

class ProductTileCard extends StatelessWidget {
  const ProductTileCard({
    super.key,
    required this.productModel,
    required this.homeBloc,
  });

  final HomeProductDataModel productModel;

  final HomeBloc homeBloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            blurRadius: 2.0,
            spreadRadius: 0.4,
            color: Colors.grey,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // image
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(productModel.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Text(
                productModel.name,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                productModel.description,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$ ${productModel.price.toString()}",
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Colors.green,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          // add to wishlist
                          homeBloc.add(HomeProductWishlistButtonClickedEvent(
                            clickedProduct: productModel,
                          ));
                        },
                        icon: const Icon(
                          Icons.favorite_outline,
                          color: Colors.red,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // add to cart
                          homeBloc.add(HomeProductCartButtonClickedEvent(
                            clickedProduct: productModel,
                          ));
                        },
                        icon: Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.blue.shade300,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
