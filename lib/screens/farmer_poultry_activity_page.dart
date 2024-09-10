import 'package:farm_infinity/styles/colors.dart';
import 'package:flutter/material.dart';
import '../repositories/farmer/bio_repo.dart';
import '../widgets/auto_save_text_form_field.dart';

class FarmerPoultryActivityPage extends StatefulWidget {
  const FarmerPoultryActivityPage({super.key,});

  @override
  State<FarmerPoultryActivityPage> createState() =>
      _FarmerPoultryActivityPageState();
}

class _FarmerPoultryActivityPageState extends State<FarmerPoultryActivityPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController landAreaFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Name starts here
              AutoSaveTextFormField<BioRepo>(
                id: 'ASASS',
                keyToUpdate: 'Farm land',
                label: 'Farm land poultry',
                labelColor: AppColor.primaryColor,
                textFieldBackgroundColor: AppColor.lightBlueColor,
                controller: landAreaFieldController,
                dataRepository: BioRepo(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some value';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              AutoSaveTextFormField<BioRepo>(
                id: 'ASASS',
                keyToUpdate: 'Farm land',
                label: 'Farm land',
                labelColor: AppColor.primaryColor,
                textFieldBackgroundColor: AppColor.lightBlueColor,
                controller: landAreaFieldController,
                dataRepository: BioRepo(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some value';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              AutoSaveTextFormField<BioRepo>(
                id: 'ASASS',
                keyToUpdate: 'Farm land',
                label: 'Farm land',
                labelColor: AppColor.primaryColor,
                textFieldBackgroundColor: AppColor.lightBlueColor,
                controller: landAreaFieldController,
                dataRepository: BioRepo(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some value';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
