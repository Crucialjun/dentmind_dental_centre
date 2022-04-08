import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../app_colors.dart';
import '../screens/appointment_booking_screen.dart';

class AppointmentCard extends StatefulWidget {
  const AppointmentCard(
      {Key? key,
      required this.speciality,
      required this.name,
      required this.qualification,
      required this.image,
      required this.location})
      : super(key: key);

  final String speciality;
  final String name;
  final String qualification;
  final String image;
  final String location;
  @override
  State<AppointmentCard> createState() => _AppointmentCardState();
}

class _AppointmentCardState extends State<AppointmentCard> {
  @override
  Widget build(BuildContext context) {
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
                backgroundImage: AssetImage("assets/${widget.image}.jpg"),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.speciality} - Doctor ${widget.name}",
                      style: const TextStyle(
                          color: primaryAppColor, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      widget.qualification,
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
                    Text("Dentmind Dental Care ${widget.location}",
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
                            builder: ((context) => AppoitnmentBooking(
                                location: widget.location))));
                  },
                  child: const Text("Book Now"))
            ],
          ),
        ]),
      ),
    );
  }
}
