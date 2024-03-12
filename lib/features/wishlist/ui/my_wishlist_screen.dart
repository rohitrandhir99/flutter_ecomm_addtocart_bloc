import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app_using_bloc/common/widgets/wishlist_tile/wishlist_tile_card.dart';
import 'package:store_app_using_bloc/features/wishlist/bloc/wishlist_bloc.dart';

class MyWishlistScreen extends StatefulWidget {
  const MyWishlistScreen({super.key});

  @override
  State<MyWishlistScreen> createState() => _MyWishlistScreenState();
}

class _MyWishlistScreenState extends State<MyWishlistScreen> {
  // wishlist bloc
  final WishlistBloc wishlistBloc = WishlistBloc();

  // when the app loads
  @override
  void initState() {
    wishlistBloc.add(WishlistInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Wishlist"),
        centerTitle: true,
      ),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishlistBloc,
        listenWhen: (previous, current) => current is WishlistActionState,
        buildWhen: (previous, current) => current is! WishlistActionState,
        listener: (context, state) {
          if (state is WishlistRemoveItemFromWishlistSuccessActionState) {
            // show snackbar when the product is added to the wishlist
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  "Removed from wishlist!",
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
        builder: (context, state) {
          switch (state.runtimeType) {
            case WishlistSuccessState:
              final successState = state as WishlistSuccessState;

              return ListView.builder(
                itemCount: successState.wishlistItems.length,
                itemBuilder: (context, index) {
                  return WishlistTileCard(
                    wishlistBloc: wishlistBloc,
                    productDataModel: successState.wishlistItems[index],
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
