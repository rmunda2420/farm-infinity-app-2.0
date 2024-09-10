import 'dart:async';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:farm_infinity/models/Equipment.dart';
import 'package:farm_infinity/models/GrownCrop.dart';
import 'package:farm_infinity/models/Irrigation.dart';
import 'package:farm_infinity/repositories/farmer/crop_repo.dart';
import 'package:farm_infinity/repositories/farmer/equipment_repo.dart';
import 'package:farm_infinity/repositories/farmer/farming_repo.dart';
import 'package:farm_infinity/repositories/farmer/irrigation_repo.dart';
import 'package:farm_infinity/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import '../helper/custom_dropdown_options.dart';
import '../models/FarmerApplication.dart';
import '../models/Farming.dart';

class FarmerFarmingActivityPage extends StatefulWidget {
  final String applicationId;
  final ScrollController scrollController;
  final bool isSecondaryActivity;

  const FarmerFarmingActivityPage(
      {super.key,
      required this.applicationId,
      required this.scrollController,
      required this.isSecondaryActivity});

  @override
  State<FarmerFarmingActivityPage> createState() =>
      _FarmerFarmingActivityPageState();
}

class _FarmerFarmingActivityPageState extends State<FarmerFarmingActivityPage> {
  final _formKey = GlobalKey<FormState>();

  late String _farmingRefId;
  late Timer _debounce;

  // final MultiSelectController _cropMSController = MultiSelectController();
  final MultiSelectController _irrigationTypeMSController =
      MultiSelectController();
  final MultiSelectController _equipmentMSController = MultiSelectController();

  final FarmingRepo farmingRepo = FarmingRepo();

  final TextEditingController landOwnedFieldController =
      TextEditingController();
  final TextEditingController cultivationAreaFieldController =
      TextEditingController();

  late CustomDropdownItem selectedUnit;
  late bool _cropInsuranceStatus;
  late bool _postHarvestAndStorageStatus;
  List<CustomDropdownItem> units = <CustomDropdownItem>[
    CustomDropdownItem(label: 'Select', value: 0),
    CustomDropdownItem(label: 'Acres', value: 1),
    CustomDropdownItem(label: 'Bighas', value: 2),
  ];

