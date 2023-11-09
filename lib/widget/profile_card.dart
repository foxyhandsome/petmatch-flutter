import 'dart:convert';

import 'package:flutter/material.dart';

import '../model/pet_match.model.dart';
import '../model/profile.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({Key? key, required this.petMatchModel}) : super(key: key);
  final PetMatchModel petMatchModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 580,
      width: 340,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.memory(
                base64Decode(petMatchModel.picturePet!),
                fit: BoxFit.fitHeight,
              ),
              // child: Image.asset(
              //   petMatchModel.picturePet,
              //   fit: BoxFit.fitHeight,
              // ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 80,
              width: 340,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                shadows: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'ชื่อ ${petMatchModel.namePet!}',
                      style: const TextStyle(
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w800,
                        fontSize: 21,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'เพศ${petMatchModel.sexPet!}',
                          style: const TextStyle(
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color.fromARGB(255, 89, 88, 88),
                          ),
                        ),
                        Text(
                          ' อายุ ${petMatchModel.agePet!}',
                          style: const TextStyle(
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color.fromARGB(255, 89, 88, 88),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
