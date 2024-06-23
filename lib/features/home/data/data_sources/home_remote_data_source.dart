import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:food_hub/features/home/data/models/CategoryModel.dart';
import 'package:food_hub/features/home/data/models/OfferModel.dart';

abstract interface class HomeRemoteDataSource {
  Future<List<OfferModel>> getOffers();
  Future<List<CategoryModel>> getCategories();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final FirebaseFirestore fireStore;

  const HomeRemoteDataSourceImpl(this.fireStore);

  @override
  Future<List<OfferModel>> getOffers() async {
    CollectionReference offers = fireStore.collection('offers');
    var data = await offers.get();
    List<OfferModel> offersList = [];
    debugPrint("docs length ${data.docs.length}");
    for (var doc in data.docs) {
      offersList.add(OfferModel.fromJson(doc));
    }
    return offersList;
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    CollectionReference categories = fireStore.collection('categories');
    var data = await categories.get();
    List<CategoryModel> categoryList = [];
    debugPrint("docs length ${data.docs.length}");
    for (var doc in data.docs) {
      categoryList.add(CategoryModel.fromJson(doc));
    }
    return categoryList;
  }
}