  void _populateData() async {
    try {
      // Get the application
      final List<FarmerApplication> applications =
          await Amplify.DataStore.query(FarmerApplication.classType,
              where: FarmerApplication.APPLICATIONID.eq(widget.applicationId));
      FarmerApplication application = applications.first;

      // Get the farming details of the application
      final List<Farming> farmings = await Amplify.DataStore.query(
        Farming.classType,
        where: Farming.ID.eq(application.farmerApplicationFarmerApplicationToFarmingId) &
            Farming.ISSECONDARYACTIVITY.eq(widget.isSecondaryActivity),
      );

      if (farmings.isNotEmpty) {
        final Farming farming = farmings.first;

        // Important
        _farmingRefId = application.farmerApplicationFarmerApplicationToFarmingId!;

        // Set text field values using controllers
        landOwnedFieldController.text = farming.landOwned?.toString() ?? '';
        cultivationAreaFieldController.text =
            farming.cultivationArea?.toString() ?? '';

        // Get the crops
        /*CropRepo cropRepo = CropRepo();
        final List myCrops =
            await cropRepo.fetch(_farmingRefId, widget.isSecondaryActivity);
        // Convert crops to options for MultiSelectFormField
        List<ValueItem<dynamic>> cropOptions = myCrops.map((crop) {
          return ValueItem(
            value: crop.cropId,
            label: crop.cropName,
          );
        }).toList();*/

        // Get the irrigation type
        IrrigationRepo irrigationRepo = IrrigationRepo();
        final List myIrrigationTypes = await irrigationRepo.fetch(
            _farmingRefId, widget.isSecondaryActivity);
        List<ValueItem<dynamic>> irrigationOptions =
            myIrrigationTypes.map((irrigationType) {
          return ValueItem(
            value: irrigationType.irrigationTypeId,
            label: irrigationType.irrigationType,
          );
        }).toList();

        // Get the equipments
        EquipmentRepo equipmentRepo = EquipmentRepo();
        final List myEquipments = await equipmentRepo.fetch(
            _farmingRefId, widget.isSecondaryActivity);
        List<ValueItem<dynamic>> equipmentsOptions =
            myEquipments.map((equipment) {
          return ValueItem(
            value: equipment.equipmentId,
            label: equipment.equipmentName,
          );
        }).toList();

        // Get the initial unit value from the farming object
        int fetchedUnitId = farming.areaUnitId ??
            0; // replace 0 with a default value if necessary
        CustomDropdownItem fetchedUnit = units.firstWhere(
            (unit) => unit.value == fetchedUnitId,
            orElse: () =>
                units[0]); // replace units[0] with a default item if not found

        // Set options for MultiSelectFormField
        setState(() {
          //_cropMSController.setSelectedOptions(cropOptions);
          _irrigationTypeMSController.setSelectedOptions(irrigationOptions);
          _equipmentMSController.setSelectedOptions(equipmentsOptions);
          selectedUnit = fetchedUnit;
          _postHarvestAndStorageStatus =
              farming.isPostHarvestStorageAvailable ?? false;
          _cropInsuranceStatus = farming.isCropInsured ?? false;
        });
        safePrint('Populate successful');
      } else {
        // Create farming activity (new form)
        final Farming farmingActivity =
            Farming(isSecondaryActivity: widget.isSecondaryActivity);
        FarmingRepo farmDataRepo = FarmingRepo();
        await farmDataRepo.create(farmingActivity);

        // Hold the application in FarmerApplication model
        final newApplication = application.copyWith(
            farmerApplicationFarmerApplicationToFarmingId: farmingActivity.id);
        await Amplify.DataStore.save(newApplication);

        // Important
        _farmingRefId = farmingActivity.id;
      }
    } catch (e) {
      safePrint('Error in fetching farming data: $e');
    }
  }

  /*void _addCrop(List<dynamic> crops) async {
    try {
      if (crops.isNotEmpty) {
        CropRepo cropRepo = CropRepo();
        // Check if selected crops are already added
        List myCrops =
            await cropRepo.fetch(_farmingRefId, widget.isSecondaryActivity);

        for (var crop in crops) {
          bool cropAlreadyAdded = myCrops.any((existingCrop) =>
              existingCrop.cropName == crop.label &&
              existingCrop.cropId == crop.value);

          if (!cropAlreadyAdded) {
            GrownCrop grownCrop = GrownCrop(
              farmingID: _farmingRefId,
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
  }*/

  /*void _deleteCrop(crop) async {
    try {
      final delCrop = (await Amplify.DataStore.query(GrownCrop.classType,
              where: GrownCrop.FARMINGID.eq(_farmingRefId) &
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
  }*/

  void _addEquipment(List<dynamic> equipments) async {
    try {
      if (equipments.isNotEmpty) {
        EquipmentRepo equipmentRepo = EquipmentRepo();
        // Check if selected crops are already added
        List myEquipments = await equipmentRepo.fetch(
            _farmingRefId, widget.isSecondaryActivity);

        for (var equip in equipments) {
          bool equipmentAlreadyAdded = myEquipments.any((existingEquipment) =>
              existingEquipment.equipmentName == equip.label &&
              existingEquipment.equipmentId == equip.value);

          if (!equipmentAlreadyAdded) {
            Equipment equipment = Equipment(
              farmingID: _farmingRefId,
              isSecondaryActivity: widget.isSecondaryActivity,
              equipmentName: equip.label,
              equipmentId: equip.value,
            );
            await equipmentRepo.add(equipment);
            safePrint('Equipment added successfully');
          }
        }
      }
    } catch (e) {
      safePrint('Error adding crops: $e');
    }
  }

