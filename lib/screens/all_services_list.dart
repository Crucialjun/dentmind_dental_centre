import 'dart:convert';

import 'package:dentmind_dental_centre/app_colors.dart';
import 'package:dentmind_dental_centre/widgets/service_list_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: const Text("All Services",
            style: TextStyle(
                color: primaryAppColor,
                fontWeight: FontWeight.bold,
                fontSize: 24)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              Expanded(
                child: FutureBuilder(
                    future: rootBundle.loadString('assets/services.json'),
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
