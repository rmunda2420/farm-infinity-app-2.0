import 'package:farm_infinity/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:timelines/timelines.dart';

const kTileHeight = 50.0;

const completeColor = Color(0xff5e6172);
const inProgressColor = Color(0xff5ec792);
const todoColor = Color(0xffd1d2d7);

class FarmerRegTimeline extends StatefulWidget {
  const FarmerRegTimeline({super.key});

  @override
  State<FarmerRegTimeline> createState() => _FarmerRegTimelineState();
}

class _FarmerRegTimelineState extends State<FarmerRegTimeline> {
  final List<Processes> _processes = <Processes>[];

  /*final int _processIndex = 0;

  Color getColor(int index) {
    if (index == _processIndex) {
      return inProgressColor;
    } else if (index < _processIndex) {
      return completeColor;
    } else {
      return todoColor;
    }
  }*/

  @override
  void initState() {
    super.initState();
    // Assuming you want to initialize the processes list in initState
    _processes.add(Processes('Profile', true));
    _processes.add(Processes('Activity', true));
    _processes.add(Processes('Documents', false));
  }

  @override
  Widget build(BuildContext context) {
    return Timeline.tileBuilder(
      shrinkWrap: false,
      theme: TimelineThemeData(
        direction: Axis.horizontal,
        indicatorPosition: 0,
        nodePosition: 0,
        color: AppColor.whiteColor,
        indicatorTheme: const IndicatorThemeData(
          position: .25,
          size: 20.0,
        ),
        connectorTheme: const ConnectorThemeData(
            // space: 30,
            // thickness: 2.5,
            ),
      ),
      builder: TimelineTileBuilder.connected(
        connectionDirection: ConnectionDirection.before,
        itemExtentBuilder: (_, __) {
          return MediaQuery.of(context).size.width / 2.84;
        },
        itemCount: _processes.length,
        /*firstConnectorBuilder: (context) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Profile',
                style: DefaultTextStyle.of(context).style.copyWith(
                      fontSize: 12.0,
                      color: AppColor.whiteColor,
                    ),
              ),
            ],
          );
        },
        lastConnectorBuilder: (context) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Documents',
                style: DefaultTextStyle.of(context).style.copyWith(
                  fontSize: 12.0,
                  color: AppColor.whiteColor,
                ),
              ),
            ],
          );
        },*/
        contentsBuilder: (_, index) {
          if (_processes[index].processName == 'Activity') {
            return Row(
              mainAxisSize: MainAxisSize.max,
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    _processes[index].processName,
                    style: DefaultTextStyle.of(context).style.copyWith(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: AppColor.whiteColor,
                        ),
                  ),
                ),
              ],
            );
          }
          return Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                _processes[index].processName,
                style: DefaultTextStyle.of(context).style.copyWith(
                      fontSize: 12.0,
                      color: AppColor.whiteColor,
                    ),
              ),
            ],
          );
        },
        indicatorBuilder: (_, index) {
          if (_processes[index].isCompleted &&
              _processes[index].processName != 'Activity') {
            return const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: DotIndicator(
                size: 12.0,
                color: AppColor.whiteColor,
              ),
            );
          } else if (_processes[index].isCompleted &&
              _processes[index].processName == 'Activity') {
            return const OutlinedDotIndicator(
              color: AppColor.accentColor,
              borderWidth: 3.5,
              child: DotIndicator(
                size: 25.0,
                color: AppColor.whiteColor,
              ),
            );
          } else {
            return const DotIndicator(
              color: AppColor.mediumDeepBlueColor,
              size: 12.0,
            );
          }
        },
        connectorBuilder: (_, index, ___) {
          return SolidLineConnector(
            color: _processes[index].isCompleted
                ? AppColor.whiteColor
                : AppColor.mediumDeepBlueColor,
            thickness: _processes[index].isCompleted ? 2.5 : 1.0,
          );
        },
      ),
    );
  }
}

class Processes {
  String processName;
  bool isCompleted;

  Processes(this.processName, this.isCompleted);
}
