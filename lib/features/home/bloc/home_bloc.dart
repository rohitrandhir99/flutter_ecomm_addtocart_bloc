import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:store_app_using_bloc/data/grocery_products.dart';
import 'package:store_app_using_bloc/models/home_product_data_model.dart';
import 'package:store_app_using_bloc/data/cart_items.dart';
import 'package:store_app_using_bloc/data/wishlist_items.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    // ------------ events ------------- //
    on<HomeInitialEvent>(homeInitialEvent);

    on<HomeProductWishlistButtonClickedEvent>(
      homeProductWishlistButtonClickedEvent,
    );

    on<HomeProductCartButtonClickedEvent>(
      homeProductCartButtonClickedEvent,
    );

    on<HomeWishlistButtonNavigateEvent>(
      homeWishlistButtonNavigateEvent,
    );

    on<HomeCartButtonNavigateEvent>(
      homeCartButtonNavigateEvent,
    );

    on<HomeSearchButtonNavigateEvent>(
      homeSearchButtonNavigateEvent,
    );
  }

  // ----------------------- methods ------------------------- //

  // when the home screen loads initially
  FutureOr<void> homeInitialEvent(
    HomeInitialEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoadingState());
    // give duration of 3 seconds
    await Future.delayed(const Duration(seconds: 3));
    // load the products after 3 seconds
    emit(
      HomeLoadedSuccessState(
        products: GroceryProducts.groceryProductsData
            .map(
              (item) => HomeProductDataModel(
                id: item["id"],
                name: item["name"],
                description: item["description"],
                price: item["price"],
                imageUrl: item["imageUrl"],
              ),
            )
            .toList(),
      ),
    );
  }

  // individual wishlist product clicked
  FutureOr<void> homeProductWishlistButtonClickedEvent(
    HomeProductWishlistButtonClickedEvent event,
    Emitter<HomeState> emit,
  ) {
    print("Wishlist product clicked");
    // add the selected porduct to wishlistItems
    WishlistItems.wishlistItems.add(event.clickedProduct);
    // items added to wishlist
    emit(HomeProductItemAddedToWishlistActionState());
  }

  // individual add to cart product clicked
  FutureOr<void> homeProductCartButtonClickedEvent(
    HomeProductCartButtonClickedEvent event,
    Emitter<HomeState> emit,
  ) {
    print("Cart product clicked");
    // add the selected porduct to cartItems
    CartItems.cartItems.add(event.clickedProduct);
    // items added to cart
    emit(HomeProductItemAddedToCartActionState());
  }

  // navigate from home screen to wishlist screen
  FutureOr<void> homeWishlistButtonNavigateEvent(
    HomeWishlistButtonNavigateEvent event,
    Emitter<HomeState> emit,
  ) {
    print("Wishlist Screen");
    emit(HomeNavigateToWishlistPageActionState());
  }

  // navigate from home screen to cart screen
  FutureOr<void> homeCartButtonNavigateEvent(
    HomeCartButtonNavigateEvent event,
    Emitter<HomeState> emit,
  ) {
    print("Cart Screen");
    emit(HomeNavigateToCartPageActionState());
  }

  // navigate from home screen to search screen
  FutureOr<void> homeSearchButtonNavigateEvent(
    HomeSearchButtonNavigateEvent event,
    Emitter<HomeState> emit,
  ) {
    print("Search Screen");
    emit(HomeNavigateToSearchPageActionState());
  }
}
