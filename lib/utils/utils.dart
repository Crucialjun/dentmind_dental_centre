import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/services_model.dart';

Future<List> loadServicesList(BuildContext context) async {
  var list =
      await DefaultAssetBundle.of(context).loadString("data/services.json");

  List decode = jsonDecode(list);

  var servicesList = [];

  for (var i = 0; i < decode.length; i++) {
    var services = DentmindServices.fromJson(decode[i]);
    servicesList.add(services);
  }
  return servicesList;
}
