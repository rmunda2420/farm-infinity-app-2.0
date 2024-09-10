import 'package:farm_infinity/screens/officer_add_insurance_customer_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../styles/colors.dart';
import '../widgets/avatar_container.dart';

class OfficerDashboardPage extends StatefulWidget {
  const OfficerDashboardPage({super.key});

  @override
  State<OfficerDashboardPage> createState() => _OfficerDashboardPageState();
}

class _OfficerDashboardPageState extends State<OfficerDashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              color: AppColor.accentColor,
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: AvatarContainer(
                  avatarSourcePath: 'assets/icons/icon_avatar.svg',
                  userId: 'FIE4'),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 160.0),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: AppColor.lightBlueColor,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .162,
                      ),
                      // Start form filling container starts here
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
                              onTap: () async {},
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
                                        color: AppColor.accentColor,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SvgPicture.asset(
                                            width: 30,
                                            height: 30,
                                            'assets/icons/icon_new_form_blue.svg',
                                            alignment: Alignment.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        child: Text(
                                            'Fill a form for a new farmer'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        child: Container(
                          width: double.infinity,
                          height: 146,
                          color: AppColor.whiteColor,
                          child: Column(
                            children: [
                              Row(
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
                                        color: AppColor.primaryColor,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SvgPicture.asset(
                                            width: 30,
                                            height: 30,
                                            'assets/icons/icon_new_form_orange.svg',
                                            alignment: Alignment.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 3.0),
                                        child: Text(
                                          'Enrolled farmer list',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 3.0),
                                        child: Text('Existing farmer list'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    10.0, 2.0, 10.0, 10.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: 'Search farmer',
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SvgPicture.asset(
                                        width: 24,
                                        height: 24,
                                        'assets/icons/icon_search.svg',
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 16.0),
                                    // Adjust the vertical padding
                                    filled: true,
                                    fillColor: AppColor.lightBlueColor,
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    border: const OutlineInputBorder(
                                      // width: 0.0 produces a thin "hairline" border
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.0),
                                      ),
                                      borderSide: BorderSide.none,
                                    ),
                                    // Add errorBorder to show a red border when there is an error
                                    errorBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12.0),
                                      ),
                                      borderSide: BorderSide(color: Colors.red),
                                    ),
                                    hintStyle:
                                        const TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        child: Container(
                          width: double.infinity,
                          height: 146,
                          color: AppColor.whiteColor,
                          child: Column(
                            children: [
                              Row(
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
                                        color: AppColor.primaryColor,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SvgPicture.asset(
                                            width: 30,
                                            height: 30,
                                            'assets/icons/icon_new_form_orange.svg',
                                            alignment: Alignment.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 3.0),
                                        child: Text(
                                          'View farmers scorecard',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 3.0),
                                        child: Text('Existing farmer list'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    10.0, 2.0, 10.0, 10.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: 'Search farmer',
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SvgPicture.asset(
                                        width: 24,
                                        height: 24,
                                        'assets/icons/icon_search.svg',
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 16.0),
                                    // Adjust the vertical padding
                                    filled: true,
                                    fillColor: AppColor.lightBlueColor,
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    border: const OutlineInputBorder(
                                      // width: 0.0 produces a thin "hairline" border
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.0),
                                      ),
                                      borderSide: BorderSide.none,
                                    ),
                                    // Add errorBorder to show a red border when there is an error
                                    errorBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12.0),
                                      ),
                                      borderSide: BorderSide(color: Colors.red),
                                    ),
                                    hintStyle:
                                        const TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Ends here
                      const SizedBox(
                        height: 40,
                      ),
                      // Other products starts here
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Other products'),
                          const SizedBox(
                            height: 10,
                          ),
                          // Insurance card goes here
                          ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                            child: Container(
                              width: double.infinity,
                              height: 127,
                              color: AppColor.whiteColor,
                              child: Material(
                                type: MaterialType.transparency,
                                //elevation: 6.0,
                                color: Colors.transparent,
                                //shadowColor: Colors.grey[50],
                                child: InkWell(
                                  splashColor: Colors.white30,
                                  onTap: () async {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const OfficerAddInsuranceCustomerPage(),
                                      ),
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            color: AppColor.mediumBlueColor,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: SvgPicture.asset(
                                                width: 30,
                                                height: 30,
                                                'assets/icons/icon_product_ins.svg',
                                                alignment: Alignment.center,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 20.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Pig Insurance',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: AppColor.primaryColor,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Wrap(
                                              children: [
                                                SizedBox(
                                                  width: 207,
                                                  height: 48,
                                                  child: Text(
                                                    'Secure the life of your livestock with affordable insurance.',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              'Know more',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: AppColor.primaryColor,
                                                  fontWeight: FontWeight.w400),
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
                          const SizedBox(
                            height: 10,
                          ),
                          // Fertilizer card goes here
                          ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                            child: Container(
                              width: double.infinity,
                              height: 127,
                              color: AppColor.whiteColor,
                              child: Material(
                                type: MaterialType.transparency,
                                //elevation: 6.0,
                                color: Colors.transparent,
                                //shadowColor: Colors.grey[50],
                                child: InkWell(
                                  splashColor: Colors.white30,
                                  onTap: () async {},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            color: AppColor.mediumBlueColor,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: SvgPicture.asset(
                                                width: 30,
                                                height: 30,
                                                'assets/icons/icon_product_fert.svg',
                                                alignment: Alignment.center,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 20.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Fertilizer',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: AppColor.primaryColor,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Wrap(
                                              children: [
                                                SizedBox(
                                                  width: 207,
                                                  height: 48,
                                                  child: Text(
                                                    'Buy insurance @199 per month for your farmland.',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              'Know more',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: AppColor.primaryColor,
                                                  fontWeight: FontWeight.w400),
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
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
