import 'dart:async';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:farm_infinity/models/CropInput.dart';
import 'package:farm_infinity/models/CropSeason.dart';
import 'package:farm_infinity/models/Farming.dart';
import 'package:farm_infinity/repositories/farmer/crop_input_repo.dart';
import 'package:farm_infinity/repositories/farmer/crop_season_repo.dart';
import 'package:farm_infinity/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

import '../helper/custom_dropdown_options.dart';
import '../models/FarmerApplication.dart';
import '../models/GrownCrop.dart';
import '../repositories/farmer/crop_repo.dart';
import '../widgets/custom_rounded_elevated_button.dart';

class FarmerCropActivityPage extends StatefulWidget {
  final String applicationId;
  final ScrollController scrollController;
  final bool isSecondaryActivity;

  const FarmerCropActivityPage(
      {super.key,
      required this.applicationId,
      required this.scrollController,
      required this.isSecondaryActivity});

  @override
  State<FarmerCropActivityPage> createState() => _FarmerCropActivityPageState();
}

class _FarmerCropActivityPageState extends State<FarmerCropActivityPage> {
  final MultiSelectController _cropSeasonMSController = MultiSelectController();
  late FarmerApplication application;
  late String _farmingRefId;
  late Timer _debounce;

  List<CropSeason> myCropSeasons = [];

  void _fetchSeason() async {
    try {
      // Get the application
      final List<FarmerApplication> applications =
          await Amplify.DataStore.query(FarmerApplication.classType,
              where: FarmerApplication.APPLICATIONID.eq(widget.applicationId));
      FarmerApplication application = applications.first;
      // Important
      _farmingRefId =
          application.farmerApplicationFarmerApplicationToFarmingId!;

      // get the seasons
      CropSeasonRepo cropSeasonRepo = CropSeasonRepo();
      final List cropSeasons =
          await cropSeasonRepo.fetch(_farmingRefId, widget.isSecondaryActivity);
      // assign it to a variable[important for showing nested items]
      myCropSeasons = cropSeasons.cast<CropSeason>();
      ;
      // Convert crops to options for MultiSelectFormField
      List<ValueItem<dynamic>> cropSeasonOptions =
          cropSeasons.map((cropSeason) {
        return ValueItem(
          value: cropSeason.seasonId,
          label: cropSeason.seasonName,
        );
      }).toList();
      // Set options for MultiSelectFormField
      setState(() {
        _cropSeasonMSController.setSelectedOptions(cropSeasonOptions);
        // set the crop and crop-input scrollable dynamic list also
      });
      safePrint('Populate successful');
    } catch (e) {
      safePrint('Error in fetching data: $e');
    }
  }

  /*void _fetchCrops() async {
    // Get the application
    final List<FarmerApplication> applications = await Amplify.DataStore.query(
        FarmerApplication.classType,
        where: FarmerApplication.APPLICATIONID.eq(widget.applicationId));
    application = applications.first;

    final List<Farming> farmings = await Amplify.DataStore.query(
        Farming.classType,
        where: Farming.ID.eq(application.farmerApplicationFarmingRefId) &
            Farming.ISSECONDARYACTIVITY.eq(widget.isSecondaryActivity));

    Farming farming = farmings.first;

    final List<GrownCrop> grownCrops = await Amplify.DataStore.query(
        GrownCrop.classType,
        where: GrownCrop.FARMINGID.eq(farming.id) &
            GrownCrop.ISSECONDARYACTIVITY.eq(widget.isSecondaryActivity));

    myCrops = grownCrops;
  }*/

