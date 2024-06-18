import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/core/common/widgets/form_input.dart';
import 'package:food_hub/core/common/widgets/horizontal_space.dart';
import 'package:food_hub/core/common/widgets/vertical_space.dart';
import 'package:food_hub/core/theme/app_platte.dart';
import 'package:food_hub/core/utils/get_translation.dart';
import 'package:food_hub/features/home/presentation/widgets/pick_location_item.dart';
import 'package:go_router/go_router.dart';
import 'package:mapbox_search/mapbox_search.dart';

class PickLocationBottomSheet extends StatefulWidget {
  const PickLocationBottomSheet({super.key});

  @override
  State<PickLocationBottomSheet> createState() =>
      _PickLocationBottomSheetState();
}

class _PickLocationBottomSheetState extends State<PickLocationBottomSheet> {
  bool showLocations = false;
  GlobalKey formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();
  ScrollController scrollController = ScrollController();

  var geocoding = GeoCoding(
    country: "YE",
    limit: 5,
    types: [PlaceType.address, PlaceType.place],
  );

  Future<ApiResponse<List<MapBoxPlace>>> getPlaces() {
    return geocoding.getPlaces(
      "Sanaa",
    );
  }

  void getPlacesLocations() async {
    SearchBoxAPI search = SearchBoxAPI(limit: 6, country: 'SA', types: [
      PlaceType.place,
      PlaceType.address,
    ]);
    ApiResponse<SuggestionResponse> searchPlace = await search.getSuggestions(
      "coffee",
    );
    searchPlace.fold((success) {
      debugPrint(success.suggestions.toString());
      for (var suggestion in success.suggestions) {
        debugPrint("${suggestion.name}\n${suggestion.fullAddress}");
      }
    }, (failure) {
      debugPrint(failure.error ?? "Error");
    });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), getPlacesLocations);
    focusNode.addListener(() {
      if (!focusNode.hasFocus) {
        setState(() {
          showLocations = false;
        });
      } else {
        if (controller.text.isNotEmpty) {
          setState(() {
            showLocations = true;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => focusNode.unfocus(),
      child: Container(
        height: 0.9.sh,
        width: 1.sw,
        decoration: const BoxDecoration(color: AppPallet.whiteColor),
        child: Padding(
          padding: EdgeInsets.all(16.sp),
          child: SizedBox(
            height: 1.sh,
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  VerticalSpace(space: 5.h),
                  Stack(
                    children: [
                      Center(
                        child: Text(
                          "Enter your location",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.sp),
                        ),
                      ),
                      PositionedDirectional(
                        end: 0,
                        child: InkWell(
                            overlayColor: WidgetStateColor.transparent,
                            onTap: () => {context.pop()},
                            child: Text(
                              "cancel",
                              style: TextStyle(
                                  color: AppPallet.primary, fontSize: 13.sp),
                            )),
                      ),
                    ],
                  ),
                  VerticalSpace(space: 15.h),
                  Stack(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Form(
                            key: formKey,
                            child: FormInput(
                              focusNode: focusNode,
                              controller: controller,
                              title: getTranslation(context).addressName,
                              hideTitle: true,
                              onChange: (text) {
                                if (text.length != 0) {
                                  setState(() {
                                    showLocations = true;
                                  });
                                } else {
                                  setState(() {
                                    showLocations = false;
                                  });
                                }
                              },
                            ),
                          ),
                          VerticalSpace(space: 15.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PickLocationItem(
                                icon: Icons.location_searching,
                                title: "Use current location",
                                onTap: () {},
                              ),
                              HorizontalSpace(space: 10.w),
                              PickLocationItem(
                                icon: Icons.location_on_outlined,
                                title: "Pick another location",
                                onTap: () {},
                              ),
                            ],
                          ),
                          VerticalSpace(space: 25.h),
                          Text(
                            "My locations",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16.sp),
                          ),
                          const MyLocationItem(
                            name: "Location name",
                            location: "Some random value",
                            selected: true,
                          ),
                          const MyLocationItem(
                            name: "Location name",
                            location: "Some random value",
                          ),
                          const MyLocationItem(
                            name: "Location name",
                            location: "Some random value",
                          ),
                          const MyLocationItem(
                            name: "Location name",
                            location: "Some random value",
                          ),
                          const MyLocationItem(
                            name: "Location name",
                            location: "Some random value",
                          ),
                          const MyLocationItem(
                            name: "Location name",
                            location: "Some random value",
                          ),
                          const MyLocationItem(
                            name: "Location name",
                            location: "Some random value",
                          ),
                          const MyLocationItem(
                            name: "Location name",
                            location: "Some random value",
                          ),
                        ],
                      ),
                      Positioned(
                        top: 50,
                        left: 0,
                        right: 0,
                        child: AnimatedContainer(
                          width: 0.9.sw,
                          constraints: BoxConstraints(
                            maxHeight: showLocations ? 0.45.sh : 0.sh,
                          ),
                          duration: const Duration(milliseconds: 500),
                          child: AnimatedOpacity(
                            opacity: showLocations ? 1 : 0,
                            duration: const Duration(milliseconds: 300),
                            child: Card(
                              shadowColor:
                                  AppPallet.shadowColor.withOpacity(0.3),
                              elevation: 10,
                              color: AppPallet.whiteColor,
                              child: ListView(
                                shrinkWrap: true,
                                padding: EdgeInsets.symmetric(horizontal: 14.h),
                                children: const [
                                  MyLocationItem(
                                    name: "Location name",
                                    location: "Some random value",
                                  ),
                                  MyLocationItem(
                                    name: "Location name",
                                    location: "Some random value",
                                  ),
                                  MyLocationItem(
                                    name: "Location name",
                                    location: "Some random value",
                                  ),
                                  MyLocationItem(
                                    name: "Location name",
                                    location: "Some random value",
                                  ),
                                  MyLocationItem(
                                    name: "Location name",
                                    location: "Some random value",
                                  ),
                                  MyLocationItem(
                                    name: "Location name",
                                    location: "Some random value",
                                  ),
                                  MyLocationItem(
                                    name: "Location name",
                                    location: "Some random value",
                                  ),
                                  MyLocationItem(
                                    name: "Location name",
                                    location: "Some random value",
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyLocationItem extends StatelessWidget {
  final bool selected, showLeading;
  final String name, location;

  const MyLocationItem({
    super.key,
    this.selected = false,
    required this.name,
    required this.location,
    this.showLeading = true,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minTileHeight: 50.h,
      title: Text(
        name,
        style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
      ),
      horizontalTitleGap: 10.w,
      subtitle: Text(
        location,
        style: TextStyle(fontSize: 12.sp),
      ),
      contentPadding: EdgeInsets.zero,
      leading: showLeading
          ? Icon(
              Icons.location_on,
              size: 25.sp,
              color: !selected ? Colors.black12 : AppPallet.primary,
            )
          : const SizedBox(),
    );
  }
}
