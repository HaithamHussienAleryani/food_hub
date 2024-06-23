part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeGetOffersLoading extends HomeState {}

final class HomeGetOffersFailed extends HomeState {
  final String message;
  HomeGetOffersFailed(this.message);
}

final class HomeGetOffersSuccess extends HomeState {
  final List<OfferModel> offers;

  HomeGetOffersSuccess(this.offers);
}

final class HomeGetCategoriesLoading extends HomeState {}

final class HomeGetCategoriesFailed extends HomeState {
  final String message;
  HomeGetCategoriesFailed(this.message);
}

final class HomeGetCategoriesSuccess extends HomeState {
  final List<CategoryModel> categories;

  HomeGetCategoriesSuccess(this.categories);
}