  void _addCropSeason(List<dynamic> cropSeasons) async {
    try {
      if (cropSeasons.isNotEmpty) {
        CropSeasonRepo cropSeasonRepo = CropSeasonRepo();
        // Check if selected season are already added
        List myCropSeasons = await cropSeasonRepo.fetch(
            _farmingRefId, widget.isSecondaryActivity);

        for (var crpSeason in cropSeasons) {
          bool cropSeasonAlreadyAdded = myCropSeasons.any(
              (existingCropSeason) =>
                  existingCropSeason.seasonName == crpSeason.label &&
                  existingCropSeason.seasonId == crpSeason.value);

          if (!cropSeasonAlreadyAdded) {
            CropSeason cropSeason = CropSeason(
                farmingID: _farmingRefId,
                isSecondaryActivity: widget.isSecondaryActivity,
                seasonName: crpSeason.label,
                seasonId: crpSeason.value);
            await cropSeasonRepo.add(cropSeason);
            safePrint('Crop season added successfully');
          }
        }
      }
    } catch (e) {
      safePrint('Error adding crop season: $e');
    }
  }

  void _deleteCropSeason(cropSeason) async {
    try {
      final delCropSeason = (await Amplify.DataStore.query(CropSeason.classType,
              where: CropSeason.FARMINGID.eq(_farmingRefId) &
                  CropSeason.SEASONID.eq(cropSeason.value) &
                  CropSeason.ISSECONDARYACTIVITY
                      .eq(widget.isSecondaryActivity)))
          .first;

      CropSeasonRepo irrigationRepo = CropSeasonRepo();
      await irrigationRepo.delete(delCropSeason);

      safePrint('Crop season deleted successfully');
    } catch (e) {
      safePrint('Error deleting crop season: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _debounce = Timer(const Duration(seconds: 2), () {});
    _fetchSeason();
  }

  @override
  void dispose() {
    super.dispose();
    _debounce.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Add season',
          style: TextStyle(fontSize: 16, color: AppColor.primaryColor),
        ),
        const SizedBox(
          height: 10,
        ),
        // season multi selector starts here
        MultiSelectDropDown(
          //showClearIcon: false,
          controller: _cropSeasonMSController,
          onOptionSelected: (options) {
            if (!_cropSeasonMSController.isDropdownOpen) {
              _debounce.cancel();
              _debounce = Timer(const Duration(seconds: 2), () {
                _addCropSeason(options);
                _fetchSeason();
                safePrint('selected: ${options.toString()}');
              });
            }
          },
          onOptionRemoved: (index, option) {
            _deleteCropSeason(option);
            _fetchSeason();
            safePrint('deleted: ${option.toString()}');
          },
          maxItems: 3,
          hintColor: AppColor.whiteColor,
          borderColor: AppColor.mediumBlueColor,
          fieldBackgroundColor: AppColor.mediumBlueColor,
          searchEnabled: false,
          /*disabledOptions: const [
                ValueItem(label: 'Option 1', value: '1')
              ],*/
          selectionType: SelectionType.multi,
          chipConfig: const ChipConfig(
              wrapType: WrapType.wrap, backgroundColor: AppColor.primaryColor),
          dropdownHeight: 300,
          optionTextStyle: const TextStyle(fontSize: 16),
          selectedOptionIcon: const Icon(Icons.check_circle),
          options: const <ValueItem>[
            ValueItem(label: 'Kharif Season (July-Oct)', value: 1),
            ValueItem(label: 'Rabi Season (Nov-Feb)', value: 2),
            ValueItem(label: 'Summer Season (March-June)', value: 3),
          ],
        ),
        const SizedBox(
          height: 20.0,
        ),
        // Main dynamic list view for crop and crop input for above selected seasons
        Expanded(
          child: ListView.separated(
            //shrinkWrap: true,
            controller: widget.scrollController,
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                indent: MediaQuery.of(context).size.width * .1,
                endIndent: MediaQuery.of(context).size.width * .1,
              ); // Add a divider between items
            },
            itemCount: myCropSeasons.length,
            itemBuilder: (BuildContext context, index) {
              CropSeason cropSeason = myCropSeasons[index];
              return ScrollableListItem(
                cropSeason: cropSeason,
                scrollController: widget.scrollController,
                isSecondaryActivity: widget.isSecondaryActivity,
              );
            },
          ),
        ),
      ],
    );
  }
}

