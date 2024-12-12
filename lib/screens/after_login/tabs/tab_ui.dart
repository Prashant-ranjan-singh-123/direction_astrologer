import 'package:direction_astrologer/screens/after_login/tabs/tabs_cubit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../model/email_model.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/assets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../utils/colors.dart';
import '../calling/call/calling_cubit.dart';
import '../calling/calling_screen.dart';
import '../chating/chat/chat_screen_cubit.dart';
import '../chating/chat_screen.dart';

class TabUi extends StatefulWidget {
  TabUi({super.key});

  @override
  State<TabUi> createState() => _TabUiState();
}

class _TabUiState extends State<TabUi> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    context.read<TabsCubit>().get_data();
    _tabController = TabController(length: 2, vsync: this);

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
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
    return BlocBuilder<TabsCubit, TabsState>(
      builder: (context, state) {
        _tabController.animateTo(state.index);
        print('Current loading: ${state.loading}');

        return state.loading
            ? CircularProgressIndicator.adaptive(
          backgroundColor: AppColor.instance().button_color,
        )
            : DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: AppColor.instance().header_light_green_original,
              leading: Padding(
                padding: const EdgeInsets.all(12.0),
                child:
                SvgPicture.asset(AppAssets.instance().svg_only_brand_logo),
              ),
              leadingWidth: 80,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: GestureDetector(
                    onTap: () {
                      context.read<TabsCubit>().open_profile_page(context: context);
                    },
                    child: Hero(
                      tag: AppConstants.instance().heroPhofilePhoto,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(model[state.counterModelIndex].image),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
    );
  }

  List<Widget> pages = [
    BlocProvider(
      create: (context) => ChatScreenCubit(),
      child: ChatScreen(),
    ),
    BlocProvider(
      create: (context) => CallingCubit(),
      child: CallingScreen(),
    ),
  ];

  Widget _tabs() {
    return TabBar(
      controller: _tabController,
      onTap: (index) {
        context.read<TabsCubit>().changeIndex(index);
      },
      overlayColor: WidgetStatePropertyAll(AppColor.instance().button_color.withOpacity(0.08)),
      isScrollable: true,
      padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.04),
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: AppColor.instance().header_light_green, width: 4.0),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
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
