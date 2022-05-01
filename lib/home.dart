import 'package:dashboard_dark/card_component.dart';
import 'package:dashboard_dark/config.dart';
import 'package:dashboard_dark/menu.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final controller = ScrollController();
  final pageController = PageController();
  double position = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(() {
      position = controller.position.pixels;
      setState(() {});
    });
  }

  final List<String> otherPages = [
    'Analystics',
    'People',
    'Company',
    'Documents',
    'Client chat',
  ];

  final icons = List.generate(5, (index) => "assets/icons/m${index + 2}.svg");

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    // print(width);
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Config.colors.background,
      endDrawer: Reminder(
        isMenu: true,
      ),
      drawerEnableOpenDragGesture: false,
      drawer: Menu(
        onChanged: (i) {
          pageController.jumpToPage(i);
        },
      ),
      drawerDragStartBehavior: DragStartBehavior.start,
      body: SafeArea(
        child: Row(
          children: [
            Menu(
              isVisible: width >= 1444,
              onChanged: (i) {
                pageController.jumpToPage(i);
              },
            ),
            Expanded(
              child: Column(
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    padding:
                        EdgeInsets.symmetric(horizontal: width < 500 ? 15 : 30)
                            .copyWith(top: 10),
                    decoration: BoxDecoration(
                      color: position >= 30
                          ? Config.colors.menuColor
                          : Colors.transparent,
                      boxShadow: position >= 30
                          ? [
                              BoxShadow(
                                offset: Offset(0, 5),
                                blurRadius: 20,
                                color: Config.colors.menuColor,
                              ),
                            ]
                          : null,
                    ),
                    child: Row(
                      mainAxisAlignment: width < 1204
                          ? MainAxisAlignment.spaceBetween
                          : MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            if (width < 400)
                              IconButton(
                                  onPressed: () {
                                    scaffoldKey.currentState!.openDrawer();
                                  },
                                  icon: Icon(
                                    Icons.menu,
                                    size: 28,
                                    color: Config.colors.aqua,
                                  )),
                            if (width < 1204)
                              IconButton(
                                  onPressed: () {
                                    scaffoldKey.currentState!.openEndDrawer();
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    size: 28,
                                    color: Config.colors.aqua,
                                  )),
                          ],
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.notifications_none_sharp,
                              size: 28,
                              color: Config.colors.aqua,
                            )),
                      ],
                    ),
                  ),
                  Expanded(
                    child: PageView(
                      controller: pageController,
                      children: [
                        Page1(controller: controller, width: width),
                        for (var i = 0; i < otherPages.length; i++)
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  icons[i],
                                  width: 70,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  otherPages[i],
                                  style: TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'bold',
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({
    Key? key,
    required this.controller,
    required this.width,
  }) : super(key: key);

  final ScrollController controller;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: controller,
      child: SingleChildScrollView(
        controller: controller,
        padding: EdgeInsets.symmetric(
            horizontal: width < 500 ? 20 : 50, vertical: 30),
        child: SizedBox(
          height: width > 853
              ? 860
              : width > 813
                  ? 1130
                  : 1442,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: CardComponent()),
                        if (width > 853)
                          SizedBox(
                            width: 40,
                          ),
                        if (width > 853) Expanded(child: VisitComponent()),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    if (width < 854) ...[
                      VisitComponent(),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: CalendarComponent(
                          isMin: width < 814,
                        )),
                        if (width > 813)
                          SizedBox(
                            width: 40,
                          ),
                        if (width > 813)
                          Expanded(
                              child: Column(
                            children: [
                              ReviewComponent(
                                title: "Design review",
                                subtitle: "9:00 AM — 10:00 AM",
                                icon: Config.assets.work,
                                avatars: List.generate(
                                    4,
                                    (index) =>
                                        'assets/images/a${index + 1}.png'),
                                color: Color(
                                  0xFFC8372D,
                                ),
                                colors: [
                                  Color.fromRGBO(182, 182, 182, 0.67),
                                  Color.fromRGBO(83, 83, 83, 0.46),
                                ],
                              ),
                              SizedBox(
                                height: 28,
                              ),
                              ReviewComponent(
                                title: "Beer party",
                                subtitle: "11:00 PM — 4:00 AM",
                                avatars: [
                                  'assets/images/a5.png',
                                  'assets/images/a6.png',
                                ],
                                icon: Config.assets.water,
                                color: Color(
                                  0xFFD1941A,
                                ),
                                colors: [
                                  Color.fromRGBO(220, 220, 220, 0.48),
                                  Color.fromRGBO(77, 77, 78, 1),
                                ],
                              )
                            ],
                          )),
                      ],
                    ),
                    if (width < 814) ...[
                      SizedBox(
                        height: 30,
                      ),
                      Column(
                        children: [
                          ReviewComponent(
                            title: "Design review",
                            subtitle: "9:00 AM — 10:00 AM",
                            icon: Config.assets.work,
                            avatars: List.generate(4,
                                (index) => 'assets/images/a${index + 1}.png'),
                            color: Color(
                              0xFFC8372D,
                            ),
                            colors: [
                              Color.fromRGBO(182, 182, 182, 0.67),
                              Color.fromRGBO(83, 83, 83, 0.46),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          ReviewComponent(
                            title: "Beer party",
                            subtitle: "11:00 PM — 4:00 AM",
                            avatars: [
                              'assets/images/a5.png',
                              'assets/images/a6.png',
                            ],
                            icon: Config.assets.water,
                            color: Color(
                              0xFFD1941A,
                            ),
                            colors: [
                              Color.fromRGBO(220, 220, 220, 0.48),
                              Color.fromRGBO(77, 77, 78, 1),
                            ],
                          )
                        ],
                      ),
                    ],
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(height: 200, child: Statistic())
                  ],
                ),
              ),
              if (width > 1203)
                SizedBox(
                  width: 40,
                ),
              Reminder(
                isVisibled: width > 1203,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Reminder extends StatelessWidget {
  final bool isVisibled;
  final bool isMenu;
  const Reminder({Key? key, this.isVisibled = true, this.isMenu = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 800),
      padding: isMenu ? EdgeInsets.only(right: 15) : null,
      width: !isVisibled ? 0 : null,
      child: Column(
        children: [
          SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Container(
              margin: EdgeInsets.only(top: 40, bottom: 40),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(Config.assets.user),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "OnProgramme",
                        style: TextStyle(
                          color: Config.colors.grey2,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "onprogramme@gmail.com",
                        style: TextStyle(
                          color: Config.colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Config.colors.grey,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: NewReminder(),
            ),
          )
        ],
      ),
    );
  }
}
