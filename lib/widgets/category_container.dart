import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../app_colors.dart';

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({
    Key? key,
    required this.serviceName,
  }) : super(key: key);

  final String serviceName;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16)),
        width: 120,
        height: 120,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              Expanded(child: SvgPicture.asset('assets/service_one.svg')),
              const SizedBox(
                height: 4,
              ),
              Text(
                serviceName,
                style: const TextStyle(
                  color: primaryAppColor,
                ),
              ),
            ],
          ),
        ));
  }
}