  void _deleteEquipment(equipment) async {
    try {
      final delEquipment = (await Amplify.DataStore.query(Equipment.classType,
              where: Equipment.FARMINGID.eq(_farmingRefId) &
                  Equipment.EQUIPMENTID.eq(equipment.value) &
                  Equipment.ISSECONDARYACTIVITY.eq(widget.isSecondaryActivity)))
          .first;
      // This does not work
      /*GrownCrop grownCrop = GrownCrop(
        farmingID: _farmingRefId,
        cropName: crop.label,
        cropId: crop.value,
      );*/

      EquipmentRepo equipmentRepo = EquipmentRepo();
      await equipmentRepo.delete(delEquipment);

      safePrint('Equipment deleted successfully');
    } catch (e) {
      safePrint('Error deleting Equipment: $e');
    }
  }

  void _addIrrigation(List<dynamic> irrigationTypes) async {
    try {
      if (irrigationTypes.isNotEmpty) {
        IrrigationRepo irrigationRepo = IrrigationRepo();
        // Check if selected crops are already added
        List myIrrigationTypes = await irrigationRepo.fetch(
            _farmingRefId, widget.isSecondaryActivity);

        for (var irrType in irrigationTypes) {
          bool irrigationTypeAlreadyAdded = myIrrigationTypes.any(
              (existingIrrigationType) =>
                  existingIrrigationType.irrigationType == irrType.label &&
                  existingIrrigationType.irrigationTypeId == irrType.value);

          if (!irrigationTypeAlreadyAdded) {
            Irrigation irrigation = Irrigation(
              farmingID: _farmingRefId,
              isSecondaryActivity: widget.isSecondaryActivity,
              irrigationType: irrType.label,
              irrigationTypeId: irrType.value,
            );
            await irrigationRepo.add(irrigation);
            safePrint('Irrigation type added successfully');
          }
        }
      }
    } catch (e) {
      safePrint('Error adding irrigation type: $e');
    }
  }

  void _deleteIrrigation(irrigationType) async {
    try {
      final delIrrigationType = (await Amplify.DataStore.query(
              Irrigation.classType,
              where: Irrigation.FARMINGID.eq(_farmingRefId) &
                  Irrigation.IRRIGATIONTYPEID.eq(irrigationType.value) &
                  Irrigation.ISSECONDARYACTIVITY
                      .eq(widget.isSecondaryActivity)))
          .first;
      // This does not work
      /*GrownCrop grownCrop = GrownCrop(
        farmingID: _farmingRefId,
        cropName: crop.label,
        cropId: crop.value,
      );*/

      IrrigationRepo irrigationRepo = IrrigationRepo();
      await irrigationRepo.delete(delIrrigationType);

      safePrint('Irrigation type deleted successfully');
    } catch (e) {
      safePrint('Error deleting irrigation type: $e');
    }
  }

  @override
  void dispose() {
    super.dispose();
    _debounce.cancel();
  }

