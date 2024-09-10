import 'dart:async';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:farm_infinity/repositories/farmer/application_repo.dart';
import 'package:farm_infinity/screens/farmer_crop_activity_page.dart';
import 'package:farm_infinity/screens/farmer_farming_activity_page.dart';
import 'package:farm_infinity/styles/colors.dart';
import 'package:farm_infinity/widgets/custom_rounded_elevated_button.dart';
import 'package:farm_infinity/widgets/farmer_reg_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/FarmerApplication.dart';
import 'farmer_poultry_activity_page.dart';
import 'farmer_secondary_activity_page.dart';

class FarmerActivityPage extends StatefulWidget {
  final String applicationId;

  const FarmerActivityPage({super.key, required this.applicationId});

  @override
  State<FarmerActivityPage> createState() => _FarmerActivityPageState();
}

class _FarmerActivityPageState extends State<FarmerActivityPage> {
  bool isFarmingActivityButtonClicked = false;
  bool isDairyActivityButtonClicked = false;
  bool isFisheryActivityButtonClicked = false;
  bool isPoultryActivityButtonClicked = false;
  bool isPiggeryActivityButtonClicked = false;
  bool isPlantationActivityButtonClicked = false;
  late Timer _debounce;
  late List _secPages = [];

  void getSecondaryActivity(String secondaryActivity, StateSetter setState) {
    setState(() {
      _secPages.clear();
      safePrint('callback');
      switch (secondaryActivity) {
        case 'None':
          _secPages = [];
          break;
        case 'Farming':
          _secPages = ['Farming Page 1', 'Farming Page 2', 'Farming Page 3'];
          break;
        case 'Dairy':
          _secPages = ['Dairy Page 1', 'Dairy Page 2'];
          break;
        case 'Fishery':
          _secPages = ['Fishery Page 1', 'Fishery Page 2', 'Fishery Page 3'];
          break;
        case 'Poultry':
          _secPages = ['Poultry Page 1'];
          break;
        case 'Piggery':
          _secPages = ['Piggery Page 1', 'Piggery Page 2', 'Piggery Page 3'];
          break;
        case 'plantation':
          _secPages = [
            'plantation Page 1',
            'plantation Page 2',
            'plantation Page 3'
          ];
          break;
        default:
          _secPages = [];
      }
    });
  }

  void _onModalClosed(String activity) {
    setState(
      () {
        // switch (activity) {
        //   case 'Farming':
        //     isFarmingActivityButtonClicked = false;
        //     break;
        //   case 'Dairy':
        //     isDairyActivityButtonClicked = false;
        //     break;
        //   case 'Fishery':
        //     isFisheryActivityButtonClicked = false;
        //     break;
        //   case 'Poultry':
        //     isPoultryActivityButtonClicked = false;
        //     break;
        //   case 'Piggery':
        //     isPiggeryActivityButtonClicked = false;
        //     break;
        //   case 'Plantation':
        //     isPlantationActivityButtonClicked = false;
        //     break;
        //   default:
        //     break;
        // }
        _fetchActivity();
      },
    );
  }

