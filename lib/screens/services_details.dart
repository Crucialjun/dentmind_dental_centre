import 'package:dentmind_dental_centre/app_colors.dart';
import 'package:dentmind_dental_centre/models/services_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      body: SafeArea(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/back.png"),
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                  child: Stack(
                children: [
                  SvgPicture.asset("${widget.service.imageName}.svg"),
                  const Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 28,
                      backgroundImage: AssetImage("assets/love.png"),
                      backgroundColor: Colors.white,
                    ),
                  ),
                ],
              )),
              Text(
                widget.service.serviceName,
                style: const TextStyle(
                    color: primaryAppColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 28),
              ),
              Text(widget.service.serviceDescription,
                  style: const TextStyle(fontSize: 14, color: Colors.black)),
            ],
          ),
        )),
      ),
    );
  }
}
