import 'dart:convert';

import 'package:dentmind_dental_centre/app_colors.dart';
import 'package:dentmind_dental_centre/widgets/service_list_container.dart';
import 'package:flutter/material.dart';

import '../models/services_model.dart';
import 'services_details.dart';

class AllServicesListScreen extends StatefulWidget {
  const AllServicesListScreen({Key? key}) : super(key: key);

  @override
  State<AllServicesListScreen> createState() => _AllServicesListScreenState();
}

class _AllServicesListScreenState extends State<AllServicesListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                "All Services",
                style: TextStyle(
                    color: primaryAppColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
              Expanded(
                child: FutureBuilder(
                    future: DefaultAssetBundle.of(context)
                        .loadString("data/services.json"),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      List servicesdata = jsonDecode(snapshot.data.toString());
                      return ListView.builder(
                          itemCount: servicesdata.length,
                          itemBuilder: ((context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            ServicesDetailsPage(
                                                service:
                                                    DentmindServices.fromJson(
                                                        servicesdata[
                                                            index])))));
                              },
                              child: ServiceListContainer(
                                  service: DentmindServices.fromJson(
                                      servicesdata[index])),
                            );
                          }));
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
