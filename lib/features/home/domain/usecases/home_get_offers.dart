import 'package:food_hub/core/errors/failures.dart';
import 'package:food_hub/core/usecase/usecase.dart';
import 'package:food_hub/features/home/data/models/OfferModel.dart';
import 'package:food_hub/features/home/domain/repositories/home_repository.dart';
import 'package:fpdart/fpdart.dart';

class HomeGetOffers implements UseCase<List<OfferModel>, NoParams> {
  final HomeRepository homeRepository;

  HomeGetOffers(this.homeRepository);

  @override
  Future<Either<Failure, List<OfferModel>>> call(NoParams params) async {
    return await homeRepository.getOffers();
  }
}
