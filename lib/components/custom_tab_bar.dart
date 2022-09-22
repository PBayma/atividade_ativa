import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final TabController tabController;
  final List<Widget> tabs;

  const CustomTabBar({
    Key? key,
    required this.tabController,
    required this.tabs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    final tabBarScalling = widthScreen > 1400
        ? 0.21
        : widthScreen > 1100
            ? 0.3
            : 0.4;
    return SizedBox(
      width: widthScreen * tabBarScalling,
      child: Theme(
        data: ThemeData(
          primarySwatch: Colors.orange,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
        ),
        child: TabBar(
          tabs: tabs,
          controller: tabController,
        ),
      ),
    );
  }
}
