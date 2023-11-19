import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:petmatch/widget/background_curve_widget.dart';

import '../constant/domain.dart';
import '../main.dart';
import '../model/pet.model.dart';
import '../model/pet_match.model.dart';
import '../model/profile.dart';
import '../widget/action_button_widget.dart';
import '../widget/drag_widget.dart';

class PetMatch extends StatefulWidget {
  final Pet pet;
  const PetMatch({super.key, required this.pet});

  @override
  State<PetMatch> createState() => _PetMatchState();
}

class _PetMatchState extends State<PetMatch>
    with SingleTickerProviderStateMixin {
  final dio = Dio();
  static FlutterSecureStorage storageToken = new FlutterSecureStorage();
  List<PetMatchModel> petMatchModels = [];
  String? id_user;
  Future<void> getPetMatchModel() async {
    id_user = await storageToken.read(key: 'id_user');
    try {
      petMatchModels = [];
      Response responseService = await dio
          .post(url_api + '/match/get-pet-for-match', data: {
        "id_user": id_user,
        "id_userhome": id_user,
        "id_userguest": id_user
      });
      if (responseService.statusCode == 201) {
        List<PetMatchModel> response = [];
        responseService.data.forEach((element) {
          response.add(PetMatchModel.fromJson(element));
        });
        setState(() {
          petMatchModels = response;
        });
      } else {
        print('Request failed with status: ${responseService.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that may occur during the request
      print('Error: $e');
    }
  }

  static String printJson(jsonObject, {bool isShowLog = true}) {
    JsonEncoder encoder = new JsonEncoder.withIndent("     ");
    String response = encoder.convert(jsonObject);
    if (true == isShowLog) {
      log(response);
    }
    return response;
  }

  actionLike(int index) async {
    id_user = await storageToken.read(key: 'id_user');
    printJson({
      "id_userhome": int.parse(id_user!),
      "id_pethome": widget.pet.idPet,
      "id_userguest": petMatchModels[index].idUser,
      "id_petguest": petMatchModels[index].idPet,
      "match_userguest": false,
      "match_userguest_deny" : false,
      "match_userhome": true,
      "match_dislike": false
    });
    try {
      Response responseService =
          await dio.post(url_api + '/match/create-pet-match-info', data: {
        "id_userhome": int.parse(id_user!),
        "id_pethome": widget.pet.idPet,
        "id_userguest": petMatchModels[index].idUser,
        "id_petguest": petMatchModels[index].idPet,
        "match_userguest": false,
        "match_userguest_deny" : false,
        "match_userhome": true,
        "match_dislike": false
      });

      if (responseService.statusCode == 201) {
      } else {
        print('Request failed with status: ${responseService.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that may occur during the request
      print('Error: $e');
    }
  }

  actionDisLike(int index) async {
    id_user = await storageToken.read(key: 'id_user');
    printJson({
      "id_userhome": int.parse(id_user!),
      "id_pethome": widget.pet.idPet,
      "id_userguest": petMatchModels[index].idUser,
      "id_petguest": petMatchModels[index].idPet,
      "match_userguest": false,
      "match_userguest_deny" : false,
      "match_userhome": false,
      "match_dislike": true
    });
    try {
      Response responseService =
          await dio.post(url_api + '/match/create-pet-match-info', data: {
        "id_userhome": int.parse(id_user!),
        "id_pethome": widget.pet.idPet,
        "id_userguest": petMatchModels[index].idUser,
        "id_petguest": petMatchModels[index].idPet,
        "match_userguest": false,
        "match_userguest_deny" : false,
        "match_userhome": false,
        "match_dislike": true
      });

      if (responseService.statusCode == 201) {
      } else {
        print('Request failed with status: ${responseService.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that may occur during the request
      print('Error: $e');
    }
  }

  ValueNotifier<Swipe> swipeNotifier = ValueNotifier(Swipe.none);
  late final AnimationController _animationController;

  @override
  void initState() {
    getPetMatchModel();
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        petMatchModels.removeLast();
        _animationController.reset();

        swipeNotifier.value = Swipe.none;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 239, 83, 80),
          elevation: 0,
          title: Text(
            "จับคู่สัตว์เลี้ยง",
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions: [],
        ),
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            if (petMatchModels.length == 0)
              Container(
                  child: Center(
                      child: Text(
                'ไม่พบสัตว์เลี้ยง',
                style: TextStyle(fontSize: 20),
              ))),
            if (petMatchModels.length > 0)
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: ValueListenableBuilder(
                  valueListenable: swipeNotifier,
                  builder: (context, swipe, _) => Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: List.generate(petMatchModels.length, (index) {
                      if (index == petMatchModels.length - 1) {
                        return Column(
                          children: [
                            PositionedTransition(
                              rect: RelativeRectTween(
                                begin: RelativeRect.fromSize(
                                    const Rect.fromLTWH(0, 0, 580, 340),
                                    const Size(580, 340)),
                                end: RelativeRect.fromSize(
                                    Rect.fromLTWH(
                                        swipe != Swipe.none
                                            ? swipe == Swipe.left
                                                ? -300
                                                : 300
                                            : 0,
                                        0,
                                        580,
                                        340),
                                    const Size(580, 340)),
                              ).animate(CurvedAnimation(
                                parent: _animationController,
                                curve: Curves.easeInOut,
                              )),
                              child: RotationTransition(
                                turns: Tween<double>(
                                        begin: 0,
                                        end: swipe != Swipe.none
                                            ? swipe == Swipe.left
                                                ? -0.1 * 0.3
                                                : 0.1 * 0.3
                                            : 0.0)
                                    .animate(
                                  CurvedAnimation(
                                    parent: _animationController,
                                    curve: const Interval(0, 0.4,
                                        curve: Curves.easeInOut),
                                  ),
                                ),
                                child: DragWidget(
                                  petMatchModel: petMatchModels[index],
                                  index: index,
                                  swipeNotifier: swipeNotifier,
                                  isLastCard: true,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 46.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ActionButtonWidget(
                                    onPressed: () {
                                      actionDisLike(index);
                                      swipeNotifier.value = Swipe.left;
                                      _animationController.forward();
                                    },
                                    icon: const Icon(
                                      Icons.close,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  ActionButtonWidget(
                                    onPressed: () {
                                      actionLike(index);
                                      swipeNotifier.value = Swipe.right;
                                      _animationController.forward();
                                    },
                                    icon: const Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Column(
                          children: [
                            DragWidget(
                              petMatchModel: petMatchModels[index],
                              index: index,
                              swipeNotifier: swipeNotifier,
                            ),
                          ],
                        );
                      }
                    }),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
