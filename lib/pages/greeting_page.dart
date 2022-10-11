import 'package:flutter/material.dart';
import 'package:job_finder/pages/main_page.dart';

class GreetingPage extends StatelessWidget {
  const GreetingPage({super.key});

  @override
  Widget build(BuildContext context) {
    List pages = [
      [
        "greet1.gif",
        "Knowledge",
        "We have vacancies for both novice specialists and experienced professionals. For example, you can post a resume on the site so that employers can contact you."
      ],
      [
        "greet2.gif",
        "Training",
        "We have vacancies for both novice specialists and experienced professionals. For example, you can post a resume on the site so that employers can contact you."
      ],
      [
        "greet3.gif",
        "Realisation",
        "We have vacancies for both novice specialists and experienced professionals. For example, you can post a resume on the site so that employers can contact you."
      ],
    ];

    return SafeArea(
      child: Scaffold(
        body: PageView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: pages.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MainPage()));
                      },
                      child: Text(
                        "Skip",
                        style: TextStyle(
                          color: Colors.grey[500],
                        ),
                      ),
                    ),
                  ],
                ),
                Image(
                  image: AssetImage("img/" + pages[index][0]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    pages.length,
                    (indexLines) => Container(
                      margin: const EdgeInsets.only(right: 5),
                      height: 4,
                      width: index == indexLines ? 34 : 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: index == indexLines
                            ? Colors.black
                            : Colors.grey[400],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            pages[index][1],
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        pages[index][2],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
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
                          padding:
                              const EdgeInsets.only(left: 35.0, right: 35.0),
                          child: TextButton(
                            onPressed: () {
                              if (index == pages.length - 1) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => MainPage()));
                              }
                            },
                            child: Text(
                              "Next",
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
            );
          },
        ),
      ),
    );
  }
}
