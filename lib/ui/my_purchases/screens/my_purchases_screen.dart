import 'package:app_kltn_trunghoan/bloc/app_bloc.dart';
import 'package:app_kltn_trunghoan/bloc/purchases/purchases_bloc.dart';
import 'package:app_kltn_trunghoan/common/widgets/appbars/appbar_title_back.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:app_kltn_trunghoan/models/purchase_model.dart';
import 'package:app_kltn_trunghoan/ui/my_purchases/screens/purchases_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:app_kltn_trunghoan/helpers/sizer_custom/sizer.dart';

class MyPurchasesScreen extends StatefulWidget {
  final int indexCurrent;
  MyPurchasesScreen({required this.indexCurrent});
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
    _currentIndex = widget.indexCurrent;

    _tabController = TabController(
      initialIndex: _currentIndex,
      length: _tabNumber.length,
      vsync: this,
    );

    _tabController.animation?.addListener(() {
      _changeTab(
        _tabController.animation?.value.round() ?? _tabController.index,
      );
    });
    AppBloc.purchaseBloc
        .add(GetPurchasesStatusEvent(status: _tabNumber[_currentIndex]));
  }

  _changeTab(int index) {
    if (_currentIndex != index) {
      setState(() {
        _currentIndex = index;
      });

      AppBloc.purchaseBloc
          .add(GetPurchasesStatusEvent(status: _tabNumber[_currentIndex]));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // resizeToAvoidBottomInset: false,
      appBar: appBarTitleBack(
        context,
        'Đơn hàng của tôi',
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
                  width: 90.sp,
                  child: Tab(
                    child: Text('Chờ xác nhận'),
                  ),
                ),
                Container(
                  width: 60.sp,
                  child: Tab(
                    child: Text('Đang giao'),
                  ),
                ),
                Container(
                  width: 60.sp,
                  child: Tab(
                    child: Text('Đã giao'),
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
            Expanded(
              child: TabBarView(
                physics: ClampingScrollPhysics(),
                controller: _tabController,
                children: <Widget>[
                  ..._tabNumber.map(
                    (tabNumber) {
                      return BlocBuilder<PurchasesBloc, PurchasesState>(
                        builder: (context, state) {
                          if (state is GetDonePurchase) {
                            Map<int, List<PurchaseModel>>? purchases = state
                                .props[0] as Map<int, List<PurchaseModel>>?;
                            if (purchases![_currentIndex] != null) {
                              return PurchasesScreen(
                                tabNumber: tabNumber,
                                orderModel: purchases[_currentIndex]!,
                              );
                            }
                          }

                          return ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 4,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Container();
                            },
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
