part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

// when the user clicks the add to wishlist button which
// is present inside the product_tile_card
class HomeProductWishlistButtonClickedEvent extends HomeEvent {
  final HomeProductDataModel clickedProduct;

  HomeProductWishlistButtonClickedEvent({
    required this.clickedProduct,
  });
}

// when the user clicks the add to cart button which
// is present inside the product_tile_card
class HomeProductCartButtonClickedEvent extends HomeEvent {
  final HomeProductDataModel clickedProduct;

  HomeProductCartButtonClickedEvent({
    required this.clickedProduct,
  });
}

// navigate from home screen to wishlist screen
class HomeWishlistButtonNavigateEvent extends HomeEvent {}

// navigate from home screen to cart screen
class HomeCartButtonNavigateEvent extends HomeEvent {}

// navigate from home screen to cart screen
class HomeSearchButtonNavigateEvent extends HomeEvent {}