class ScrollableListItem extends StatefulWidget {
  final CropSeason cropSeason;
  final ScrollController scrollController;
  final bool isSecondaryActivity;

  const ScrollableListItem(
      {super.key,
      required this.cropSeason,
      required this.scrollController,
      required this.isSecondaryActivity});

  @override
  State<ScrollableListItem> createState() => _ScrollableListItemState();
}

class _ScrollableListItemState extends State<ScrollableListItem> {
  final MultiSelectController _cropMSController = MultiSelectController();
  final MultiSelectController _cropInputMSController = MultiSelectController();

  final CropInputRepo cropInputRepo = CropInputRepo();

  late Timer _debounce;

  late CustomDropdownItem selectedUnit;
  late CustomDropdownItem selectedInputTypes;

  List<CustomDropdownItem> inputTypes = <CustomDropdownItem>[
    //CustomDropdownItem(label: 'Select', value: 0),
    CustomDropdownItem(label: 'Urea', value: 1),
    CustomDropdownItem(label: 'DAP', value: 2),
    CustomDropdownItem(label: 'Potash', value: 3),
  ];

  List<CustomDropdownItem> units = <CustomDropdownItem>[
    CustomDropdownItem(label: 'Select', value: 0),
    CustomDropdownItem(label: 'Kg', value: 1),
    CustomDropdownItem(label: 'ltr', value: 2),
  ];

  // Previous

  /*void _fetchSeasons() async {
    // Get the crop seasons
    CropSeasonRepo cropSeasonRepo = CropSeasonRepo();
    final List cropSeasons = await cropSeasonRepo.fetch(
        widget.g, widget.isSecondaryActivity);
    // Convert crop season to options for MultiSelectFormField
    List<ValueItem<dynamic>> cropSeasonOptions = cropSeasons.map((cropSeason) {
      return ValueItem(
        value: cropSeason.seasonId,
        label: cropSeason.seasonName,
      );
    }).toList();

    setState(() {
      _cropSeasonMSController.setSelectedOptions(cropSeasonOptions);
    });
  }*/

  /*void _addCropSeason(List<dynamic> cropSeasons) async {
    try {
      if (cropSeasons.isNotEmpty) {
        CropSeasonRepo cropSeasonRepo = CropSeasonRepo();
        // Check if selected season are already added
        List myCropSeasons = await cropSeasonRepo.fetch(
            widget.grownCrop.id, widget.isSecondaryActivity);

        for (var crpSeason in cropSeasons) {
          bool cropSeasonAlreadyAdded = myCropSeasons.any(
              (existingCropSeason) =>
                  existingCropSeason.seasonName == crpSeason.label &&
                  existingCropSeason.seasonId == crpSeason.value);

          if (!cropSeasonAlreadyAdded) {
            CropSeason cropSeason = CropSeason(
                growncropID: widget.grownCrop.id,
                isSecondaryActivity: widget.isSecondaryActivity,
                seasonName: crpSeason.label,
                seasonId: crpSeason.value);
            await cropSeasonRepo.add(cropSeason);
            safePrint('Crop season added successfully');
          }
        }
      }
    } catch (e) {
      safePrint('Error adding crop season: $e');
    }
  }*/

  /*void _deleteCropSeason(cropSeason) async {
    try {
      final delCropSeason = (await Amplify.DataStore.query(CropSeason.classType,
              where: CropSeason.GROWNCROPID.eq(widget.grownCrop.id) &
                  CropSeason.SEASONID.eq(cropSeason.value) &
                  CropSeason.ISSECONDARYACTIVITY
                      .eq(widget.isSecondaryActivity)))
          .first;

      CropSeasonRepo irrigationRepo = CropSeasonRepo();
      await irrigationRepo.delete(delCropSeason);

      safePrint('Crop season deleted successfully');
    } catch (e) {
      safePrint('Error deleting crop season: $e');
    }
  }*/

  // Previous

