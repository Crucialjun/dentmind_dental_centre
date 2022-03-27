import 'package:dentmind_dental_centre/app_colors.dart';
import 'package:dentmind_dental_centre/models/client_model.dart';
import 'package:dentmind_dental_centre/widgets/category_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import "string_extensions.dart";

import '../firebase/firebase_storage_methods.dart';

class MainDashboard extends StatefulWidget {
  const MainDashboard({Key? key}) : super(key: key);

  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  @override
  Widget build(BuildContext context) {
    final _firebaseUser = context.watch<User?>();
    Future<Client?> _client = getClient(_firebaseUser);

    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
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
                FutureBuilder(
                    future: _client,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Text("Hello User",
                            style: TextStyle(
                                color: primaryAppColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w500));
                      } else if (snapshot.hasError) {
                        return const Text("Hello user",
                            style: TextStyle(
                                color: primaryAppColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w500));
                      } else {
                        return Text(
                            "Hello ${(((snapshot.data) as Client).firstName).capitalizeFirstLetter()} ${(((snapshot.data) as Client).lastName).capitalizeFirstLetter()}",
                            style: const TextStyle(
                                color: primaryAppColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w500));
                      }
                    }),
                const SizedBox(
                  height: 4,
                ),
                const Text(
                  "Find Your Dentist",
                  style: TextStyle(
                      color: primaryAppColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 36),
                ),
                const Text(
                  "Book an appointment for consultation",
                  style: TextStyle(color: primaryAppColor, fontSize: 18),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: primaryAppColor.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        )
                      ],
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
                            hintStyle:
                                TextStyle(fontSize: 18, color: primaryAppColor),
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
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Browse by category",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ),
                    Text(
                      "View All",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w200,
                          decoration: TextDecoration.underline,
                          decorationThickness: 2,
                          color: primaryAppColor),
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 120,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      CategoryContainer(
                        serviceName: 'General Dentistry',
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      CategoryContainer(
                        serviceName: 'Restorative Dentistry',
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      CategoryContainer(
                        serviceName: 'Periontology Dentistry',
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      CategoryContainer(
                        serviceName: 'Dental Surgery',
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      CategoryContainer(
                        serviceName: 'Pediatric Dentistry',
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      CategoryContainer(
                        serviceName: 'Cosmetic Dentistry',
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      CategoryContainer(
                        serviceName: 'Prosthetic Dentistry',
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      CategoryContainer(
                        serviceName: 'Dental X-Rays',
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Expanded(
                  child: ListView(
                    children: [
                      appointmentCard(),
                      const SizedBox(
                        height: 16,
                      ),
                      appointmentCard(),
                      const SizedBox(
                        height: 16,
                      ),
                      appointmentCard(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Container appointmentCard() {
    return Container(
      margin: const EdgeInsets.only(top: 4, left: 4, right: 4, bottom: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: primaryAppColor.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 4,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 50,
                child: Image.asset(
                  "assets/medicine_bro.png",
                  scale: 0.2,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Doctor Firstname Lastname"),
                    const Text("Doctors ranking and achievement"),
                    RatingBar.builder(
                        initialRating: 5,
                        itemSize: 24.0,
                        itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: accentAppColor,
                            ),
                        onRatingUpdate: (rating) {}),
                    const Text("Dentmind Dental Care Kitengela"),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Icon(Icons.favorite),
                  SizedBox(
                    height: 48,
                  ),
                  Text("1.5Km")
                ],
              )
            ],
          ),
          const Divider(
            thickness: 4,
          ),
          Row(
            children: [
              const Icon(Icons.timer),
              const SizedBox(
                width: 4,
              ),
              const Expanded(child: Text("Open timings : 9:00am - 5:00pm")),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: primaryAppColor),
                  onPressed: () {},
                  child: const Text("Book Now"))
            ],
          ),
        ]),
      ),
    );
  }

  Future<Client?> getClient(User? firebaseUser) async {
    var client = await FirebaseStorageMethods().getClient(firebaseUser!.uid);
    return client;
  }
}
