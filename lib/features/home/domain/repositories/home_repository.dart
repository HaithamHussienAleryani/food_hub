import 'package:food_hub/core/errors/failures.dart';
import 'package:food_hub/features/home/data/models/CategoryModel.dart';
import 'package:food_hub/features/home/data/models/OfferModel.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class HomeRepository {
  Future<Either<Failure, List<OfferModel>>> getOffers();
  Future<Either<Failure, List<CategoryModel>>> getCategories();
}
