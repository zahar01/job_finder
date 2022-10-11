import 'dart:async';
import 'package:flutter/material.dart';
import 'package:job_finder/widgets/button.dart';

class PositionSelect extends StatefulWidget {
  const PositionSelect({super.key});

  @override
  State<PositionSelect> createState() => _PositionSelectState();
}

class _PositionSelectState extends State<PositionSelect> {
  List positions = [
    ["Developer", false],
    ["Violinist", false],
    ["Artist", false],
    ["Hairdresser", false],
    ["Musician", false],
    ["Miner", false],
    ["Gamer", false],
    ["Receptionist", false],
    ["Waiter", false],
    ["Optician", false],
    ["Paramedic", false],
    ["Judge", false],
    ["Pharmacist", false],
  ];

  void positionTapped(int indexTap) {
    setState(() {
      positions[indexTap][1] = !positions[indexTap][1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Skip",
                    style: TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Select your position",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 32, right: 12),
                child: ListView.builder(
                  itemCount: positions.length ~/ 2,
                  itemBuilder: (context, index) {
                    if ((index + 1 == positions.length ~/ 2) &&
                        (positions.length.isOdd)) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Row(
                          children: [
                            PositionButton(
                              positionName: positions[positions.length - 1][0],
                              positionTapped: () {
                                positionTapped(positions.length - 1);
                              },
                              fontSize: 18,
                              positionState: positions[positions.length - 1][1],
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Row(
                          children: [
                            PositionButton(
                              fontSize: 18,
                              positionName: positions[index * 2][0],
                              positionTapped: () {
                                positionTapped(index * 2);
                              },
                              positionState: positions[index * 2][1],
                            ),
                            PositionButton(
                              fontSize: 18,
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
            Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(),
                        ),
                        child: BackButton(
                          onPressed: () {},
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 35.0, right: 35.0),
                          child: TextButton(
                            onPressed: (){},
                            child: Text(
                              "Get started",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
