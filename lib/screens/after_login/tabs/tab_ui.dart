import 'package:direction_astrologer/screens/after_login/tabs/tabs_cubit.dart';
import 'package:direction_astrologer/utils/assets.dart';
import 'package:direction_astrologer/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class TabUi extends StatefulWidget {
  const TabUi({super.key});

  @override
  State<TabUi> createState() => _TabUiState();
}

class _TabUiState extends State<TabUi> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // Initialize TabController with default index
    _tabController = TabController(length: 2, vsync: this);

    // Listen to TabController and update the cubit accordingly
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        // Update TabsCubit when the TabController index changes
        context.read<TabsCubit>().changeIndex(_tabController.index);
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TabsCubit(), // Make sure BlocProvider is above TabUi
      child: BlocBuilder<TabsCubit, TabsState>(
        builder: (context, state) {
          // Update TabController index when TabsCubit changes
          _tabController.animateTo(state.index);

          return DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: AppColor.instance().header_light_green_original,
                leading: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(AppAssets.instance().svg_only_brand_logo),
                ),
                leadingWidth: 80,
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(AppAssets.instance().png_doctor_one),
                    ),
                  ),
                ],
              ),
              body: Column(
                children: [
                  _tabs(),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: pages,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  List<Widget> pages = [
    Center(child: Text('Chat')),
    Center(child: Text('Calling')),
  ];

  Widget _tabs() {
    return TabBar(
      controller: _tabController,
      onTap: (index) {
        // Change cubit index on tab tap
        context.read<TabsCubit>().changeIndex(index);
      },
      isScrollable: true,
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.04),
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          color: AppColor.instance().header_light_green,
          width: 4.0,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        insets: const EdgeInsets.symmetric(horizontal: 1.0),
      ),
      unselectedLabelStyle: GoogleFonts.montserrat(fontWeight: FontWeight.w400),
      labelStyle: GoogleFonts.montserrat(
        fontWeight: FontWeight.w700,
        color: AppColor.instance().header_light_green,
      ),
      tabs: const [
        Tab(text: "Chat"),
        Tab(text: "Calling"),
      ],
    );
  }
}
