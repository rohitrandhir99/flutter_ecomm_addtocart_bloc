import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_app_using_bloc/data/wishlist_items.dart';
import 'package:store_app_using_bloc/models/home_product_data_model.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    // ------------------------------- Events------------------------------- //
    on<WishlistInitialEvent>(wishlistInitialEvent);

    on<WishlistRemoveWishlistEvent>(wishlistRemoveWishlistEvent);
  }

  // ------------------------------- Methods ------------------------------- //
  FutureOr<void> wishlistInitialEvent(
    WishlistInitialEvent event,
    Emitter<WishlistState> emit,
  ) {
    // states
    emit(WishlistSuccessState(wishlistItems: WishlistItems.wishlistItems));
  }

  // remove the wishlist from wishlist screen
  FutureOr<void> wishlistRemoveWishlistEvent(
    WishlistRemoveWishlistEvent event,
    Emitter<WishlistState> emit,
  ) {
    WishlistItems.wishlistItems.remove(event.productModel);
    emit(WishlistSuccessState(wishlistItems: WishlistItems.wishlistItems));
    emit(WishlistRemoveItemFromWishlistSuccessActionState());
  }
}
