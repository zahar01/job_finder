import 'package:flutter/material.dart';
import 'package:job_finder/widgets/button.dart';
import 'package:job_finder/widgets/filter.dart';
import 'package:job_finder/widgets/job_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //jobName, company, type, money, days
  List jobs = [
    ["Motion Designer", "Google Inc.", "Full time", 2400, 2, Color.fromARGB(255, 253, 228, 247)],
    ["UI/UX designer", "Google Inc.", "Part time", 1200, 6, Colors.white],
    ["ML developer", "Google Inc.", "Full time", 2700, 3, Colors.white],
  ];

  List positions = [
    ["Developer", false],
    ["Violinist", false],
    ["Designer", false],
    ["Managment", false],
    ["Marketing", false],
    ["Judge", false],
  ];

  bool _isFilterTapped = false;

  void positionTapped(int indexTap) {
    setState(() {
      positions[indexTap][1] = !positions[indexTap][1];
    });
  }

  filterTapped() {
    setState(() {
      _isFilterTapped = !_isFilterTapped;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          //Person avatar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  //Avatar
                  CircleAvatar(
                    radius: 32,
                    backgroundImage: AssetImage("img/avatar.png"),
                    backgroundColor: Colors.brown[200],
                  ),

                  //Greeting and UserName
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome back,",
                          style:
                              TextStyle(color: Colors.grey[500], fontSize: 18),
                        ),
                        Text(
                          "Zahar Timofeev",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              //Bell Icon
              Icon(
                Icons.notifications_none,
                size: 32,
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Find job today",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),

                //search bar
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Search",
                            contentPadding: EdgeInsets.all(2),
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(18),
                            color:
                                !_isFilterTapped ? Colors.white : Colors.black,
                          ),
                          child: IconButton(
                            color:
                                !_isFilterTapped ? Colors.black : Colors.white,
                            onPressed: filterTapped,
                            icon: Icon(Icons.density_medium),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Padding(
          //   padding: const EdgeInsets.only(top: 30.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     children: [
          //       Text(
          //         "Job title",
          //         style: TextStyle(
          //           fontSize: 18,
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),

          // Expanded(
          //   child: Padding(
          //     padding: const EdgeInsets.only(left: 18),
          //     child: ListView.builder(
          //       itemCount: positions.length ~/ 2,
          //       itemBuilder: (context, index) {
          //         if ((index + 1 == positions.length ~/ 2) &&
          //             (positions.length.isOdd)) {
          //           return Padding(
          //             padding: const EdgeInsets.only(top: 2.0),
          //             child: Row(
          //               children: [
          //                 PositionButton(
          //                   fontSize: 14,
          //                   positionName: positions[positions.length - 1][0],
          //                   positionTapped: () {
          //                     positionTapped(positions.length - 1);
          //                   },
          //                   positionState: positions[positions.length - 1][1],
          //                 ),
          //               ],
          //             ),
          //           );
          //         } else {
          //           return Padding(
          //             padding: const EdgeInsets.only(top: 2.0),
          //             child: Row(
          //               children: [
          //                 PositionButton(
          //                   fontSize: 16,
          //                   positionName: positions[index * 2][0],
          //                   positionTapped: () {
          //                     positionTapped(index * 2);
          //                   },
          //                   positionState: positions[index * 2][1],
          //                 ),
          //                 PositionButton(
          //                   fontSize: 16,
          //                   positionName: positions[index * 2 + 1][0],
          //                   positionTapped: () {
          //                     positionTapped(index * 2 + 1);
          //                   },
          //                   positionState: positions[index * 2 + 1][1],
          //                 ),
          //               ],
          //             ),
          //           );
          //         }
          //       },
          //     ),
          //   ),
          // ),
          _isFilterTapped
              ? Expanded(child: FilterWidget())
              : Expanded(
                  child: ListView.builder(
                    itemCount: jobs.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: JobCard(
                          name: jobs[index][0],
                          company: jobs[index][1],
                          type: jobs[index][2],
                          money: jobs[index][3],
                          date: jobs[index][4],
                          color: jobs[index][5],
                        ),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
