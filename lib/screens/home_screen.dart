import 'dart:js';

import 'package:atividade_ativa/components/custom_tab.dart';
import 'package:atividade_ativa/models/content_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../components/custom_tab_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late double screenHeigh;
  late double screenWidth;
  late TabController tabController;
  final key = GlobalKey<ScaffoldState>();

  List<ContentView> contentViews = [
    ContentView(
      tab: const CustomTab(title: "Home"),
      content: Center(
        child: Container(
          color: Colors.green,
          width: 100,
          height: 100,
        ),
      ),
    ),
    ContentView(
      tab: const CustomTab(title: "About"),
      content: Center(
        child: Container(
          color: Colors.blue,
          width: 100,
          height: 100,
        ),
      ),
    ),
    ContentView(
      tab: const CustomTab(title: "Projects"),
      content: Center(
        child: Container(
          color: Colors.yellow,
          width: 100,
          height: 100,
        ),
      ),
    )
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: contentViews.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    screenHeigh = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      endDrawer: drawer(),
      key: key,
      backgroundColor: const Color(0xff1e1e24),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 715) {
            return desktopView();
          } else {
            return mobileView();
          }
        },
      ),
    );
  }

  Widget desktopView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: const Text(
                "SeuCondominio",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            CustomTabBar(
              tabController: tabController,
              tabs: contentViews.map((e) => e.tab).toList(),
            ),
          ],
        ),
        SizedBox(
          height: screenHeigh * 0.85,
          child: TabBarView(
            controller: tabController,
            children: contentViews.map((e) => e.content).toList(),
          ),
        )
      ],
    );
  }

  Widget mobileView() {
    return Padding(
      padding:
          EdgeInsets.only(left: screenWidth * 0.05, right: screenWidth * 0.05),
      child: SizedBox(
        width: screenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(
              iconSize: screenWidth * 0.05,
              icon: const Icon(Icons.menu_rounded),
              color: Colors.white,
              onPressed: () => key.currentState?.openEndDrawer(),
            )
          ],
        ),
      ),
    );
  }

  Widget drawer() {
    return Drawer(
      child: ListView(
        children: contentViews
            .map((e) => Container(
                  child: ListTile(
                    title: Text(e.tab.title),
                    onTap: () {},
                  ),
                ))
            .toList(),
      ),
    );
  }
}
