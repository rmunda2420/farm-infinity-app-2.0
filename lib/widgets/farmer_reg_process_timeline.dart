import 'package:farm_infinity/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class FarmerRegProcessTimeline extends StatefulWidget {
  const FarmerRegProcessTimeline({super.key});

  @override
  State<FarmerRegProcessTimeline> createState() =>
      _FarmerRegProcessTimelineState();
}

class _FarmerRegProcessTimelineState extends State<FarmerRegProcessTimeline> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: TimelineTile(
              alignment: TimelineAlign.start,
              endChild: Padding(
                padding: const EdgeInsets.only(right: 75.0, top: 5.0),
                child: Container(
                  constraints: const BoxConstraints(
                    minWidth: 10,
                  ),
                  child: const Text('Profile'),
                ),
              ),
              axis: TimelineAxis.horizontal,
              isFirst: true,
              indicatorStyle: const IndicatorStyle(
                indicatorXY: .10,
                width: 25,
                color: AppColor.whiteColor,
              ),
            ),
          ),
          Expanded(
            child: TimelineTile(
              alignment: TimelineAlign.start,
              endChild: Padding(padding: EdgeInsets.only(top: 5.0),child: Container(
                constraints: const BoxConstraints(
                  minWidth: 10,
                ),
                child: const Text('Owned'),
              ),),
              axis: TimelineAxis.horizontal,
              indicatorStyle: const IndicatorStyle(
                width: 20,
                color: Colors.greenAccent,
              ),
            ),
          ),
          Expanded(
            child: TimelineTile(
              alignment: TimelineAlign.start,
              endChild: Padding(
                padding: const EdgeInsets.only(left: 40.0, top: 5.0),
                child: Container(
                  constraints: const BoxConstraints(
                    minWidth: 5,
                  ),
                  child: const Text('Documents'),
                ),
              ),
              axis: TimelineAxis.horizontal,
              isLast: true,
              indicatorStyle: const IndicatorStyle(
                indicatorXY: 1,
                width: 20,
                color: AppColor.mediumDeepBlueColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
