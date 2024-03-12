part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistEvent {}

// initial event for the wishlist
class WishlistInitialEvent extends WishlistEvent {}

// remove ite, ==m from wishlist
class WishlistRemoveWishlistEvent extends WishlistEvent {
  final HomeProductDataModel productModel;

  WishlistRemoveWishlistEvent({required this.productModel});
}
