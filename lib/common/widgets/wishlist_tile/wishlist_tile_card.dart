import 'package:flutter/material.dart';
import 'package:store_app_using_bloc/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:store_app_using_bloc/models/home_product_data_model.dart';

class WishlistTileCard extends StatelessWidget {
  const WishlistTileCard({
    super.key,
    required this.wishlistBloc,
    required this.productDataModel,
  });

  // wishlist bloc
  final WishlistBloc wishlistBloc;

  // product data model
  final HomeProductDataModel productDataModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 0.3,
            blurRadius: 1.2,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 100,
                width: 80,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(productDataModel.imageUrl),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                productDataModel.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              foregroundColor: Colors.red,
            ),
            onPressed: () {
              // remove from wishlist
              wishlistBloc.add(
                WishlistRemoveWishlistEvent(
                  productModel: productDataModel,
                ),
              );
            },
            child: const Text(
              "Remove",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
