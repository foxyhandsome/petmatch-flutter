import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:petmatch/model/review.model.dart';

import '../constant/domain.dart';
import '../model/pet.model.dart';

class reviewother extends StatefulWidget {
  final Pet pet_home;
  final Pet pet_guest;
  const reviewother(
      {super.key, required this.pet_home, required this.pet_guest});

  @override
  State<reviewother> createState() => _reviewotherState();
}

class _reviewotherState extends State<reviewother> {
  final dio = Dio();

  List<ReviewModel> reviewModelList = [];
  Future<void> getReviewModel() async {
    try {
      final List<ReviewModel> tempReviewList = [];
      Response responseService = await dio
          .get(url_api + '/review/get-review/${widget.pet_guest.idPet}');
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

  String? idUser;
  static FlutterSecureStorage storageToken = new FlutterSecureStorage();
  Future<void> createReview() async {
    try {
      idUser = await storageToken.read(key: 'id_user');

      var requestData = {
        "review_info": _reviewController.text,
        "star": 4,
        "id_user_home": widget.pet_guest.idUser,
        "id_pet_home": widget.pet_guest.idPet,
        "id_user_review": idUser,
        "id_pet_review": widget.pet_home.idPet,
      };

      print(requestData);

      Response responseService = await dio.post(
        url_api + '/review/create-review',
        data: requestData,
      );

      if (responseService.statusCode == 200 ||
          responseService.statusCode == 201) {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
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

  TextEditingController _reviewController = TextEditingController();

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
                    MemoryImage(base64Decode("${widget.pet_guest.picturePet}")),
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
                  '${widget.pet_guest.namePet}',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          if (reviewModelList.length > 0)
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemCount: reviewModelList.length,
                  itemBuilder: (context, index) {
                    return buildReviewItem(reviewModelList[index]);
                  },
                ),
              ),
            ),
          if (reviewModelList.length == 0)
            Container(
                margin: EdgeInsets.only(top: 50),
                child: Text(
                  "ยังไม่มีการรีวิว",
                  style: TextStyle(fontSize: 25),
                )),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'แสดงความคิดเห็นของคุณ',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.0),
                SizedBox(height: 10.0),
                TextField(
                  controller: _reviewController,
                  maxLines: 2,
                  decoration: InputDecoration(
                    hintText: 'พิมพ์รีวิวของคุณที่นี่...',
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(10.0), // ปรับความโค้งขอบที่นี่
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 239, 83, 80)),
                      borderRadius:
                          BorderRadius.circular(10.0), // ปรับความโค้งขอบที่นี่
                    ),
                  ),
                ),
                SizedBox(height: 5.0),
                ElevatedButton(
                  onPressed: () {
                    createReview();
                    // โค้ดที่ต้องการให้ทำงานเมื่อปุ่มถูกกด
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 239, 83, 80),
                  ),
                  child: Text('ส่งรีวิว'),
                ),
              ],
            ),
          ),
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
              "รีวิวจากผู้ใช้ ${review.username}",
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
