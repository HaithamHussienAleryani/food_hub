import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_hub/features/home/data/models/OfferModel.dart';

abstract interface class HomeRemoteDataSource {
  Future<List<OfferModel>> getOffers();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final FirebaseFirestore fireStore;

  const HomeRemoteDataSourceImpl(this.fireStore);

  @override
  Future<List<OfferModel>> getOffers() async {
    CollectionReference offers = fireStore.collection('offers');
    var data = await offers.get();
    debugPrint("data is $data");
    return [];
  }
}
