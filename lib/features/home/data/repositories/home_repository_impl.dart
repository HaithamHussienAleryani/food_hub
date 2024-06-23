import 'package:food_hub/core/errors/failures.dart';
import 'package:food_hub/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:food_hub/features/home/data/models/CategoryModel.dart';
import 'package:food_hub/features/home/data/models/OfferModel.dart';
import 'package:food_hub/features/home/domain/repositories/home_repository.dart';
import 'package:fpdart/fpdart.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;
  const HomeRepositoryImpl(this.homeRemoteDataSource);
  @override
  Future<Either<Failure, List<OfferModel>>> getOffers() async {
    try {
      return right(await homeRemoteDataSource.getOffers());
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CategoryModel>>> getCategories() async {
    try {
      return right(await homeRemoteDataSource.getCategories());
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
