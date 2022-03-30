import 'package:dentmind_dental_centre/models/services_model.dart';
import 'package:flutter/material.dart';

class ServicesDetailsPage extends StatefulWidget {
  const ServicesDetailsPage({Key? key, required this.service})
      : super(key: key);

  final DentmindServices service;

  @override
  State<ServicesDetailsPage> createState() => _ServicesDetailsPageState();
}

class _ServicesDetailsPageState extends State<ServicesDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
            child: Column(
          children: [
            Text(
              widget.service.serviceName,
              style: const TextStyle(fontSize: 12),
            ),
            Text(widget.service.serviceDescription,
                style: const TextStyle(fontSize: 12)),
          ],
        )),
      ),
    );
  }
}
