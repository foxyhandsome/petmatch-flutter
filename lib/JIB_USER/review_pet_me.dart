import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:petmatch/model/review.model.dart';

import '../constant/domain.dart';
import '../model/pet.model.dart';

class ReviewPetMe extends StatefulWidget {
  final Pet pet;
  const ReviewPetMe({super.key, required this.pet});

  @override
  State<ReviewPetMe> createState() => _ReviewPetMeState();
}

class _ReviewPetMeState extends State<ReviewPetMe> {
  final dio = Dio();

  List<ReviewModel> reviewModelList = [];
  Future<void> getReviewModel() async {
    try {
      final List<ReviewModel> tempReviewList = [];
      Response responseService =
          await dio.get(url_api + '/review/get-review/${widget.pet.idPet}');
      if (responseService.statusCode == 200) {
        responseService.data.forEach((element) {
          tempReviewList.add(ReviewModel.fromJson(element));
        });
        setState(() {
          reviewModelList = tempReviewList;
        });
      } else {
        print('Request failed with status: ${responseService.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that may occur during the request
      print('Error: $e');
    }
  }

  @override
  void initState() {
    getReviewModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 239, 83, 80),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "รีวิว",
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 20.0),
          Center(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Color.fromARGB(255, 239, 83, 80),
                  width: 5.0,
                ),
              ),
              child: CircleAvatar(
                radius: 60,
                backgroundImage:
                    MemoryImage(base64Decode("${widget.pet.picturePet}")),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "รีวิวของ",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 10.0),
                Text(
                  '${widget.pet.namePet}',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.0),
          if (reviewModelList.length > 0)
            Container(
              height: 400,
              child: ListView.builder(
                itemCount: reviewModelList.length,
                itemBuilder: (context, index) {
                  return buildReviewItem(reviewModelList[index]);
                },
              ),
            ),
          if (reviewModelList.length == 0)
            Container(
                margin: EdgeInsets.only(top: 50),
                child: Text(
                  "ยังไม่มีการรีวิว",
                  style: TextStyle(fontSize: 25),
                )),
        ],
      ),
    );
  }

  Widget buildReviewItem(ReviewModel review) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 10, 0.0, 0),
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: Color.fromARGB(255, 239, 83, 80),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "${review.username}:",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              '${review.reviewInfo}',
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
