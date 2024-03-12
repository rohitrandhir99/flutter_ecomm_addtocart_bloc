part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

// initial cart event
class CartInitialEvent extends CartEvent {}

class CartRemoveFromCartEvent extends CartEvent {
  final HomeProductDataModel productDataModel;

  CartRemoveFromCartEvent({
    required this.productDataModel,
  });
}
