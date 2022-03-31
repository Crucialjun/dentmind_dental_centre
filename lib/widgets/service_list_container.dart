import 'package:dentmind_dental_centre/models/services_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../app_colors.dart';

class ServiceListContainer extends StatelessWidget {
  const ServiceListContainer({Key? key, required this.service})
      : super(key: key);

  final DentmindServices service;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: primaryAppColor.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: Row(
          children: [
            CircleAvatar(
                radius: 32,
                backgroundColor: Colors.white,
                child: SvgPicture.asset("assets/${service.imageName}.svg")),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    service.serviceName,
                    style: const TextStyle(
                        fontSize: 22,
                        color: primaryAppColor,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    service.serviceDescription,
                    style: const TextStyle(overflow: TextOverflow.ellipsis),
                    maxLines: 3,
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