  void _fetchGrownCrops() async {
    // Get the crop seasons
    CropRepo cropRepo = CropRepo();
    final List crops =
        await cropRepo.fetch(widget.cropSeason.id, widget.isSecondaryActivity);
    // Convert crop season to options for MultiSelectFormField
    List<ValueItem<dynamic>> cropOptions = crops.map((crops) {
      return ValueItem(
        value: crops.cropId,
        label: crops.cropName,
      );
    }).toList();

    setState(() {
      _cropMSController.setSelectedOptions(cropOptions);
    });
  }

  void _addCrop(List<dynamic> crops) async {
    try {
      if (crops.isNotEmpty) {
        CropRepo cropRepo = CropRepo();
        // Check if selected crops are already added
        List myCrops = await cropRepo.fetch(
            widget.cropSeason.id, widget.isSecondaryActivity);

        for (var crop in crops) {
          bool cropAlreadyAdded = myCrops.any((existingCrop) =>
              existingCrop.cropName == crop.label &&
              existingCrop.cropId == crop.value);

          if (!cropAlreadyAdded) {
            GrownCrop grownCrop = GrownCrop(
              cropseasonID: widget.cropSeason.id,
              isSecondaryActivity: widget.isSecondaryActivity,
              cropName: crop.label,
              cropId: crop.value,
            );
            await cropRepo.add(grownCrop);
            safePrint('Crops added successfully');
          }
        }
      }
    } catch (e) {
      safePrint('Error adding crops: $e');
    }
  }

  void _deleteCrop(crop) async {
    try {
      final delCrop = (await Amplify.DataStore.query(GrownCrop.classType,
              where: GrownCrop.CROPSEASONID.eq(widget.cropSeason.id) &
                  GrownCrop.CROPID.eq(crop.value) &
                  GrownCrop.ISSECONDARYACTIVITY.eq(widget.isSecondaryActivity)))
          .first;
      // This does not work
      /*GrownCrop grownCrop = GrownCrop(
        farmingID: _farmingRefId,
        cropName: crop.label,
        cropId: crop.value,
      );*/

      CropRepo cropRepo = CropRepo();
      await cropRepo.delete(delCrop);

      safePrint('Crops deleted successfully');
    } catch (e) {
      safePrint('Error deleting crops: $e');
    }
  }

  // Crop input starts here

  List<Widget> cropInputRows = [];

  void _deleteCropInputWidgetRow(int index) {
    setState(() {
      cropInputRows.removeAt(index);
    });
  }

  void _fetchCropInputType() async {
    // Get the crop input type
    CropInputRepo cropInputRepo = CropInputRepo();
    final List myCropInputs = await cropInputRepo.fetch(widget.cropSeason.id,
        isSecondaryActivity: widget.isSecondaryActivity);

    List<ValueItem<dynamic>> selectedCropInputOptions =
        myCropInputs.map((cropInput) {
      return ValueItem(
        value: cropInput.inputId,
        label: cropInput.inputName,
      );
    }).toList();
    // set the crop input multi-selector dropdown
    setState(() {
      _cropInputMSController.setSelectedOptions(selectedCropInputOptions);
    });
    // add tex field
    for (var cropInput in myCropInputs) {
      setState(() {
        cropInputRows.add(fetchedCropInputRow(cropInput.inputName, cropInput));
      });
    }
  }

  void _addCropInputType(List<dynamic> cropInputs) async {
    try {
      if (cropInputs.isNotEmpty) {
        CropInputRepo cropInputRepo = CropInputRepo();
        // Check if selected season are already added
        List myCropInputs = await cropInputRepo.fetch(widget.cropSeason.id,
            isSecondaryActivity: widget.isSecondaryActivity);

        for (var crpInput in cropInputs) {
          bool cropInputAlreadyAdded = myCropInputs.any((existingCropInput) =>
              existingCropInput.inputName == crpInput.label &&
              existingCropInput.inputId == crpInput.value);

          if (!cropInputAlreadyAdded) {
            CropInput cropInput = CropInput(
                cropseasonID: widget.cropSeason.id,
                isSecondaryActivity: widget.isSecondaryActivity,
                inputName: crpInput.label,
                inputId: crpInput.value);
            await cropInputRepo.create(cropInput);
            safePrint('Crop input added successfully');

            setState(() {
              cropInputRows.add(addCropInputRow(crpInput.label, cropInput.id));
            });
          }
        }
      }
    } catch (e) {
      safePrint('Error adding crop input: $e');
    }
  }

