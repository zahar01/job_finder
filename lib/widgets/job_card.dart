import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class JobCard extends StatelessWidget {
  final String name;
  final String company;
  final String type;
  final int money;
  final int date;
  final Color color;

  const JobCard({
    super.key,
    required this.name,
    required this.company,
    required this.type,
    required this.money,
    required this.date,
    required this.color
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(company),
                  ],
                ),
                Icon(Icons.keyboard_control)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0, left: 8.0, bottom: 8.0),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, bottom: 8.0, right: 20.0, left: 20.0),
                      child: Text(type),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, bottom: 8.0, right: 20.0, left: 20.0),
                        child: Text(
                          r"$" + money.toString() + "+",
                        ),
                      ),
                    ),
                  ),
                  Text(
                    date.toString() + " days ago",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
