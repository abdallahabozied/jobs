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
  static final List<Intested_joblocation?> _countries = [
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
  static final List<Intested_jobtypes?> _types = [
    Intested_jobtypes(id: 1, name: "UI/UX Designer"),
    Intested_jobtypes(id: 2, name: "Illustrator Designer"),
    Intested_jobtypes(id: 3, name: "Developer"),
    Intested_jobtypes(id: 4, name: "Management"),
    Intested_jobtypes(id: 5, name: "Information Technology"),
    Intested_jobtypes(id: 6, name: "Research and analytics"),
    Intested_jobtypes(id: 7, name: "Research and analytics"),
    Intested_jobtypes(id: 8, name: "Research and analytics"),
    Intested_jobtypes(id: 9, name: "Research and analytics")
  ];

  late TabController _tabController;
  final _items = _countries
      .map((countries) =>
          MultiSelectItem<Intested_joblocation>(countries!, countries.name!))
      .toList();

  final List<Intested_joblocation?> _selectedlocations = [];

  Set<String> _selectedtypeset={};
List<bool>  isselected=[false,false,false,false,false,false,false,false,false];
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
            padding: const EdgeInsets.all(20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Text("Where are your prefered location?",
                      style: TextStyle(fontSize: 33)),
                  const SizedBox(height: 5),
                  const Text(
                      "Let us know, where is the location you want at this time , So we can adjust it.",
                      style: TextStyle(color: Colors.black54, fontSize: 20)),
                  const SizedBox(height: 10),
                  TabBar(
                    controller: _tabController,
                    tabs: const [
                      Tab(
                        text: 'Work From Office',
                      ),
                      Tab(
                        text: 'Remote Work',
                      ),
                    ],
                    labelColor: Colors.black,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 500,
                    child: TabBarView(
                        controller: _tabController, children: [
                     GridView.builder(itemCount: _types.length,gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 5,crossAxisSpacing: 5,mainAxisExtent: 160) ,itemBuilder: (context, index) {
                       return InkWell(
                         onTap: (){
                           isselected[index] = true;
                           setState(() {
                           });
                           _selectedtypeset.add(_types[index]!.name!);
                         },
                         onLongPress:(){
                           isselected[index] = false;
                           _selectedtypeset.remove(_types[index]!.name!);

                           setState(() {

                           });
                         } ,
                         child: Container(

                           padding: const EdgeInsets.all(8),
                            decoration:isselected[index] == true? BoxDecoration(
                              color: Colors.blue.withOpacity(0.2),
                             borderRadius:
                             BorderRadius.circular(20),
                              border:
                              Border.all(width: 0.5, style: BorderStyle.none),
                           ):BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(20),
                              border: Border.all(),
                            ),
                           child: Column(
                             mainAxisAlignment:
                             MainAxisAlignment.start,
                             crossAxisAlignment:
                             CrossAxisAlignment.start,
                             children: [
                               CircleAvatar(
                                 maxRadius: 30,
                                 minRadius: 30,

                                 child: Text("${_types[index]!.id}"),
                               ),
                               const SizedBox(height: 20),
                               Text(
                                 "${_types[index]!.name}",
                                 style: const TextStyle(fontSize: 20),
                                 softWrap: true,
                               )
                             ],
                           ),
                         ),
                       );
                     },),
                      MultiSelectChipField(
                        items: _items,
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 0.5, style: BorderStyle.none),
                        ),
                        onTap: (item) {
                          _selectedlocations == false ||
                                  _selectedlocations.isEmpty
                              ? Container(
                                  padding: const EdgeInsets.all(10),
                                  alignment: Alignment.centerLeft,
                                  child: const Text(
                                    "None selected",
                                    style: TextStyle(color: Colors.black54),
                                  ))
                              : Container();
                        },
                        headerColor: Colors.black54,
                        showHeader: false,
                        scroll: false,
                        selectedChipColor: Colors.blue.withOpacity(0.2),
                        initialValue: _selectedlocations,
                      ),
                    ]),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent[700],
                          minimumSize: const Size(300, 50)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Get_Started(),
                            ));
                      },
                      child: const Text(
                        "Next",
                        style: TextStyle(color: Colors.white),
                      ))
                ])));
  }
}