  void _addOrUpdateCropInputType(CustomDropdownItem item) async {
    try {
      CropInputRepo cropInputRepo = CropInputRepo();
      // Check if selected season are already added
      List myCropInputs = await cropInputRepo.fetch(widget.cropSeason.id);

      bool cropInputAlreadyAdded = myCropInputs.any((existingCropInput) =>
          existingCropInput.inputName == item.label &&
          existingCropInput.inputId == item.value);

      if (!cropInputAlreadyAdded) {
        CropInput cropInput = CropInput(
            cropseasonID: widget.cropSeason.id,
            inputName: item.label,
            inputId: item.value,
            isSecondaryActivity: widget.isSecondaryActivity);
        await cropInputRepo.create(cropInput);
        safePrint('Crop input added successfully');
      }

      if (myCropInputs.isEmpty) {
      } else {
        await cropInputRepo.autoUpdateField(
            widget.cropSeason.id, 'inputName', item.label);
        await cropInputRepo.autoUpdateField(
            widget.cropSeason.id, 'inputId', item.value);
      }
    } catch (e) {
      safePrint('Error adding crop season: $e');
    }
  }

  void _deleteCropInputType(index, cropInput) async {
    try {
      final delCropInput = (await Amplify.DataStore.query(CropInput.classType,
              where: CropInput.CROPSEASONID.eq(widget.cropSeason.id) &
                  CropInput.INPUTID.eq(cropInput.value) &
                  CropInput.ISSECONDARYACTIVITY.eq(widget.isSecondaryActivity)))
          .first;

      CropInputRepo cropInputRepo = CropInputRepo();
      await cropInputRepo.delete(delCropInput);
      safePrint('Crop input deleted successfully');

      _deleteCropInputWidgetRow(index);
    } catch (e) {
      safePrint('Error deleting crop input: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    selectedInputTypes = inputTypes[0];
    _debounce = Timer(const Duration(seconds: 2), () {});
    //_fetchSeasons();
    _fetchGrownCrops();
    _fetchCropInputType();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius:
              BorderRadius.circular(20.0), // Adjust the radius as needed
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                widget.cropSeason.seasonName.toString(),
                style:
                    const TextStyle(fontSize: 16, color: AppColor.primaryColor),
              ),
              const SizedBox(
                height: 10.0,
              ),
              // Multi-selector grown crops starts here
              MultiSelectDropDown(
                //showClearIcon: false,
                controller: _cropMSController,
                onOptionSelected: (options) {
                  if (!_cropMSController.isDropdownOpen) {
                    _debounce.cancel();
                    _debounce = Timer(const Duration(seconds: 2), () {
                      _addCrop(options);
                      safePrint('selected: ${options.toString()}');
                    });
                  }
                },
                onOptionRemoved: (index, option) {
                  _deleteCrop(option);
                  safePrint('deleted: ${option.toString()}');
                },
                options: const <ValueItem>[
                  ValueItem(label: 'Rice', value: 1),
                  ValueItem(label: 'Potato', value: 2),
                  ValueItem(label: 'Ginger', value: 3),
                  ValueItem(label: 'Tomato', value: 4),
                  ValueItem(label: 'Onion', value: 5),
                  ValueItem(label: 'Cabbage', value: 6),
                ],
                maxItems: 5,
                searchEnabled: true,
                hint: 'Add crops',
                hintColor: AppColor.whiteColor,
                borderColor: AppColor.mediumBlueColor,
                fieldBackgroundColor: AppColor.mediumBlueColor,
                selectionType: SelectionType.multi,
                chipConfig: const ChipConfig(
                    wrapType: WrapType.wrap,
                    backgroundColor: AppColor.primaryColor),
                dropdownHeight: 300,
                optionTextStyle: const TextStyle(fontSize: 16),
                selectedOptionIcon: const Icon(Icons.check_circle),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                'Add crop input',
                style: TextStyle(fontSize: 16, color: AppColor.primaryColor),
              ),
              // Crop input starts here
              MultiSelectDropDown(
                //showClearIcon: false,
                controller: _cropInputMSController,
                onOptionSelected: (options) {
                  if (!_cropInputMSController.isDropdownOpen) {
                    _debounce.cancel();
                    _debounce = Timer(const Duration(seconds: 2), () {
                      _addCropInputType(options);
                      safePrint('selected: ${options.toString()}');
                    });
                  }
                },
                onOptionRemoved: (index, option) {
                  _deleteCropInputType(index, option);
                  safePrint('deleted: ${option.toString()}');
                },
                options: const <ValueItem>[
                  ValueItem(label: 'Urea', value: 1),
                  ValueItem(label: 'DAP', value: 2),
                  ValueItem(label: 'Potash', value: 3),
                ],
                //maxItems: 3,
                hint: 'Add input type',
                hintColor: AppColor.whiteColor,
                borderColor: AppColor.mediumBlueColor,
                fieldBackgroundColor: AppColor.mediumBlueColor,
                selectionType: SelectionType.multi,
                chipConfig: const ChipConfig(
                    wrapType: WrapType.wrap,
                    backgroundColor: AppColor.primaryColor),
                dropdownHeight: 200,
                optionTextStyle: const TextStyle(fontSize: 16),
                selectedOptionIcon: const Icon(Icons.check_circle),
              ),
              const SizedBox(
                height: 10.0,
              ),
              // Display added dropdown rows
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: cropInputRows.length,
                itemBuilder: (BuildContext context, int index) {
                  return cropInputRows[index];
                },
              ),
              const SizedBox(
                height: 10.0,
              ),
              /*CustomRoundedElevatedButton(
                text: 'ADD CROP INPUT',
                onPressed: () {
                  setState(() {
                    cropInputRows.add(addCropInputRow());
                  });
                },
                backgroundColor: AppColor.primaryColor,
                textColor: AppColor.whiteColor,
                fontSize: 16,
                width: 0,
                height: 20,
              ),*/
            ],
          ),
        ),
      ),
    );
  }

  Widget addCropInputRow(String groupLabel, String cropInputId) {
    final TextEditingController cropInputQuantityFieldController =
        TextEditingController();
    CustomDropdownItem selectedUnit = units[0];

    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.only(bottom: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: AppColor.mediumBlueColor,
            width: 2.0,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              groupLabel,
              style:
                  const TextStyle(fontSize: 12.0, color: AppColor.primaryColor),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                /*MultiSelectDropDown(
                  showClearIcon: false,
                  controller: _cropInputMSController,
                  onOptionSelected: (options) {
                    if (!_cropInputMSController.isDropdownOpen) {
                      _debounce.cancel();
                      _debounce = Timer(const Duration(seconds: 2), () {
                        _addCropInputType(options);
                        safePrint('selected: ${options.toString()}');
                      });
                    }
                  },
                  onOptionRemoved: (index, option) {
                    _deleteCropInputType(index, option);
                    safePrint('deleted: ${option.toString()}');
                  },
                  options: const <ValueItem>[
                    ValueItem(label: 'Urea', value: 1),
                    ValueItem(label: 'DAP', value: 2),
                    ValueItem(label: 'Potash', value: 3),
                  ],
                  //maxItems: 3,
                  hint: 'Add input type',
                  hintColor: AppColor.whiteColor,
                  borderColor: AppColor.mediumBlueColor,
                  fieldBackgroundColor: AppColor.mediumBlueColor,
                  selectionType: SelectionType.single,
                  chipConfig: const ChipConfig(
                      wrapType: WrapType.wrap,
                      backgroundColor: AppColor.primaryColor),
                  dropdownHeight: 200,
                  optionTextStyle: const TextStyle(fontSize: 16),
                  selectedOptionIcon: const Icon(Icons.check_circle),
                ),*/
                /*Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  height: 45.0,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: AppColor.mediumBlueColor,
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<CustomDropdownItem>(
                      value: selectedInputTypes,
                      onChanged: (CustomDropdownItem? newItem) async {
                        if (newItem != null) {
                          _debounce.cancel();
                          _debounce = Timer(const Duration(seconds: 2), () {
                            _addOrUpdateCropInputType(newItem);
                            safePrint('selected: ${newItem.toString()}');
                          });
                          setState(() {
                            selectedUnit = newItem;
                          });
                        }
                      },
                      items: inputTypes
                          .map<DropdownMenuItem<CustomDropdownItem>>(
                              (CustomDropdownItem item) {
                        return DropdownMenuItem<CustomDropdownItem>(
                          value: item,
                          child: Text(item.label),
                        );
                      }).toList(),
                    ),
                  ),
                ),*/
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: cropInputQuantityFieldController,
                  keyboardType: TextInputType.number,
                  onChanged: (text) {
                    _debounce.cancel();
                    _debounce = Timer(
                      const Duration(seconds: 2),
                      () {
                        final String text =
                            cropInputQuantityFieldController.text.toString();
                        safePrint('your text: $text');
                        cropInputRepo.updateField(
                            cropInputId, 'inputQuantity', double.parse(text),
                            isSecondaryActivity: widget.isSecondaryActivity);
                      },
                    );
                  },
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                    filled: true,
                    fillColor: AppColor.mediumBlueColor,
                    border: OutlineInputBorder(
                      // width: 0.0 produces a thin "hairline" border
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                      borderSide: BorderSide.none,
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    hintStyle: TextStyle(decoration: TextDecoration.none),
                    hintText: 'Enter amount',
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  height: 45.0,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: AppColor.mediumBlueColor,
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<CustomDropdownItem>(
                      value: selectedUnit,
                      onChanged: (CustomDropdownItem? newItem) async {
                        if (newItem != null) {
                          await cropInputRepo.updateField(
                              cropInputId, 'quantityUnit', newItem.label,
                              isSecondaryActivity: widget.isSecondaryActivity);
                          await cropInputRepo.updateField(
                              cropInputId, 'quantityUnitId', newItem.value,
                              isSecondaryActivity: widget.isSecondaryActivity);
                          setState(() {
                            selectedUnit = newItem;
                          });
                        }
                      },
                      items: units.map<DropdownMenuItem<CustomDropdownItem>>(
                          (CustomDropdownItem item) {
                        return DropdownMenuItem<CustomDropdownItem>(
                          value: item,
                          child: Text(item.label),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                // Delete icon button
                /*IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    // Handle delete button press
                    _deleteCropInputWidgetRow(cropInputRows.length - 1);
                  },
                ),*/
              ],
            ),
          ],
        ),
      );
    });
  }

  Widget fetchedCropInputRow(String groupLabel, CropInput cropInput) {
    final TextEditingController cropInputQuantityFieldController =
        TextEditingController();

    late CustomDropdownItem selectedUnit;

    cropInputQuantityFieldController.text =
        cropInput.inputQuantity?.toString() ?? '';

    int fetchedUnitId = cropInput.quantityUnitId ??
        0; // replace 0 with a default value if necessary
    CustomDropdownItem fetchedUnit = units.firstWhere(
        (unit) => unit.value == fetchedUnitId,
        orElse: () => units[0]);

    selectedUnit = fetchedUnit;

    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.only(bottom: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: AppColor.mediumBlueColor,
            width: 2.0,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              groupLabel,
              style:
                  const TextStyle(fontSize: 12.0, color: AppColor.primaryColor),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                /*MultiSelectDropDown(
                  showClearIcon: false,
                  controller: _cropInputMSController,
                  onOptionSelected: (options) {
                    if (!_cropInputMSController.isDropdownOpen) {
                      _debounce.cancel();
                      _debounce = Timer(const Duration(seconds: 2), () {
                        _addCropInputType(options);
                        safePrint('selected: ${options.toString()}');
                      });
                    }
                  },
                  onOptionRemoved: (index, option) {
                    _deleteCropInputType(option);
                    safePrint('deleted: ${option.toString()}');
                  },
                  options: const <ValueItem>[
                    ValueItem(label: 'Urea', value: 1),
                    ValueItem(label: 'DAP', value: 2),
                    ValueItem(label: 'Potash', value: 3),
                  ],
                  //maxItems: 3,
                  hint: 'Add input type',
                  hintColor: AppColor.whiteColor,
                  borderColor: AppColor.mediumBlueColor,
                  fieldBackgroundColor: AppColor.mediumBlueColor,
                  selectionType: SelectionType.single,
                  chipConfig: const ChipConfig(
                      wrapType: WrapType.wrap,
                      backgroundColor: AppColor.primaryColor),
                  dropdownHeight: 200,
                  optionTextStyle: const TextStyle(fontSize: 16),
                  selectedOptionIcon: const Icon(Icons.check_circle),
                ),*/
                /*Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  height: 45.0,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: AppColor.mediumBlueColor,
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<CustomDropdownItem>(
                      value: selectedInputTypes,
                      onChanged: (CustomDropdownItem? newItem) async {
                        if (newItem != null) {
                          _debounce.cancel();
                          _debounce = Timer(const Duration(seconds: 2), () {
                            _addOrUpdateCropInputType(newItem);
                            safePrint('selected: ${newItem.toString()}');
                          });
                          setState(() {
                            selectedUnit = newItem;
                          });
                        }
                      },
                      items: inputTypes
                          .map<DropdownMenuItem<CustomDropdownItem>>(
                              (CustomDropdownItem item) {
                        return DropdownMenuItem<CustomDropdownItem>(
                          value: item,
                          child: Text(item.label),
                        );
                      }).toList(),
                    ),
                  ),
                ),*/
                const SizedBox(
                  height: 10.0,
                ),
                TextField(
                  controller: cropInputQuantityFieldController,
                  keyboardType: TextInputType.number,
                  onChanged: (text) {
                    _debounce.cancel();
                    _debounce = Timer(
                      const Duration(seconds: 2),
                      () {
                        final String text =
                            cropInputQuantityFieldController.text.toString();
                        safePrint('your text: $text');
                        cropInputRepo.updateField(
                            cropInput.id, 'inputQuantity', double.parse(text),
                            isSecondaryActivity: widget.isSecondaryActivity);
                      },
                    );
                  },
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                    filled: true,
                    fillColor: AppColor.mediumBlueColor,
                    border: OutlineInputBorder(
                      // width: 0.0 produces a thin "hairline" border
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                      borderSide: BorderSide.none,
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    hintStyle: TextStyle(decoration: TextDecoration.none),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  height: 45.0,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: AppColor.mediumBlueColor,
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<CustomDropdownItem>(
                      value: selectedUnit,
                      onChanged: (CustomDropdownItem? newItem) async {
                        if (newItem != null) {
                          await cropInputRepo.updateField(
                              cropInput.id, 'quantityUnit', newItem.label,
                              isSecondaryActivity: widget.isSecondaryActivity);
                          await cropInputRepo.updateField(
                              cropInput.id, 'quantityUnitId', newItem.value,
                              isSecondaryActivity: widget.isSecondaryActivity);
                          setState(() {
                            selectedUnit = newItem;
                          });
                        }
                      },
                      items: units.map<DropdownMenuItem<CustomDropdownItem>>(
                          (CustomDropdownItem item) {
                        return DropdownMenuItem<CustomDropdownItem>(
                          value: item,
                          child: Text(item.label),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                // Delete icon button
                /*IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              // Handle delete button press
              _deleteCropInputWidgetRow(cropInputRows.length - 1);
            },
          ),*/
              ],
            ),
          ],
        ),
      );
    });
  }
}
