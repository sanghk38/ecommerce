import 'package:ecommerce/bloc/session/session_bloc.dart';
import 'package:ecommerce/bloc/session/session_state.dart';
import 'package:ecommerce/bloc/tab_bloc/tab_bloc.dart';
import 'package:ecommerce/bloc/tab_bloc/tab_state.dart';
import 'package:ecommerce/core/constants/routes/route_name.dart';
import 'package:ecommerce/core/enums/home_page_type.dart';
import 'package:ecommerce/core/mixin/dialog_mixin.dart';
import 'package:ecommerce/di/injection.dart';
import 'package:ecommerce/pages/dashboard/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';


class HomePage extends StatefulWidget {
  static const String routeName = '/';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with DialogMixin {
  static final TextStyle _bottomNavigationBarTextStyle = TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w500
  );
  final _tabBloc = getIt<TabBloc>();
  final _sessionBloc = getIt<SessionBloc>();
  final _pageController = PageController();

  List<Widget> get _page =>
      [
        DashboardPage(),
        DashboardPage(),
        DashboardPage(),
        DashboardPage(),
        DashboardPage(),
      ];

  @override
  void dispose() {
    _pageController.dispose();
    _sessionBloc.close();
    _tabBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SessionBloc, SessionState>(
        bloc: _sessionBloc,
        listener: (_, state) {
          if (state is SessionExpired) {
            snackBar('Session expired');
            context.replaceNamed(RouteName.loginPage);
          }
        },
        child: BlocBuilder<TabBloc, TabState>(
            bloc: _tabBloc,
            builder: (context, state) {
              return Scaffold(
                body: PageView.builder(
                  itemCount: _page.length,
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return _page[index];
                  },
                ),
                bottomNavigationBar: BottomNavigationBar(
                  currentIndex: _tabBloc.selectedIndex,
                  type: BottomNavigationBarType.fixed,
                  onTap: (index){
                    _tabBloc.selectedIndex = index;
                    _pageController.jumpToPage(index);
                  },
                  selectedLabelStyle: _bottomNavigationBarTextStyle,
                  selectedItemColor: Color(0xFF438634),
                  unselectedItemColor: Color(0xFF8D8D8D),
                  unselectedLabelStyle: _bottomNavigationBarTextStyle,
                  items: HomePageType.values
                  .map((e) => _buildBottomNavigationBarItem(e))
                  .toList(),
                ),
              );
            }
        )
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(HomePageType type){
    return BottomNavigationBarItem(
        icon: SizedBox(
          width: 21.r,
          height: 21.r,
          child: SvgPicture.asset(
            _tabBloc.selectedIndex == type.index
                ? type.selectedIcon
                :type.unselectedIcon,
          ),
        ),
      label: type.title
    );
  }
}
