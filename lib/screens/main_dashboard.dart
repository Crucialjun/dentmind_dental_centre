import 'package:dentmind_dental_centre/app_colors.dart';
import 'package:flutter/material.dart';

class MainDashboard extends StatefulWidget {
  const MainDashboard({Key? key}) : super(key: key);

  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 230, 230, 230),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.menu,
                color: accentAppColor,
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "Hello Nicholas",
                style: TextStyle(color: primaryAppColor),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Find Your Dentist",
                style: TextStyle(
                    color: primaryAppColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 42),
              ),
              const Text(
                "Book an appointment for consultation",
                style: TextStyle(color: primaryAppColor, fontSize: 24),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: const [
                    Icon(
                      Icons.search,
                      color: accentAppColor,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Expanded(
                        child: TextField(
                      decoration: InputDecoration(
                          hintStyle: TextStyle(fontSize: 18),
                          border: InputBorder.none,
                          hintText: "Search for service"),
                    )),
                    SizedBox(
                      width: 4,
                    ),
                    Icon(
                      Icons.settings,
                      color: accentAppColor,
                    )
                  ]),
                ),
              ),
            ],
          ),
        ));
  }
}
