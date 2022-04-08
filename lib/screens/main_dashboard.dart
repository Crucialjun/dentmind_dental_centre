import 'dart:convert';

import 'package:dentmind_dental_centre/app_colors.dart';
import 'package:dentmind_dental_centre/models/client_model.dart';
import 'package:dentmind_dental_centre/models/services_model.dart';
import 'package:dentmind_dental_centre/screens/all_services_list.dart';
import 'package:dentmind_dental_centre/screens/services_details.dart';
import 'package:dentmind_dental_centre/widgets/appointment_card.dart';
import 'package:dentmind_dental_centre/widgets/category_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                      } else if (snapshot.data == null) {
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
                    children: const [
                      AppointmentCard(
                          speciality: "Dental Surgeon",
                          name: "Nabea",
                          qualification: "Bachelor of Dental Surgery (BDS)",
                          image: "nabea",
                          location: "Kitengela"),
                      SizedBox(
                        height: 16,
                      ),
                      AppointmentCard(
                          speciality: "Dental Surgeon",
                          name: "Muturi",
                          qualification: "Bachelor of Dental Surgery (BDS)",
                          image: "muturi",
                          location: "Mombasa Road"),
                      SizedBox(
                        height: 16,
                      ),
                      AppointmentCard(
                          speciality: "Dental Surgeon",
                          name: "Nabea",
                          qualification: "Bachelor of Dental Surgery (BDS)",
                          image: "nabea",
                          location: "Buruburu"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
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
