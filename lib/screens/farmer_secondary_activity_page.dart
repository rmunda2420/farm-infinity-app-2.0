import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:chip_list/chip_list.dart';
import 'package:farm_infinity/helper/activity_item.dart';
import 'package:farm_infinity/models/FarmerApplication.dart';
import 'package:farm_infinity/models/FarmerSecondaryActivity.dart';
import 'package:farm_infinity/repositories/farmer/farmer_secondary_activity_repo.dart';
import 'package:farm_infinity/styles/colors.dart';
import 'package:flutter/material.dart';

class FarmerSecondaryActivityPage extends StatefulWidget {
  final String applicationId;
  final String activity;
  final bool isSecondaryActivity;
  final Function secActCallback;
  final StateSetter setState;

  const FarmerSecondaryActivityPage(
      {super.key,
      required this.applicationId,
      required this.activity,
      required this.isSecondaryActivity,
      required this.secActCallback,
      required this.setState});

  @override
  State<FarmerSecondaryActivityPage> createState() =>
      _FarmerSecondaryActivityPageState();
}

class _FarmerSecondaryActivityPageState
    extends State<FarmerSecondaryActivityPage> {
  late String _farmerSecondaryActivityRefId;

  int currentIndex = 0;
  List<dynamic> secActivityList = [];
  List<String> chipLabels = [];

  void _populate() async {
    switch (widget.activity) {
      case 'Farming':
        secActivityList = [
          ActivityItem(label: 'None', key: 0),
          ActivityItem(label: 'Dairy', key: 2),
          ActivityItem(label: 'Fishery', key: 3),
          ActivityItem(label: 'Poultry', key: 4),
          ActivityItem(label: 'Piggery', key: 5),
          ActivityItem(label: 'Plantation', key: 6),
        ];
        break;
      case 'Dairy':
        secActivityList = [
          ActivityItem(label: 'None', key: 0),
          ActivityItem(label: 'Farming', key: 1),
          ActivityItem(label: 'Fishery', key: 3),
          ActivityItem(label: 'Poultry', key: 4),
          ActivityItem(label: 'Piggery', key: 5),
          ActivityItem(label: 'Plantation', key: 6),
        ];
        break;
      case 'Fishery':
        secActivityList = [
          ActivityItem(label: 'None', key: 0),
          ActivityItem(label: 'Farming', key: 1),
          ActivityItem(label: 'Dairy', key: 2),
          ActivityItem(label: 'Poultry', key: 4),
          ActivityItem(label: 'Piggery', key: 5),
          ActivityItem(label: 'Plantation', key: 6),
        ];
        break;
      case 'Poultry':
        secActivityList = [
          ActivityItem(label: 'None', key: 0),
          ActivityItem(label: 'Farming', key: 1),
          ActivityItem(label: 'Dairy', key: 2),
          ActivityItem(label: 'Fishery', key: 3),
          ActivityItem(label: 'Piggery', key: 5),
          ActivityItem(label: 'Plantation', key: 6),
        ];
        break;
      case 'Piggery':
        secActivityList = [
          ActivityItem(label: 'None', key: 0),
          ActivityItem(label: 'Farming', key: 1),
          ActivityItem(label: 'Dairy', key: 2),
          ActivityItem(label: 'Fishery', key: 3),
          ActivityItem(label: 'Poultry', key: 4),
          ActivityItem(label: 'Plantation', key: 6),
        ];
        break;
      case 'Plantation':
        secActivityList = [
          ActivityItem(label: 'None', key: 0),
          ActivityItem(label: 'Farming', key: 1),
          ActivityItem(label: 'Dairy', key: 2),
          ActivityItem(label: 'Fishery', key: 3),
          ActivityItem(label: 'Poultry', key: 4),
          ActivityItem(label: 'Piggery', key: 5),
        ];
        break;
    }

    chipLabels = (secActivityList.map((item) => item.label.toString())).toList();

    try {
      final List<FarmerApplication> applications =
          await Amplify.DataStore.query(FarmerApplication.classType,
              where: FarmerApplication.APPLICATIONID.eq(widget.applicationId));

      if (applications.isNotEmpty) {
        FarmerApplication farmerApplication = applications.first;

        final List<FarmerSecondaryActivity> farmerSecondaryActivities =
            await Amplify.DataStore.query(FarmerSecondaryActivity.classType,
                where: FarmerSecondaryActivity.ID.eq(farmerApplication
                    .applicationId));

        if (farmerSecondaryActivities.isNotEmpty) {
          FarmerSecondaryActivity farmerSecondaryActivity =
              farmerSecondaryActivities.first;

          //_farmerSecondaryActivityRefId =
              //farmerApplication.!;

          int fetchedSecId = farmerSecondaryActivity.activityId ?? 0;

          ActivityItem fetchedSecActivity = secActivityList.firstWhere(
              (element) => element.key == fetchedSecId, orElse: ()=>secActivityList[0]);

          String selectedActivity = fetchedSecActivity.label;
          safePrint('Selected secondary activity: $selectedActivity');
          setState(() {
            currentIndex = chipLabels.indexOf(selectedActivity);
            widget.secActCallback(selectedActivity, widget.setState);
          });
        } else {
          // Create
          FarmerSecondaryActivityRepo farmerSecondaryActivityRepo =
              FarmerSecondaryActivityRepo();
          FarmerSecondaryActivity farmerSecondaryActivity =
              FarmerSecondaryActivity(farmerapplicationID: farmerApplication.applicationId,activityId: 0);
          await farmerSecondaryActivityRepo.create(farmerSecondaryActivity);

          // Hold the reference in FarmerApplication model
          // final newApplication = farmerApplication.copyWith(
          //     applicationId: farmerApplication.applicationId,
          //         farmerSecondaryActivity.id);
          // await Amplify.DataStore.save(newApplication);
          //
          // _farmerSecondaryActivityRefId = farmerSecondaryActivity.id;
        }
      }
    } catch (e) {
      safePrint('Error in fetching secondary activity data: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _populate();
  }

  @override
  Widget build(BuildContext context) {
    /*switch (widget.activity) {
      case 'Farming':
        _chipList = [
          'None',
          'Dairy',
          'Fishery',
          'Poultry',
          'Piggery',
          'Plantation',
        ];
        break;
      case 'Dairy':
        _chipList = ['None', 'Farming', 'Poultry', 'Plantation', 'Fishery'];
        break;
      case 'Fishery':
        _chipList = ['Farming', 'Poultry', 'Plantation', 'Dairy'];
        break;
    }*/
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Choose a secondary activity \nif any?',
          style: TextStyle(fontSize: 20, color: AppColor.primaryColor),
        ),
        const SizedBox(
          height: 20.0,
        ),
        ChipList(
          listOfChipNames: chipLabels,
          activeBgColorList: const [AppColor.primaryColor],
          inactiveBgColorList: const [AppColor.mediumBlueColor],
          activeTextColorList: const [AppColor.mediumBlueColor],
          inactiveTextColorList: const [AppColor.primaryColor],
          listOfChipIndicesCurrentlySeclected: [currentIndex],
          showCheckmark: false,
          shouldWrap: true,
          spacing: 5,
          runSpacing: 20,
          wrapAlignment: WrapAlignment.center,
          style: const TextStyle(
            fontSize: 18,
          ),
          extraOnToggle: (val) async {
            // Get the activity id
            ActivityItem item = secActivityList
                .firstWhere((element) => element.label == chipLabels[val]);

            FarmerSecondaryActivityRepo farmerSecondaryActivityRepo =
                FarmerSecondaryActivityRepo();
            await farmerSecondaryActivityRepo.update(
                _farmerSecondaryActivityRefId, item.key);

            setState(() {
              currentIndex = val;
              widget.secActCallback(chipLabels[val], widget.setState);
            });
          },
        ),
      ],
    );
  }
}
