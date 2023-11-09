import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:petmatch/widget/background_curve_widget.dart';

import '../constant/domain.dart';
import '../main.dart';
import '../model/pet_match.model.dart';
import '../model/profile.dart';
import '../widget/action_button_widget.dart';
import '../widget/drag_widget.dart';

class PetMatch extends StatefulWidget {
  const PetMatch({super.key});

  @override
  State<PetMatch> createState() => _PetMatchState();
}

class _PetMatchState extends State<PetMatch>
    with SingleTickerProviderStateMixin {
  final dio = Dio();

  List<PetMatchModel> petMatchModels = [];
  Future<void> getPetMatchModel() async {
    try {
      petMatchModels = [];
      Response responseService = await dio.post(
          url_api + '/match/get-pet-for-match',
          data: {"id_user": 8, "id_userhome": 8});
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
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            BackgroudCurveWidget(),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: ValueListenableBuilder(
                valueListenable: swipeNotifier,
                builder: (context, swipe, _) => Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: List.generate(petMatchModels.length, (index) {
                    if (index == petMatchModels.length - 1) {
                      return PositionedTransition(
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
                      );
                    } else {
                      return DragWidget(
                        petMatchModel: petMatchModels[index],
                        index: index,
                        swipeNotifier: swipeNotifier,
                      );
                    }
                  }),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 46.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ActionButtonWidget(
                      onPressed: () {
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
            ),
            Positioned(
              left: 0,
              child: DragTarget<int>(
                builder: (
                  BuildContext context,
                  List<dynamic> accepted,
                  List<dynamic> rejected,
                ) {
                  return IgnorePointer(
                    child: Container(
                      height: 700.0,
                      width: 80.0,
                      color: Colors.transparent,
                    ),
                  );
                },
                onAccept: (int index) {
                  setState(() {
                    petMatchModels.removeAt(index);
                  });
                },
              ),
            ),
            Positioned(
              right: 0,
              child: DragTarget<int>(
                builder: (
                  BuildContext context,
                  List<dynamic> accepted,
                  List<dynamic> rejected,
                ) {
                  return IgnorePointer(
                    child: Container(
                      height: 700.0,
                      width: 80.0,
                      color: Colors.transparent,
                    ),
                  );
                },
                onAccept: (int index) {
                  setState(() {
                    petMatchModels.removeAt(index);
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
