import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_app_using_bloc/data/cart_items.dart';
import 'package:store_app_using_bloc/models/home_product_data_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    // --------------------- Events --------------------- //
    on<CartInitialEvent>(cartInitialEvent);

    on<CartRemoveFromCartEvent>(cartRemoveFromCartEvent);
  }

  // --------------------- Methods --------------------- //
  FutureOr<void> cartInitialEvent(
    CartInitialEvent event,
    Emitter<CartState> emit,
  ) {
    emit(CartSuccessState(cartItems: CartItems.cartItems));
  }

  FutureOr<void> cartRemoveFromCartEvent(
    CartRemoveFromCartEvent event,
    Emitter<CartState> emit,
  ) {
    // run a fuction to remove the product model
    CartItems.cartItems.remove(event.productDataModel);

    // emit cartItemRemovedState
    emit(CartSuccessState(cartItems: CartItems.cartItems));

    // remove from cart success
    emit(CartRemoveFromCartSuccessActionState());
  }
}
