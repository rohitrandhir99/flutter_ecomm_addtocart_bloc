import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app_using_bloc/common/widgets/product_tile/product_tile_card.dart';
import 'package:store_app_using_bloc/features/cart/ui/cart_screen.dart';
import 'package:store_app_using_bloc/features/home/bloc/home_bloc.dart';
import 'package:store_app_using_bloc/features/search/search_screen.dart';
import 'package:store_app_using_bloc/features/wishlist/ui/my_wishlist_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // home bloc for home screen
  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    // get product data as soon as the app loads
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      // current state is HomeActionState
      listenWhen: (previous, current) => current is HomeActionState,
      // current state is not HomeActionState
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToWishlistPageActionState) {
          // navigate to wishlist screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MyWishlistScreen(),
            ),
          );
        } else if (state is HomeNavigateToCartPageActionState) {
          // navigate to cart screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CartScreen(),
            ),
          );
        } else if (state is HomeNavigateToSearchPageActionState) {
          // navigate to search screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SearchScreen(),
            ),
          );
        } else if (state is HomeProductItemAddedToWishlistActionState) {
          // show snackbar when the product is added to the wishlist
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "Added to Wishlist!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        } else if (state is HomeProductItemAddedToCartActionState) {
          // show snackbar when the product is added to the cart
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "Added to Cart!",
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
          case HomeLoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case HomeLoadedSuccessState:
            // success state
            final successState = state as HomeLoadedSuccessState;

            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.teal.shade400,
                title: const Text(
                  "My Grocery App",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                actions: [
                  IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.grey.shade200,
                    ),
                    onPressed: () {
                      // navigate to wishlist screen
                      homeBloc.add(HomeWishlistButtonNavigateEvent());
                    },
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                  ),
                  IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.blue.shade300,
                    ),
                    onPressed: () {
                      // navigate to cart screen
                      homeBloc.add(HomeCartButtonNavigateEvent());
                    },
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.black54,
                    ),
                    onPressed: () {
                      homeBloc.add(HomeSearchButtonNavigateEvent());
                    },
                    icon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              body: ListView.builder(
                shrinkWrap: true,
                itemCount: successState.products.length,
                itemBuilder: (context, index) {
                  return ProductTileCard(
                    homeBloc: homeBloc,
                    productModel: successState.products[index],
                  );
                },
              ),
            );

          case HomeLoadedErrorState:
            return const Scaffold(
              body: Center(
                child: Text(
                  "Oops... Something went wrong!",
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}

/*

ListView.builder(
                shrinkWrap: true,
                itemCount: successState.products.length,
                itemBuilder: (context, index) {
                  return ProductTileCard(
                    homeBloc: homeBloc,
                    productModel: successState.products[index],
                  );
                },
              ),
            );

 */