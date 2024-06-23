part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

final class HomeGetOffersEvent extends HomeEvent {}

final class HomeGetCategoriesEvent extends HomeEvent {}
