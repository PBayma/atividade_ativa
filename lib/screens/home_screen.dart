import 'package:atividade_ativa/components/custom_tab.dart';
import 'package:atividade_ativa/models/content_view.dart';
import 'package:atividade_ativa/screens/components/about_content.dart';
import 'package:atividade_ativa/screens/components/about_mobile_content.dart';
import 'package:atividade_ativa/screens/components/project_content.dart';
import 'package:atividade_ativa/screens/components/project_mobile_content.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/custom_tab_bar.dart';
import 'components/home_content.dart';
import 'components/home_mobile_content.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late double screenHeigh;
  late double screenWidth;
  late double paddingHeaderContent;
  late TabController tabController;
  final key = GlobalKey<ScaffoldState>();
  late Widget mobileBody;

  List<ContentView> contentViews = [
    ContentView(
      tab: const CustomTab(title: "Home"),
      content: const HomeContent(),
    ),
    ContentView(
      tab: const CustomTab(title: "Sobre"),
      content: const AboutContent(),
    ),
    ContentView(
      tab: const CustomTab(title: "Projeto"),
      content: const ProjectContent(),
    )
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: contentViews.length, vsync: this);
    mobileBody = const HomeMobileContent();
  }

  @override
  Widget build(BuildContext context) {
    screenHeigh = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    paddingHeaderContent = MediaQuery.of(context).size.width > 1440 ? 100 : 0;

    return Scaffold(
      endDrawer: drawer(),
      key: key,
      backgroundColor: Colors.white,
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
        Padding(
          padding: EdgeInsets.fromLTRB(
              paddingHeaderContent, 0, paddingHeaderContent, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: Text(
                  "SeuCondominio",
                  style: GoogleFonts.lobster(fontSize: 32),
                ),
              ),
              CustomTabBar(
                tabController: tabController,
                tabs: contentViews.map((e) => e.tab).toList(),
              ),
            ],
          ),
        ),
        Flexible(
          child: TabBarView(
            controller: tabController,
            children: contentViews.map((e) => e.content).toList(),
          ),
        )
      ],
    );
  }

  Widget mobileView() {
    return SizedBox(
      width: screenWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: screenWidth * 0.05, right: screenWidth * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "SeuCondominium",
                  style: GoogleFonts.lobster(
                    fontSize: 24,
                  ),
                ),
                IconButton(
                  iconSize: screenWidth * 0.05,
                  icon: const Icon(Icons.menu_rounded),
                  color: Colors.black,
                  onPressed: () => key.currentState?.openEndDrawer(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Flexible(child: mobileBody),
        ],
      ),
    );
  }

  Widget drawer() {
    return Drawer(
      child: ListView(
        children: contentViews
            .map((e) => ListTile(
                  title: Text(e.tab.title),
                  onTap: () {
                    switch (e.tab.title) {
                      case "Home":
                        setState(() {
                          mobileBody = const HomeMobileContent();
                        });
                        break;
                      case "Sobre":
                        setState(() {
                          mobileBody = const AboutMobileContent();
                        });
                        break;
                      case "Projeto":
                        setState(() {
                          mobileBody = ProjectMobileContent();
                        });
                        break;
                      default:
                        setState(() {
                          mobileBody = const HomeMobileContent();
                        });
                        break;
                    }
                  },
                ))
            .toList(),
      ),
    );
  }
}
