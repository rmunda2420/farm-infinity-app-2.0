import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:farm_infinity/blocs/farmer/app_cubit.dart';
import 'package:farm_infinity/models/FinYear.dart';
import 'package:farm_infinity/screens/loan_application_page.dart';
import 'package:farm_infinity/widgets/my_radial_gauge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../helper/gen_app_id.dart';
import '../models/FarmerApplication.dart';
import '../repositories/farmer/application_repo.dart';
import '../screens/farmer_bio_page.dart';
import '../styles/colors.dart';

class MyScrollableApplicationList extends StatefulWidget {
  final String userId;

  const MyScrollableApplicationList({super.key, required this.userId});

  @override
  State<MyScrollableApplicationList> createState() =>
      _MyScrollableApplicationListState();
}

class _MyScrollableApplicationListState
    extends State<MyScrollableApplicationList> {
  // onclick start new form
  Future<void> _navigateToNextPage(BuildContext context, userId) async {
    // get the financial year id reference
    // get the current set financial year from shared preference
    // fetch the reference id form database
    List<FinYear> financialYears = await Amplify.DataStore.query(
      FinYear.classType,
      where: FinYear.FINANCIALYEAR.eq('2024-2025'),
    );
    FinYear financialYear = financialYears.first;
    // Create application
    GenAppId genAppId = GenAppId();
    String appId = genAppId.generateRandomString();
    // Create an instance of your Amplify-generated model
    FarmerApplication farmerApplication = FarmerApplication(
        userId: widget.userId,
        applicationId: appId,
        status: 1,
        version: 1);

    ApplicationRepo appRepo = ApplicationRepo();
    await appRepo.create(farmerApplication).then(
          (value) =>
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  FarmerBioPage(
                      userId: userId, applicationId: appId, isNewForm: true),
            ),
          ),
    );
  }

  @override
  void initState() {
    super.initState();
    //final appCubit = AppCubit(widget.userId);
    // Use context.read to obtain the AppCubit instance
    context.read<AppCubit>().fetchFarmerApplications(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        if (state is AppInitial) {
          return ListView(
            shrinkWrap: true,
            children: <Widget>[
              // Clickable fill form card
              ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10.0),
                ),
                child: Container(
                  width: double.infinity,
                  height: 86,
                  color: AppColor.whiteColor,
                  child: Material(
                    type: MaterialType.transparency,
                    //elevation: 6.0,
                    color: Colors.transparent,
                    //shadowColor: Colors.grey[50],
                    child: InkWell(
                      splashColor: Colors.white30,
                      onTap: () async {
                        _navigateToNextPage(context, widget.userId);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                10.0, 20.0, 20.0, 20.0),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(6.0),
                              ),
                              child: Container(
                                width: 40,
                                height: 40,
                                color: Colors.blue[900],
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SvgPicture.asset(
                                    width: 30,
                                    height: 30,
                                    'assets/icons/icon_new_form.svg',
                                    alignment: Alignment.center,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 3.0),
                                child: Text(
                                  'Start form filling',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 3.0),
                                child: Text('Start a new form'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        } else if (state is Loading) {
          return const CircularProgressIndicator();
        } else if (state is Loaded) {
          // iterate all the application and find if any incomplete application is there
          bool hasIncompleteApplication = state.farmerApplications
              .any((application) => application.status == 1);
          safePrint('has incomplete form: $hasIncompleteApplication');
          return ListView.builder(
            padding: const EdgeInsets.only(bottom: 10.0),
            itemCount: state.farmerApplications.length +
                (hasIncompleteApplication ? 0 : 1),
            itemBuilder: (context, index) {
              if (index == state.farmerApplications.length) {
                // application is complete
                safePrint('show new form button');
                return ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 86,
                    color: AppColor.whiteColor,
                    child: Material(
                      type: MaterialType.transparency,
                      //elevation: 6.0,
                      color: Colors.transparent,
                      //shadowColor: Colors.grey[50],
                      child: InkWell(
                        splashColor: Colors.white30,
                        onTap: () async {
                          // Create new application
                          GenAppId genAppId = GenAppId();
                          String appId = genAppId.generateRandomString();
                          //get the financial year id reference
                          // get the current set financial year from shared preference
                          // fetch the reference id form database
                          final List<FinYear> financialYears =
                          await Amplify.DataStore.query(
                            FinYear.classType,
                            where: FinYear.FINANCIALYEAR.eq('2024-2025'),
                          );
                          // Create an instance of your Amplify-generated model
                          FarmerApplication farmerApplication =
                          FarmerApplication(
                              userId: widget.userId,
                              applicationId: appId,
                              status: 1);

                          ApplicationRepo appRepo = ApplicationRepo();
                          await appRepo.create(farmerApplication).then(
                                (value) =>
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        FarmerBioPage(
                                            userId: widget.userId,
                                            applicationId:
                                            farmerApplication.applicationId,
                                            isNewForm: true),
                                  ),
                                ),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  10.0, 10.0, 20.0, 20.0),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(6.0),
                                ),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  color: Colors.deepOrangeAccent,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SvgPicture.asset(
                                      width: 30,
                                      height: 30,
                                      'assets/icons/icon_new_form_2.svg',
                                      alignment: Alignment.center,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 3.0),
                                  child: Text(
                                    'Start form filling',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 3.0),
                                  child: Text('Start a new form'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              } else {
                safePrint('do not show new form button');
                return ScrollableItemWidget(
                    application: state.farmerApplications[index]);
              }
            },
          );
        } else if (state is Error) {
          return Text('Error: ${state.error}');
        } else {
          return Container(); // Placeholder or default widget
        }
      },
    );
  }
}

class ScrollableItemWidget extends StatelessWidget {
  final FarmerApplication application;

  const ScrollableItemWidget({super.key, required this.application});

  Future<void> _navigateToNextPage(BuildContext context, userId,
      isNewForm) async {
    if (isNewForm) {
      // Create application
      GenAppId genAppId = GenAppId();
      String appId = genAppId.generateRandomString();
      // Create an instance of your Amplify-generated model
      //get the financial year id reference
      // get the current set financial year from shared preference
      // fetch the reference id form database
      final List<FinYear> financialYears = await Amplify.DataStore.query(
        FinYear.classType,
        where: FinYear.FINANCIALYEAR.eq('2024-2025'),
      );
      FarmerApplication farmerApplication = FarmerApplication(
        userId: application.userId,
        applicationId: appId,
        status: 1,
      );

      ApplicationRepo appRepo = ApplicationRepo();
      await appRepo.create(farmerApplication).then(
            (value) =>
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    FarmerBioPage(
                        userId: userId,
                        applicationId: application.applicationId,
                        isNewForm: isNewForm),
              ),
            ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              FarmerBioPage(
                  userId: userId,
                  applicationId: application.applicationId,
                  isNewForm: isNewForm),
        ),
      );
    }
  }

  Future<void> _navigateToLoanApplicationPage(BuildContext context, userId,
      applicationId) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            LoanApplicationPage(
                userId: userId, applicationId: application.applicationId),
      ),
    );
  }

  Color getFormStatusBackgroundColor(int status) {
    switch (status) {
      case 1:
        return AppColor.incompleteFormStatusBackgroundColor;
      case 2:
        return AppColor.completedFormStatusBackgroundColor;
      default:
        return AppColor.whiteColor;
    }
  }

  Color getFormStatusIconBackgroundColor(int status) {
    switch (status) {
      case 1:
        return AppColor.incompleteFormStatusIconBackgroundColor;
      case 2:
        return AppColor.completedFormStatusIconBackgroundColor;
      default:
        return AppColor.whiteColor;
    }
  }

  Widget getFormStatusContainerMainText(int status) {
    switch (status) {
      case 1:
        return const Text(
          'Complete form',
          style: TextStyle(
              fontSize: 16,
              color: AppColor.incompleteFormStatusIconBackgroundColor,
              fontWeight: FontWeight.w700),
        );
      case 2:
        return const Text(
          'Completed form',
          style: TextStyle(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.w700),
        );
      default:
        return const Text(
          'Unknown form status',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
            fontWeight: FontWeight.w700,
          ),
        );
    }
  }

  String getFormStatusContainerSubText(int status) {
    switch (status) {
      case 1:
        return 'Fill status to get scorecard';
      case 2:
        return '';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        // One complete form starts here
        // Timeline starts here
        ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
          child: Container(
            padding: EdgeInsets.zero,
            width: double.infinity,
            height: 86,
            color: AppColor.mediumBlueColor,
            child: Material(
              type: MaterialType.transparency,
              //elevation: 6.0,
              color: Colors.transparent,
              //shadowColor: Colors.grey[50],
              child: InkWell(
                splashColor: Colors.white30,
                onTap: () {
                  safePrint('Timeline tapped');
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Center(child: Text('Timeline')),
                ),
              ),
            ),
          ),
        ),
        // When application is complete/incomplete
        Transform.translate(
          offset: const Offset(0.0, -15.0),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
            child: Container(
              padding: EdgeInsets.zero,
              width: double.infinity,
              height: 86,
              color: getFormStatusBackgroundColor(application.status),
              child: Material(
                type: MaterialType.transparency,
                //elevation: 6.0,
                color: Colors.transparent,
                //shadowColor: Colors.grey[50],
                child: InkWell(
                  splashColor: Colors.white30,
                  onTap: () async {
                    _navigateToNextPage(
                      context,
                      application.userId,
                      false,
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                        const EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 20.0),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(6.0),
                          ),
                          child: Container(
                            width: 40,
                            height: 40,
                            color: getFormStatusIconBackgroundColor(
                                application.status),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(
                                width: 30,
                                height: 30,
                                'assets/icons/icon_new_form.svg',
                                alignment: Alignment.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 3.0),
                            child: getFormStatusContainerMainText(
                                application.status),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 3.0),
                            child: Text(
                              getFormStatusContainerSubText(application.status),
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
        ),
        // Score card container starts here
        if (application.status > 1) // i.e form submitted
          Transform.translate(
            offset: const Offset(0.0, -30.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(15.0),
              ),
              child: Container(
                width: double.infinity,
                height: 250,
                color: AppColor.whiteColor,
                child: Material(
                  type: MaterialType.transparency,
                  //elevation: 6.0,
                  color: Colors.transparent,
                  //shadowColor: Colors.grey[50],
                  child: InkWell(
                    splashColor: Colors.white30,
                    onTap: () async {
                      _navigateToLoanApplicationPage(context,
                          application.userId, application.applicationId);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // Top row
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'My',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                'SCORE',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: AppColor.primaryColor,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                '>',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: AppColor.primaryColor,
                                    fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          // Middle row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Gauge section
                              Column(
                                children: [
                                  const MyRadialGauge(),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    width: 100,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.orangeAccent,
                                      borderRadius: BorderRadius.circular(
                                          20.0), // Adjust the value as needed
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'MEDIUM',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: AppColor.whiteColor,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // Score section
                              const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '471',
                                    style: TextStyle(
                                        fontSize: 60,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  Text(
                                    'Grade C3',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 4.0),
                                  child: Text(
                                    'CREDIT\n WORTHINESS',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: AppColor.disabledColor),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 4.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SvgPicture.asset(
                                        width: 16,
                                        height: 16,
                                        'assets/icons/star.svg',
                                        alignment: Alignment.center,
                                      ),
                                      SvgPicture.asset(
                                        width: 16,
                                        height: 16,
                                        'assets/icons/star.svg',
                                        alignment: Alignment.center,
                                      ),
                                      SvgPicture.asset(
                                        width: 16,
                                        height: 16,
                                        'assets/icons/star.svg',
                                        alignment: Alignment.center,
                                      ),
                                      SvgPicture.asset(
                                        width: 16,
                                        height: 16,
                                        'assets/icons/star_disabled.svg',
                                        alignment: Alignment.center,
                                      ),
                                      SvgPicture.asset(
                                        width: 16,
                                        height: 16,
                                        'assets/icons/star_disabled.svg',
                                        alignment: Alignment.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        // score card area
        // Ends here
      ],
    );
  }
}