  @override
  void initState() {
    super.initState();
    selectedUnit = units[0];
    _cropInsuranceStatus = false;
    _postHarvestAndStorageStatus = false;
    _debounce = Timer(const Duration(seconds: 2), () {});
    _populateData();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: widget.scrollController,
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Land owned',
                  style: TextStyle(fontSize: 16, color: AppColor.primaryColor),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: landOwnedFieldController,
                        keyboardType: TextInputType.number,
                        onChanged: (text) {
                          _debounce.cancel();
                          _debounce = Timer(
                            const Duration(seconds: 2),
                            () {
                              final String text =
                                  landOwnedFieldController.text.toString();
                              safePrint('your text: $text');
                              farmingRepo.autoUpdateField(_farmingRefId,
                                  'landOwned', double.parse(text),
                                  isSecondaryActivity:
                                      widget.isSecondaryActivity);
                            },
                          );
                        },
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 16.0),
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
                    ),
                    const SizedBox(width: 10),
                    // Drop down list
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
                              await farmingRepo.autoUpdateField(
                                  _farmingRefId, 'areaUnit', newItem.label,
                                  isSecondaryActivity:
                                      widget.isSecondaryActivity);
                              await farmingRepo.autoUpdateField(
                                  _farmingRefId, 'areaUnitId', newItem.value,
                                  isSecondaryActivity:
                                      widget.isSecondaryActivity);
                              setState(() {
                                selectedUnit = newItem;
                              });
                            }
                          },
                          items: units
                              .map<DropdownMenuItem<CustomDropdownItem>>(
                                  (CustomDropdownItem item) {
                            return DropdownMenuItem<CustomDropdownItem>(
                              value: item,
                              child: Text(item.label),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            // Add crops
            /*const Text(
              'Crops grown',
              style: TextStyle(fontSize: 16, color: AppColor.primaryColor),
            ),
            const SizedBox(
              height: 10,
            ),*/
            /*MultiSelectDropDown(
              showClearIcon: false,
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
              hintColor: AppColor.whiteColor,
              borderColor: AppColor.mediumBlueColor,
              fieldBackgroundColor: AppColor.mediumBlueColor,
              searchEnabled: true,
              /*disabledOptions: const [
                ValueItem(label: 'Option 1', value: '1')
              ],*/
              selectionType: SelectionType.multi,
              chipConfig: const ChipConfig(
                  wrapType: WrapType.wrap,
                  backgroundColor: AppColor.primaryColor),
              dropdownHeight: 300,
              optionTextStyle: const TextStyle(fontSize: 16),
              selectedOptionIcon: const Icon(Icons.check_circle),
            ),*/
            const SizedBox(
              height: 20,
            ),
            // Cultivation area starts here
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Cultivation area',
                  style: TextStyle(fontSize: 16, color: AppColor.primaryColor),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: cultivationAreaFieldController,
                        keyboardType: TextInputType.number,
                        onChanged: (text) {
                          _debounce.cancel();
                          _debounce = Timer(
                            const Duration(seconds: 2),
                            () {
                              final String text = cultivationAreaFieldController
                                  .text
                                  .toString();
                              safePrint('your text: $text');
                              farmingRepo.autoUpdateField(_farmingRefId,
                                  'cultivationArea', double.parse(text),
                                  isSecondaryActivity:
                                      widget.isSecondaryActivity);
                            },
                          );
                        },
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 16.0),
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
                    ),
                    const SizedBox(width: 10),
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
                          onChanged: (CustomDropdownItem? newItem) {},
                          items: units
                              .map<DropdownMenuItem<CustomDropdownItem>>(
                                  (CustomDropdownItem item) {
                            return DropdownMenuItem<CustomDropdownItem>(
                              value: item,
                              child: Text(item.label),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Irrigation facilities',
              style: TextStyle(fontSize: 16, color: AppColor.primaryColor),
            ),
            const SizedBox(
              height: 10,
            ),
            MultiSelectDropDown(
              //showClearIcon: true,
              controller: _irrigationTypeMSController,
              onOptionSelected: (options) {
                if (!_irrigationTypeMSController.isDropdownOpen) {
                  _debounce.cancel();
                  _debounce = Timer(const Duration(seconds: 2), () {
                    _addIrrigation(options);
                    safePrint('selected: ${options.toString()}');
                  });
                }
              },
              onOptionRemoved: (index, option) {
                _deleteIrrigation(option);
                safePrint('deleted: ${option.toString()}');
              },
              options: const <ValueItem>[
                ValueItem(label: 'Drip Irrigation', value: 1),
                ValueItem(label: 'Hydroponics', value: 2),
                ValueItem(label: 'Rainfed', value: 3),
                ValueItem(label: 'Rain Harvesting/Pond', value: 4),
                ValueItem(label: 'River/Canal Nearby', value: 5),
                ValueItem(label: 'Solar Water Pumps', value: 6),
                ValueItem(label: 'Sprinklers', value: 7),
                ValueItem(label: 'Water Pumps', value: 8),
                ValueItem(label: 'Other', value: 9),
              ],
              maxItems: 5,
              hintColor: AppColor.whiteColor,
              borderColor: AppColor.mediumBlueColor,
              fieldBackgroundColor: AppColor.mediumBlueColor,
              searchEnabled: true,
              /*disabledOptions: const [
                ValueItem(label: 'Option 1', value: '1')
              ],*/
              selectionType: SelectionType.multi,
              chipConfig: const ChipConfig(
                  wrapType: WrapType.wrap,
                  backgroundColor: AppColor.primaryColor),
              dropdownHeight: 300,
              optionTextStyle: const TextStyle(fontSize: 16),
              selectedOptionIcon: const Icon(Icons.check_circle),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Equipments',
              style: TextStyle(fontSize: 16, color: AppColor.primaryColor),
            ),
            const SizedBox(
              height: 10,
            ),
            MultiSelectDropDown(
              //showClearIcon: true,
              controller: _equipmentMSController,
              onOptionSelected: (options) {
                if (!_equipmentMSController.isDropdownOpen) {
                  _debounce.cancel();
                  _debounce = Timer(const Duration(seconds: 2), () {
                    _addEquipment(options);
                    safePrint('selected: ${options.toString()}');
                  });
                }
              },
              onOptionRemoved: (index, option) {
                _deleteEquipment(option);
                safePrint('deleted: ${option.toString()}');
              },
              options: const <ValueItem>[
                ValueItem(label: 'Harvester', value: 1),
                ValueItem(label: 'Plough-Cattle Driven', value: 2),
                ValueItem(label: 'Power Tiller', value: 3),
                ValueItem(label: 'Seeder', value: 4),
                ValueItem(label: 'Tractor', value: 5),
                ValueItem(label: 'Weeder', value: 6),
                ValueItem(label: 'Other', value: 7),
              ],
              maxItems: 5,
              hintColor: AppColor.whiteColor,
              borderColor: AppColor.mediumBlueColor,
              fieldBackgroundColor: AppColor.mediumBlueColor,
              searchEnabled: true,
              /*disabledOptions: const [
                ValueItem(label: 'Option 1', value: '1')
              ],*/
              selectionType: SelectionType.multi,
              chipConfig: const ChipConfig(
                  wrapType: WrapType.wrap,
                  backgroundColor: AppColor.primaryColor),
              dropdownHeight: 300,
              optionTextStyle: const TextStyle(fontSize: 16),
              selectedOptionIcon: const Icon(Icons.check_circle),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Expanded(
                  child: Text(
                    'Is Post harvest and storage facility available?',
                    style:
                        TextStyle(fontSize: 16, color: AppColor.primaryColor),
                  ),
                ),
                FlutterSwitch(
                  activeColor: AppColor.primaryColor,
                  inactiveColor: AppColor.mediumBlueColor,
                  width: 60.0,
                  height: 30.0,
                  valueFontSize: 14.0,
                  toggleSize: 30.0,
                  value: _postHarvestAndStorageStatus,
                  borderRadius: 30.0,
                  padding: 6.0,
                  showOnOff: false,
                  onToggle: (val) async {
                    await farmingRepo.autoUpdateField(
                        _farmingRefId, 'isPostHarvestStorageAvailable', val,
                        isSecondaryActivity: widget.isSecondaryActivity);
                    setState(() {
                      _postHarvestAndStorageStatus = val;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Expanded(
                  child: Text(
                    'Is crop insured',
                    style:
                        TextStyle(fontSize: 16, color: AppColor.primaryColor),
                  ),
                ),
                FlutterSwitch(
                  activeColor: AppColor.primaryColor,
                  inactiveColor: AppColor.mediumBlueColor,
                  width: 60.0,
                  height: 30.0,
                  valueFontSize: 14.0,
                  toggleSize: 30.0,
                  value: _cropInsuranceStatus,
                  borderRadius: 30.0,
                  padding: 6.0,
                  showOnOff: false,
                  onToggle: (val) async {
                    await farmingRepo.autoUpdateField(
                        _farmingRefId, 'isCropInsured', val,
                        isSecondaryActivity: widget.isSecondaryActivity);
                    setState(() {
                      _cropInsuranceStatus = val;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 40.0,
            ),
          ],
        ),
      ),
    );
  }
}
