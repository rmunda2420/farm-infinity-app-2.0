import 'dart:async';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:farm_infinity/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../models/Bio.dart';
import '../models/FarmerApplication.dart';
import '../widgets/my_mask_cam_two_widget.dart';

class LoanApplicationPage extends StatefulWidget {
  final String userId;
  final String applicationId;

  const LoanApplicationPage(
      {super.key, required this.userId, required this.applicationId});

  @override
  State<LoanApplicationPage> createState() => _LoanApplicationPageState();
}

class _LoanApplicationPageState extends State<LoanApplicationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 4,
          child: Column(
            children: <Widget>[
              Container(
                height: 85,
                width: double.infinity,
                color: AppColor.lightBlueColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ButtonsTabBar(
                    backgroundColor: AppColor.primaryColor,
                    unselectedBackgroundColor: Colors.transparent,
                    borderColor: AppColor.primaryColor,
                    borderWidth: 1.0,
                    radius: 10.0,
                    buttonMargin: const EdgeInsets.all(10.0),
                    unselectedBorderColor: AppColor.primaryColor,
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 15.0),
                    unselectedLabelStyle: const TextStyle(
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.w500),
                    labelStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500),
                    tabs: const [
                      Tab(
                        text: "Profile",
                      ),
                      Tab(
                        text: "Assets",
                      ),
                      Tab(
                        text: "Scorecard",
                      ),
                      Tab(
                        text: "Loan History",
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: <Widget>[
                    Center(
                      child: FutureBuilder(
                        future: _populateProfileData(
                            widget.userId, widget.applicationId),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            // Extract bio from snapshot data
                            Bio bio = snapshot.data as Bio;
                            // Assuming Bio has 'name' and 'address' fields, you can use them as follows:
                            String name = bio.name ??
                                ''; // Replace '' with default value if name is null
                            String address = bio.fullAddress ??
                                ''; // Replace '' with default value if address is null
                            return _showProfile(context, name, address);
                          }
                        },
                      ),
                    ),
                    Center(
                      child: Text('Asset'),
                    ),
                    Center(
                      child: Text('Scorecard'),
                    ),
                    Center(
                      child: Text('Loan History'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _showProfile(BuildContext context, String name, String address) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 5.0,
        ),
        // Picture box starts here
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: 111,
            height: 111,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.whiteColor, // Change the color as needed
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  child: Container(
                    width: 110.0,
                    height: 110.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: ClipOval(
                      child: SvgPicture.asset(
                        'assets/icons/icon_camera.svg',
                        // Set the height of the image
                        fit: BoxFit.cover, // Adjust the BoxFit as needed
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        // Label name
        const Text('Name'),
        const SizedBox(
          height: 5.0,
        ),
        Text(
          name,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 5.0,
        ),
        // Label address
        const Text('Address'),
        const SizedBox(
          height: 5.0,
        ),
        Text(
          address,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

Widget showAssets() {
  return Column();
}

Widget showScorecard() {
  return Column();
}

Widget showLoanHistory() {
  return Column();
}

Future<Bio> _populateProfileData(String userId, String applicationId) async {
  try {
    // Get the application
    final List<FarmerApplication> applications = await Amplify.DataStore.query(
        FarmerApplication.classType,
        where: FarmerApplication.APPLICATIONID.eq(applicationId));
    FarmerApplication application = applications.first;
    // Get the bio of the application
    final List<Bio> bios = await Amplify.DataStore.query(
      Bio.classType,
      where: Bio.ID.eq(application.farmerApplicationFarmerApplicationToBioId),
    );
    if (bios.isNotEmpty) {
      final Bio bio = bios.first;
      // Set text field values using controllers
      String name = bio.name?.toString() ?? '';
      safePrint('Populate successful');
      // Complete the future successfully
      return bio;
    } else {
      // Handle case where no applications are found for the specified userId
      safePrint('No bio found for applicationId: $applicationId');
      throw Exception('No bio found');
    }
  } catch (e) {
    safePrint('Error in fetching bio: $e');
    throw Exception('Error in fetching bio');
  }
}
