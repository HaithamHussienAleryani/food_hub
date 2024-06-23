import 'package:food_hub/core/errors/failures.dart';
import 'package:food_hub/core/usecase/usecase.dart';
import 'package:food_hub/features/home/data/models/CategoryModel.dart';
import 'package:food_hub/features/home/domain/repositories/home_repository.dart';
import 'package:fpdart/fpdart.dart';

class HomeGetCategories implements UseCase<List<CategoryModel>, NoParams> {
  final HomeRepository homeRepository;

  HomeGetCategories(this.homeRepository);

  @override
  Future<Either<Failure, List<CategoryModel>>> call(NoParams params) async {
    return await homeRepository.getCategories();
  }
}