  void _showActivityDetails(String activity) {
    List<String> pages;

    switch (activity) {
      case 'Farming':
        pages = ['Farming Page 1', 'Farming Page 2', 'Farming Page 3'];
        break;
      case 'Dairy':
        pages = ['Dairy Page 1', 'Dairy Page 2', 'Dairy Page 3'];
        break;
      case 'Fishery':
        pages = ['Fishery Page 1', 'Fishery Page 2', 'Fishery Page 3'];
        break;
      case 'Poultry':
        pages = ['Poultry Page 1', 'Poultry Page 2', 'Poultry Page 3'];
        break;
      case 'Piggery':
        pages = ['Piggery Page 1', 'Piggery Page 2', 'Piggery Page 3'];
        break;
      case 'plantation':
        pages = ['plantation Page 1', 'plantation Page 2', 'plantation Page 3'];
        break;
      default:
        pages = [];
        break;
    }

    int currentPage = 0;
    PageController pageController = PageController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      enableDrag: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return DraggableScrollableSheet(
              expand: false,
              initialChildSize: 0.4,
              minChildSize: 0.2,
              maxChildSize: .9,
              snap: true,
              snapSizes: const [.5, .6],
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: PageView.builder(
                          itemCount: pages.length + _secPages.length,
                          controller: pageController,
                          onPageChanged: (int page) {
                            setState(() {
                              currentPage = page;
                              safePrint(
                                  'current page on page change: $currentPage');
                            });
                          },
                          itemBuilder: (BuildContext context, int index) {
                            safePrint('index: $index');
                            if (index < pages.length) {
                              safePrint('One');
                              return _buildActivityPage(pages[index], activity,
                                  scrollController, setState);
                            } else {
                              safePrint('two');
                              return _buildSecondaryActivityPage(
                                  _secPages[index - pages.length],
                                  activity,
                                  scrollController);
                            }
                          },
                        ),
                      ),
                      CustomRoundedElevatedButton(
                        text: currentPage == pages.length + _secPages.length - 1
                            ? 'Finish'
                            : 'Next',
                        onPressed: () async {
                          safePrint('current page: $currentPage');
                          safePrint('page length: $pages.length');
                          safePrint('secPage length: $_secPages.length');

                          if (currentPage <
                              pages.length + _secPages.length - 1) {
                            safePrint('yes');
                            pageController.animateToPage(
                              currentPage + 1,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                            safePrint('current page: $currentPage');
                          } else {
                            safePrint('no');
                            Navigator.pop(
                                context); // Close the modal on 'Finish'
                          }
                        },
                        backgroundColor: AppColor.accentColor,
                        textColor: AppColor.whiteColor,
                        fontSize: 22,
                        width: 160,
                        height: 44,
                      ),
                    ],
                  ),
                );
              });
        });
      },
    ).then((value) {
      _onModalClosed(activity);
    });
  }

  Widget _buildActivityPage(String page, String currentActivity,
      ScrollController scrollController, StateSetter setState) {
    switch (page) {
      case 'Farming Page 1':
        return FarmerFarmingActivityPage(
          applicationId: widget.applicationId,
          scrollController: scrollController,
          isSecondaryActivity: false,
        );
      case 'Farming Page 2':
        return FarmerCropActivityPage(
          applicationId: widget.applicationId,
          scrollController: scrollController,
          isSecondaryActivity: false,
        );
      case 'Farming Page 3':
        return FarmerSecondaryActivityPage(
          applicationId: widget.applicationId,
          activity: currentActivity,
          isSecondaryActivity: false,
          secActCallback: getSecondaryActivity,
          setState: setState,
        );
      case 'Dairy Page 1':
        return const FarmerPoultryActivityPage();
      // Add more cases as needed
      default:
        return Container(); // Default or fallback widget
    }
  }

  Widget _buildSecondaryActivityPage(
      String page, String currentActivity, ScrollController scrollController) {
    switch (page) {
      case 'Farming Page 1':
        return FarmerFarmingActivityPage(
          applicationId: widget.applicationId,
          scrollController: scrollController,
          isSecondaryActivity: true,
        );
      case 'Farming Page 2':
        return FarmerCropActivityPage(
          applicationId: widget.applicationId,
          scrollController: scrollController,
          isSecondaryActivity: true,
        );
      case 'Poultry Page 1':
        return const FarmerPoultryActivityPage();
      case 'Dairy Page 1':
        return const FarmerPoultryActivityPage();
      case 'Dairy Page 2':
        return const FarmerPoultryActivityPage();
      // Add more cases as needed
      default:
        return Container(); // Default or fallback widget
    }
  }

  Future<void> _fetchActivity() async {
    ApplicationRepo appRepo = ApplicationRepo();
    List<FarmerApplication>? applications =
        await appRepo.fetchApplication(widget.applicationId);
    FarmerApplication application = applications!.first;
    setState(() {
      switch (application.activityId) {
        case 1:
          //_showActivityDetails('Farming');
          isFarmingActivityButtonClicked = !isFarmingActivityButtonClicked;
        case 2:
          isDairyActivityButtonClicked = !isDairyActivityButtonClicked;
        default:
          break;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _debounce = Timer(const Duration(seconds: 2), () {});
    _fetchActivity();
  }

  @override
  void dispose() {
    super.dispose();
    _debounce.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 80,
            ),
            const SizedBox(
              height: 100,
              child: FarmerRegTimeline(),
            ),
            const Text(
              'Property owned by farmer',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: AppColor.whiteColor),
            ),
            const SizedBox(
              height: 10,
            ),
            // Grid of Rounded Buttons
            Expanded(
              child: GridView.count(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 40.0,
                children: [
                  // Button farming
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isFarmingActivityButtonClicked =
                              !isFarmingActivityButtonClicked;
                          // add/update the activity id for that particular application
                          _debounce =
                              Timer(const Duration(seconds: 2), () async {
                            ApplicationRepo applicationRepo = ApplicationRepo();
                            await applicationRepo.autoUpdateField(
                                widget.applicationId, 'activityId', 1);
                          });
                        });
                        _showActivityDetails('Farming');
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            /*if (states.contains(MaterialState.pressed)) {
                            return AppColor
                                .whiteColor; // On click, change to white
                          }
                          return AppColor.primaryColor;*/
                            if (isFarmingActivityButtonClicked) {
                              return AppColor
                                  .whiteColor; // On click, change to white
                            }
                            return AppColor.primaryColor; // Default color
                          },
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            side: const BorderSide(
                                color: AppColor.whiteColor), // White border
                          ),
                        ),
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        height: 100,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: 40,
                                width: 40,
                                child: SvgPicture.asset(
                                  'assets/icons/icon_activity_farming.svg',
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Farming',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: isFarmingActivityButtonClicked
                                      ? Colors.black87
                                      : AppColor.whiteColor,
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Button dairy
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isDairyActivityButtonClicked =
                              !isDairyActivityButtonClicked;
                        });
                        _showActivityDetails('Dairy');
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (isDairyActivityButtonClicked) {
                              return AppColor
                                  .whiteColor; // On click, change to white
                            }
                            return AppColor.primaryColor; // Default color
                          },
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            side: const BorderSide(
                                color: AppColor.whiteColor), // White border
                          ),
                        ),
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        height: 100,
                        child: AspectRatio(
                          aspectRatio: .5,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  height: 40,
                                  width: 40,
                                  child: SvgPicture.asset(
                                    'assets/icons/icon_activity_goat.svg',
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Dairy',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: isDairyActivityButtonClicked
                                        ? Colors.black87
                                        : AppColor.whiteColor,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Button fishery
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isFisheryActivityButtonClicked =
                              !isFisheryActivityButtonClicked;
                        });
                        _showActivityDetails('Fishery');
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (isFisheryActivityButtonClicked) {
                              return AppColor
                                  .whiteColor; // On click, change to white
                            }
                            return AppColor.primaryColor; // Default color
                          },
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            side: const BorderSide(
                                color: AppColor.whiteColor), // White border
                          ),
                        ),
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        height: 100,
                        child: AspectRatio(
                          aspectRatio: .7,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  height: 40,
                                  width: 40,
                                  child: SvgPicture.asset(
                                    'assets/icons/icon_activity_fishery.svg',
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Fishery',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: isFisheryActivityButtonClicked
                                        ? Colors.black87
                                        : AppColor.whiteColor,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Button poultry
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isPoultryActivityButtonClicked =
                              !isPoultryActivityButtonClicked;
                        });
                        _showActivityDetails('Poultry');
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (isPoultryActivityButtonClicked) {
                              return AppColor
                                  .whiteColor; // On click, change to white
                            }
                            return AppColor.primaryColor; // Default color
                          },
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            side: const BorderSide(
                                color: AppColor.whiteColor), // White border
                          ),
                        ),
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        height: 100,
                        child: AspectRatio(
                          aspectRatio: .7,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  height: 40,
                                  width: 40,
                                  child: SvgPicture.asset(
                                    'assets/icons/icon_activity_poultry.svg',
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Poultry',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: isPoultryActivityButtonClicked
                                        ? Colors.black87
                                        : AppColor.whiteColor,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Piggery
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isPiggeryActivityButtonClicked =
                              !isPiggeryActivityButtonClicked;
                        });
                        _showActivityDetails('Piggery');
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (isPiggeryActivityButtonClicked) {
                              return AppColor
                                  .whiteColor; // On click, change to white
                            }
                            return AppColor.primaryColor; // Default color
                          },
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            side: const BorderSide(
                                color: AppColor.whiteColor), // White border
                          ),
                        ),
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        height: 100,
                        child: AspectRatio(
                          aspectRatio: .7,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  height: 40,
                                  width: 40,
                                  child: SvgPicture.asset(
                                    'assets/icons/icon_activity_poultry.svg',
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Piggery',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: isPiggeryActivityButtonClicked
                                        ? Colors.black87
                                        : AppColor.whiteColor,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Plantation
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isPlantationActivityButtonClicked =
                              !isPlantationActivityButtonClicked;
                        });
                        _showActivityDetails('Plantation');
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (isPlantationActivityButtonClicked) {
                              return AppColor
                                  .whiteColor; // On click, change to white
                            }
                            return AppColor.primaryColor; // Default color
                          },
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            side: const BorderSide(
                                color: AppColor.whiteColor), // White border
                          ),
                        ),
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        height: 100,
                        child: AspectRatio(
                          aspectRatio: .7,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  height: 40,
                                  width: 40,
                                  child: SvgPicture.asset(
                                    'assets/icons/icon_activity_poultry.svg',
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Planta',
                                  softWrap: true,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: isPlantationActivityButtonClicked
                                        ? Colors.black87
                                        : AppColor.whiteColor,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
