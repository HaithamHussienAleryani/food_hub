import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_hub/core/usecase/usecase.dart';
import 'package:food_hub/features/home/data/models/CategoryModel.dart';
import 'package:food_hub/features/home/data/models/OfferModel.dart';
import 'package:food_hub/features/home/domain/usecases/home_get_categories.dart';
import 'package:food_hub/features/home/domain/usecases/home_get_offers.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeGetOffers _homeGetOffers;
  final HomeGetCategories _homeGetCategories;

  HomeBloc(
      {required HomeGetOffers homeOffers,
      required HomeGetCategories homeCategories})
      : _homeGetOffers = homeOffers,
        _homeGetCategories = homeCategories,
        super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});
    on<HomeGetOffersEvent>(homeGetOffers);
    on<HomeGetCategoriesEvent>(homeGetCategories);
  }

  Future<void> homeGetCategories(
      HomeGetCategoriesEvent event, Emitter emit) async {
    emit(HomeGetCategoriesLoading());
    final response = await _homeGetCategories(NoParams());
    response.fold((failure) {
      emit(HomeGetCategoriesFailed(failure.message));
    }, (offers) {
      emit(HomeGetCategoriesSuccess(offers));
    });
  }

  Future<void> homeGetOffers(HomeGetOffersEvent event, Emitter emit) async {
    emit(HomeGetOffersLoading());
    final response = await _homeGetOffers(NoParams());
    response.fold((failure) {
      emit(HomeGetOffersFailed(failure.message));
    }, (offers) {
      emit(HomeGetOffersSuccess(offers));
    });
  }
}
