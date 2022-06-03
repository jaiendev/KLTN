import 'package:app_kltn_trunghoan/common/widgets/appbars/appbar_title_back.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:sizer/sizer.dart';

class MyPurchasesScreen extends StatefulWidget {
  MyPurchasesScreen({Key? key}) : super(key: key);

  @override
  State<MyPurchasesScreen> createState() => _MyPurchasesScreenState();
}

class _MyPurchasesScreenState extends State<MyPurchasesScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late int _currentIndex;
  List<int> _tabNumber = [
    TO_PAY,
    TO_SHIP,
    COMPLETE,
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = 1;
    // AppBloc.serviceManagamentBloc
    //     .add(OnServiceEvent(status: _tabNumber[_currentIndex]));
    _tabController = TabController(
      initialIndex: 1,
      length: _tabNumber.length,
      vsync: this,
    );

    _tabController.animation?.addListener(() {
      _changeTab(
        _tabController.animation?.value.round() ?? _tabController.index,
      );
    });
  }

  _changeTab(int index) {
    if (_currentIndex != index) {
      setState(() {
        _currentIndex = index;
      });

      // AppBloc.serviceManagamentBloc
      //     .add(OnServiceEvent(status: _tabNumber[_currentIndex]));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // resizeToAvoidBottomInset: false,
      appBar: appBarTitleBack(
        context,
        'My Purchases',
        actions: [
          Icon(
            PhosphorIcons.magnifying_glass_light,
            size: 20.sp,
            color: colorPrimary,
          ),
          SizedBox(width: 16.sp)
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(34.sp),
          child: Align(
            alignment: Alignment.center,
            child: TabBar(
              isScrollable: true,
              physics: BouncingScrollPhysics(),
              labelStyle: TextStyle(
                fontSize: 12.sp,
                color: colorBlack2,
              ),
              indicatorColor: colorPrimary,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorPadding: EdgeInsets.symmetric(horizontal: 20.sp),
              indicatorWeight: 1.5.sp,
              controller: _tabController,
              labelColor: colorBlack2,
              unselectedLabelColor: colorGray1,
              unselectedLabelStyle: TextStyle(
                fontSize: 12.sp,
                color: colorBlack2,
              ),
              onTap: _changeTab,
              tabs: <Widget>[
                Container(
                  width: 60.sp,
                  child: Tab(
                    child: Text('To Pay'),
                  ),
                ),
                Container(
                  width: 60.sp,
                  child: Tab(
                    child: Text('To Ship'),
                  ),
                ),
                Container(
                  width: 60.sp,
                  child: Tab(
                    child: Text('Completed'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            dividerThinkness6NotMargin,
            // Expanded(
            //   child: TabBarView(
            //     physics: ClampingScrollPhysics(),
            //     controller: _tabController,
            //     children: <Widget>[
            //       ..._tabNumber.map(
            //         (tabNumber) {
            //           // return BlocBuilder<ServiceManagamentBloc,
            //           //     ServiceManagamentState>(
            //           //   builder: (context, state) {
            //           //     return state is ServiceManagamentInitial
            //           //         ? ListView.builder(
            //           //             physics: NeverScrollableScrollPhysics(),
            //           //             itemCount: ITEM_COUNT_SHIMMER,
            //           //             itemBuilder: (context, index) {
            //           //               return ServiceShimmerCard(
            //           //                 index: index,
            //           //               );
            //           //             },
            //           //           )
            //           //         : ServiceManagamentScreen(
            //           //             currentState: state,
            //           //             tabNumber: tabNumber,
            //           //             services: state.props[0]?[tabNumber] ?? [],
            //           //           );
            //           //   },
            //           // );
            //           return PurchasesScreen(
            //             tabNumber: tabNumber,
            //             orderModel: listOrder,
            //           );
            //         },
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
