import 'package:flutter/material.dart';
import 'package:store_app_using_bloc/features/cart/bloc/cart_bloc.dart';
import 'package:store_app_using_bloc/models/home_product_data_model.dart';

class CartTileCard extends StatelessWidget {
  const CartTileCard({
    super.key,
    required this.cartBloc,
    required this.productDataModel,
  });
  // cart bloc
  final CartBloc cartBloc;

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
                width: 100,
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
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              // remove from cart
              cartBloc.add(CartRemoveFromCartEvent(
                productDataModel: productDataModel,
              ));
            },
            icon: const Icon(
              Icons.delete_forever,
              color: Colors.red,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}

/*

Container(
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
                image: NetworkImage(productDataModel.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Text(
                productDataModel.name,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                productDataModel.description,
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
                    "\$ ${productDataModel.price.toString()}",
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Colors.green,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // remove from cart
                      cartBloc.add(CartRemoveFromCartEvent(
                        productDataModel: productDataModel,
                      ));
                    },
                    icon: const Icon(
                      Icons.delete_forever,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );


 */