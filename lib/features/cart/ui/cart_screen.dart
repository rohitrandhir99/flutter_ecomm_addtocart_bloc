import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app_using_bloc/common/widgets/cart_tile/cart_tile_card.dart';
import 'package:store_app_using_bloc/features/cart/bloc/cart_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // CART BLOC
  final CartBloc cartBloc = CartBloc();

  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
        centerTitle: true,
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listener: (context, state) {
          if (state is CartRemoveFromCartSuccessActionState) {
            // show snackbar when the product is added to the wishlist
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  "Removed from cart!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }
        },
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartSuccessState:
              final successState = state as CartSuccessState;

              return ListView.builder(
                shrinkWrap: true,
                itemCount: successState.cartItems.length,
                itemBuilder: (context, index) {
                  return CartTileCard(
                    cartBloc: cartBloc,
                    productDataModel: successState.cartItems[index],
                  );
                },
              );

            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
