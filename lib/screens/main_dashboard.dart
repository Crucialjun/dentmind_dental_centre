import 'dart:convert';

import 'package:dentmind_dental_centre/app_colors.dart';
import 'package:dentmind_dental_centre/models/client_model.dart';
import 'package:dentmind_dental_centre/models/services_model.dart';
import 'package:dentmind_dental_centre/screens/all_services_list.dart';
import 'package:dentmind_dental_centre/screens/appointment_booking_screen.dart';
import 'package:dentmind_dental_centre/screens/services_details.dart';
import 'package:dentmind_dental_centre/widgets/category_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:textfield_search/textfield_search.dart';
import "string_extensions.dart";

import '../firebase/firebase_storage_methods.dart';

class MainDashboard extends StatefulWidget {
  const MainDashboard({Key? key}) : super(key: key);

  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  List servicesList = [];
  List searchList = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
                          offset: const Offset(0, 2),
                        )
                      ],
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(children: [
                      const Icon(
                        Icons.search,
                        color: accentAppColor,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Expanded(
                          child: TextFieldSearch(
                        minStringLength: 1,
                        getSelectedValue: (value) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      ServicesDetailsPage(service: value))));
                          _searchController.clear();
                        },
                        future: loadServices,
                        label: "serviceName",
                        initialList: servicesList,
                        controller: _searchController,
                        decoration: const InputDecoration(
                            hintStyle:
                                TextStyle(fontSize: 18, color: primaryAppColor),
                            border: InputBorder.none,
                            hintText: "Search for service"),
                      )),
                      const SizedBox(
                        width: 4,
                      ),
                      const Icon(
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
                  children: [
                    const Text(
                      "Browse by category",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>
                                    const AllServicesListScreen())));
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "View All",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w200,
                              decoration: TextDecoration.underline,
                              decorationThickness: 2,
                              color: primaryAppColor),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                    height: 120,
                    child: FutureBuilder(
                        future: rootBundle.loadString('assets/services.json'),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          List servicesdata =
                              jsonDecode(snapshot.data.toString());
                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: servicesdata.length,
                              itemBuilder: ((context, index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: ((context) =>
                                                ServicesDetailsPage(
                                                    service: DentmindServices
                                                        .fromJson(servicesdata[
                                                            index])))));
                                  },
                                  child: CategoryContainer(
                                      serviceName: servicesdata[index]
                                          ["serviceName"],
                                      id: servicesdata[index]["imageName"]),
                                );
                              }));
                        })),
                const SizedBox(
                  height: 16,
                ),
                Expanded(
                  child: ListView(
                    children: [
                      appointmentCard(
                          "Dental Surgeon",
                          "Nabea",
                          "Bachelor of Dental Surgery (BDS)",
                          "nabea",
                          "Kitengela"),
                      const SizedBox(
                        height: 16,
                      ),
                      appointmentCard(
                          "Dental Surgeon",
                          "Muturi",
                          "Bachelor of Dental Surgery (BDS)",
                          "muturi",
                          "Mombasa Road"),
                      const SizedBox(
                        height: 16,
                      ),
                      appointmentCard(
                          "Dental Surgeon",
                          "Nabea",
                          "Bachelor of Dental Surgery (BDS)",
                          "nabea",
                          "Buruburu"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Container appointmentCard(String speciality, String name,
      String qualification, String image, String location) {
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
            offset: const Offset(0, 3),
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
                backgroundImage: AssetImage("assets/$image.jpg"),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$speciality - Doctor $name",
                      style: const TextStyle(
                          color: primaryAppColor, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      qualification,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    RatingBar.builder(
                        initialRating: 5,
                        itemSize: 24.0,
                        itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: accentAppColor,
                            ),
                        onRatingUpdate: (rating) {}),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("Dentmind Dental Care $location",
                        style: const TextStyle(
                            color: primaryAppColor,
                            fontWeight: FontWeight.w700)),
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
              const CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("assets/chronometer.png"),
              ),
              const SizedBox(
                width: 16,
              ),
              const Expanded(
                  child: Text(
                "Open timings : 9:00am - 5:00pm",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
              )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 24, 153, 93)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) =>
                                const AppoitnmentBooking())));
                  },
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

  Future<List> loadServices() async {
    var list = await rootBundle.loadString('assets/services.json');

    List decode = jsonDecode(list);

    var servicesList = [];

    for (var i = 0; i < decode.length; i++) {
      var services = DentmindServices.fromJson(decode[i]);
      servicesList.add(services);
    }
    return servicesList;
  }
}
