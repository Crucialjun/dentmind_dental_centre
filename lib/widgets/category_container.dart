import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../app_colors.dart';

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({
    Key? key,
    required this.serviceName,
    required this.id,
  }) : super(key: key);

  final String serviceName;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 4, bottom: 8, left: 4, right: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: primaryAppColor.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 3),
            )
          ],
        ),
        width: 170,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: SvgPicture.asset('assets/$id.svg')),
              const SizedBox(
                height: 4,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  serviceName,
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    color: primaryAppColor,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
