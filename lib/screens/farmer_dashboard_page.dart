import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:farm_infinity/blocs/farmer/app_cubit.dart';
import 'package:farm_infinity/widgets/my_scrollable_application_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../styles/colors.dart';
import '../widgets/avatar_container.dart';

class FarmerDashboardPage extends StatefulWidget {
  final String userId;

  const FarmerDashboardPage({super.key, required this.userId});

  @override
  State<FarmerDashboardPage> createState() => _FarmerDashboardPageState();
}

class _FarmerDashboardPageState extends State<FarmerDashboardPage> {
  late ScrollController _scrollController;

  // my code
  double _sliverHeaderExpandedHeight = 127.0;
  double _overlapContainerPosition = 127.0;

  // double get _headerOffset {
  //   if (_scrollController.hasClients) {
  //     safePrint('offset value: ${_scrollController.offset}');
  //     if (_scrollController.offset > _sliverHeaderExpandedHeight) {
  //       safePrint('-----offset greater----');
  //       safePrint(-1 * (_sliverHeaderExpandedHeight - 10.0));
  //       return -1 * (_sliverHeaderExpandedHeight - 10.0);
  //     } else {
  //       safePrint('---offset lesser-----');
  //       safePrint(-1 * (_scrollController.offset * 1.5));
  //       return -1 * (_scrollController.offset * 1.5);
  //     }
  //   }
  //   return 0.0;
  // }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(
      () {
        setState(
          () {
            if (_scrollController.hasClients) {
              double offset = _scrollController.offset;
              _sliverHeaderExpandedHeight = (125.0 - offset).clamp(0.0, 125.0);
              // if (offset >= 125.0) {
              //   _sliverHeaderExpandedHeight = 0.0; // Explicitly set to 0
              // }
              // Calculate the new _overlapContainerPosition
              _overlapContainerPosition =
                  _sliverHeaderExpandedHeight - (0.0 * (1 - (_sliverHeaderExpandedHeight / 100.0)));
              // Debug print to check values
              safePrint(
                  '---scrolling--- offset: $offset, _sliverHeaderExpanedHeight: $_sliverHeaderExpandedHeight, _overlapContainerPosition: $_overlapContainerPosition');
            }
          },
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: _sliverHeaderExpandedHeight,
                  toolbarHeight: 0.0, // Allow collapsing to 0
                  collapsedHeight: 0.0,
                  backgroundColor: Colors.transparent,
                  pinned: false,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      height: _sliverHeaderExpandedHeight,
                      color: AppColor.primaryColor,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: AvatarContainer(
                          avatarSourcePath: 'assets/icons/icon_avatar.svg',
                          userId: widget.userId,
                        ),
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: Container(
              color: AppColor.lightBlueColor,
            ),
          ),
          Positioned.fill(
            top: _overlapContainerPosition,
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 500,
                          child: BlocProvider(
                            create: (context) => AppCubit(widget.userId),
                            child: MyScrollableApplicationList(
                              userId: widget.userId,
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Other products'),
                            const SizedBox(height: 10),
                            _buildProductCard(
                              context,
                              title: 'Insurance',
                              description:
                                  'Buy insurance @199 per month for your farmland.',
                              iconPath: 'assets/icons/icon_product_ins.svg',
                            ),
                            const SizedBox(height: 10),
                            _buildProductCard(
                              context,
                              title: 'Fertilizer',
                              description:
                                  'Buy insurance @199 per month for your farmland.',
                              iconPath: 'assets/icons/icon_product_fert.svg',
                            ),
                            const SizedBox(height: 10),
                            _buildProductCard(
                              context,
                              title: 'Pesticide',
                              description:
                                  'Buy insurance @199 per month for your farmland.',
                              iconPath: 'assets/icons/icon_product_fert.svg',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(BuildContext context,
      {required String title,
      required String description,
      required String iconPath}) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(15.0)),
      child: Container(
        width: double.infinity,
        height: 127,
        color: AppColor.whiteColor,
        child: Material(
          type: MaterialType.transparency,
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.white30,
            onTap: () async {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 20.0, 20.0, 20.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(6.0)),
                    child: Container(
                      width: 40,
                      height: 40,
                      color: AppColor.mediumBlueColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          width: 30,
                          height: 30,
                          iconPath,
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Wrap(
                        children: [
                          SizedBox(
                            width: 207,
                            height: 48,
                            child: Text(
                              description,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        'Know more',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.w400,
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
    );
  }
}
