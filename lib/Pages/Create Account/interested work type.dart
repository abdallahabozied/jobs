import 'package:flutter/material.dart';
import 'package:jobsque/Pages/Create%20Account/get%20started.dart';
import 'package:multi_select_flutter/chip_field/multi_select_chip_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:jobsque/Shared functions.dart';

class Intersted_Work_type extends StatefulWidget {
  const Intersted_Work_type({super.key});

  @override
  State<Intersted_Work_type> createState() => _Intersted_Work_typeState();
}

class _Intersted_Work_typeState extends State<Intersted_Work_type>
    with TickerProviderStateMixin {
  static List<Intested_joblocation?> _countries = [
    Intested_joblocation(id: 1, name: "United States"),
    Intested_joblocation(id: 2, name: "Malaysia"),
    Intested_joblocation(id: 3, name: "Singapore"),
    Intested_joblocation(id: 4, name: "Indonesia"),
    Intested_joblocation(id: 5, name: "Philiphines"),
    Intested_joblocation(id: 6, name: "Poland"),
    Intested_joblocation(id: 7, name: "India"),
    Intested_joblocation(id: 8, name: "Vietnam"),
    Intested_joblocation(id: 9, name: "China"),
    Intested_joblocation(id: 10, name: "Canada"),
    Intested_joblocation(id: 11, name: "Saudi Arabia"),
    Intested_joblocation(id: 12, name: "Argentina"),
    Intested_joblocation(id: 13, name: "Brazil"),
    Intested_joblocation(id: 14, name: "Egypt"),
    Intested_joblocation(id: 15, name: "United Emrate States"),
    Intested_joblocation(id: 16, name: "Kowait"),
    Intested_joblocation(id: 17, name: "Hungary"),
  ];
  late TabController _tabController;
  final _items = _countries
      .map((countries) =>
          MultiSelectItem<Intested_joblocation>(countries!, countries.name!))
      .toList();
  List<Intested_joblocation?> _selectedAnimals2 = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        body: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 10),
                  Text("Where are your prefered location?",
                      style: TextStyle(fontSize: 33)),
                  SizedBox(height: 10),
                  Text(
                      "Let us know, where is the location you want at this time , So we can adjust it.",
                      style: TextStyle(color: Colors.black54, fontSize: 20)),
                  SizedBox(height: 10),
                  TabBar(
                    controller: _tabController,
                    tabs: [
                      Tab(
                        text: 'Work From Home',
                      ),
                      Tab(
                        text: 'Remote Work',
                      ),
                    ],
                    labelColor: Colors.black,
                  ),
                  Container(
                    width: double.infinity,
                    height: 350,
                    child: TabBarView(controller: _tabController, children: [
                      Container(
                        width: 500,
                        height: 300,
                        child: GridView(
                          scrollDirection: Axis.vertical,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: 140,
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          children: [
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.blue)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    maxRadius: 35,
                                    minRadius: 35,
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    "UI/UX Design",
                                    style: TextStyle(fontSize: 20),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.blue)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    maxRadius: 35,
                                    minRadius: 35,
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    "UI/UX Design",
                                    style: TextStyle(fontSize: 20),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.blue)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    maxRadius: 35,
                                    minRadius: 35,
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    "UI/UX Design",
                                    style: TextStyle(fontSize: 20),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.blue)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    maxRadius: 35,
                                    minRadius: 35,
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    "UI/UX Design",
                                    style: TextStyle(fontSize: 20),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.blue)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    maxRadius: 35,
                                    minRadius: 35,
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    "UI/UX Design",
                                    style: TextStyle(fontSize: 20),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.blue)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    maxRadius: 35,
                                    minRadius: 35,
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    "UI/UX Design",
                                    style: TextStyle(fontSize: 20),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.blue)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    maxRadius: 35,
                                    minRadius: 35,
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    "UI/UX Design",
                                    style: TextStyle(fontSize: 20),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      //Text("Mia Khalifa"),
                      MultiSelectChipField(
                        items: _items,
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 0.5, style: BorderStyle.none),
                        ),
                        onTap: (item) {
                          _selectedAnimals2 == false ||
                                  _selectedAnimals2.isEmpty
                              ? Container(
                                  padding: EdgeInsets.all(10),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "None selected",
                                    style: TextStyle(color: Colors.black54),
                                  ))
                              : Container();
                        },
                        headerColor: Colors.black54,
                        showHeader: false,
                        scroll: false,
                        selectedChipColor: Colors.blue.withOpacity(0.2),
                        initialValue: _selectedAnimals2,
                      ),
                    ]),
                  ),
                  SizedBox(height: 10),
                  Column(children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent[700],
                            minimumSize: const Size(300, 50)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Get_Started(),
                              ));
                        },
                        child: const Text(
                          "Next",
                          style: TextStyle(color: Colors.white),
                        )),
                  ])
                ])));
  }
}
