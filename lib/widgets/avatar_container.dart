import 'package:farm_infinity/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AvatarContainer extends StatelessWidget {
  final String avatarSourcePath;
  final String userId;

  const AvatarContainer(
      {super.key, required this.avatarSourcePath, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50),
      width: double.infinity,
      height: 85,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Center(
              child: SvgPicture.asset(
                avatarSourcePath,
                height: 60,
                alignment: Alignment.center,
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Flexible(
                child: Text(
                  'User ID',
                  style: TextStyle(fontSize: 18, color: AppColor.whiteColor),
                ),
              ),
              Flexible(
                child: Text(
                  userId,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColor.whiteColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
