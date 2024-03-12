part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

abstract class CartActionState extends CartState {}

final class CartInitial extends CartState {}

class CartSuccessState extends CartState {
  final List<HomeProductDataModel> cartItems;

  CartSuccessState({required this.cartItems});
}

// item to be removed from the cart
class CartRemoveFromCartSuccessActionState extends CartActionState {}
