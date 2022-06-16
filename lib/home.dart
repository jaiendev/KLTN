import 'package:app_kltn_trunghoan/bloc/app_bloc.dart';
import 'package:app_kltn_trunghoan/bloc/home/home_bloc.dart';
import 'package:app_kltn_trunghoan/common/widgets/touchable_opacity.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:app_kltn_trunghoan/ui/category/screens/category_screen.dart';
import 'package:app_kltn_trunghoan/ui/chat/screens/chat_screen.dart';
import 'package:app_kltn_trunghoan/ui/home/screens/home_screen.dart';
import 'package:app_kltn_trunghoan/ui/profile/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:app_kltn_trunghoan/helpers/sizer_custom/sizer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> _tabs = [
    HomeScreen(),
    CategoryScreen(),
    ChatScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    AppBloc.initialHomeBloc();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: Theme.of(context).scaffoldBackgroundColor,
        elevation: .3,
        child: Container(
          height: 45.sp,
          alignment: Alignment.center,
          color: Colors.white,
          child: Column(
            children: [
              Container(
                width: 100.w,
                height: 0.2.sp,
                color: Theme.of(context).dividerColor,
              ),
              Row(
                children: [
                  _buildItemBottomBar(
                    icon: PhosphorIcons.house_light,
                    index: 0,
                    title: 'Home',
                  ),
                  _buildItemBottomBar(
                    icon: PhosphorIcons.desktop_tower_light,
                    index: 1,
                    title: 'Catergory',
                  ),
                  _buildItemBottomBar(
                    icon: PhosphorIcons.chat_circle_dots_light,
                    index: 2,
                    title: 'Messenger',
                  ),
                  _buildItemBottomBar(
                    icon: PhosphorIcons.user_circle_light,
                    index: 3,
                    title: 'Account',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return _tabs[state.props[0]];
            },
          ),
        ],
      ),
    );
  }

  Widget _buildItemBottomBar({IconData? icon, index, title}) {
    return Expanded(
      child: TouchableOpacity(
        onTap: () {
          AppBloc.homeBloc.add(
            OnChangeIndexEvent(
              index: index,
            ),
          );
        },
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            int _currentIndex = state.props[0];
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 1.3.sp,
                    width: 5.sp,
                    decoration: BoxDecoration(
                      color: _currentIndex == index
                          ? colorPrimary
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(1.sp),
                    ),
                  ),
                  SizedBox(height: 4.sp),
                  Container(
                    color: Colors.transparent,
                    child: Icon(
                      icon,
                      size: 20.sp,
                      color: _currentIndex == index
                          ? colorPrimary
                          : colorGray1.withOpacity(0.4),
                    ),
                  ),
                  SizedBox(height: 4.sp),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: _currentIndex == index
                          ? colorPrimary
                          : colorGray1.withOpacity(0.4),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
