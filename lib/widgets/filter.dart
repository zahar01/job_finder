import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:job_finder/widgets/button.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({super.key});

  @override
  State<FilterWidget> createState() => _MyFilterWidget();
}

class _MyFilterWidget extends State<FilterWidget> {
  List positions = [
    ["Developer", false],
    ["Violinist", false],
    ["Designer", false],
    ["Managment", false],
    ["Marketing", false],
    ["Judge", false],
  ];

  void positionTapped(int indexTap) {
    setState(() {
      positions[indexTap][1] = !positions[indexTap][1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Job title",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 18),
              child: ListView.builder(
                itemCount: positions.length ~/ 2,
                itemBuilder: (context, index) {
                  if ((index + 1 == positions.length ~/ 2) &&
                      (positions.length.isOdd)) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                      child: Row(
                        children: [
                          PositionButton(
                            fontSize: 14,
                            positionName: positions[positions.length - 1][0],
                            positionTapped: () {
                              positionTapped(positions.length - 1);
                            },
                            positionState: positions[positions.length - 1][1],
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                      child: Row(
                        children: [
                          PositionButton(
                            fontSize: 16,
                            positionName: positions[index * 2][0],
                            positionTapped: () {
                              positionTapped(index * 2);
                            },
                            positionState: positions[index * 2][1],
                          ),
                          PositionButton(
                            fontSize: 16,
                            positionName: positions[index * 2 + 1][0],
                            positionTapped: () {
                              positionTapped(index * 2 + 1);
                            },
                            positionState: positions[index * 2 + 1][1],
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        
      ],
    );
  }
}