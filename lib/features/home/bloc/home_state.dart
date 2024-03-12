part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

// fetch products when the app loads initially
class HomeInitial extends HomeState {}

// show a loading indicator when the app loads
// show it till the app fetches data successfully
class HomeLoadingState extends HomeState {}

// data fetched successfully
class HomeLoadedSuccessState extends HomeState {
  // access the list of products
  final List<HomeProductDataModel> products;

  HomeLoadedSuccessState({required this.products});
}

// error while fetching data
class HomeLoadedErrorState extends HomeState {}

// navigation to other screen
// it extends the HomeActionState
class HomeNavigateToWishlistPageActionState extends HomeActionState {}

class HomeNavigateToCartPageActionState extends HomeActionState {}

class HomeNavigateToSearchPageActionState extends HomeActionState {}

// show dialog box when the product is selected for add to wishlist
class HomeProductItemAddedToWishlistActionState extends HomeActionState {}

// show dialog box when the product is selected for add to wishlist
class HomeProductItemAddedToCartActionState extends HomeActionState {}
