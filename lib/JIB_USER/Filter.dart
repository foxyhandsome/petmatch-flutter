import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:petmatch/JIB_USER/home.dart';
import 'package:petmatch/JIB_USER/menu.dart';
import 'package:petmatch/JIB_USER/pet_match.dart';
import 'package:petmatch/model/district.model.dart';
import 'package:petmatch/model/district_sub.model.dart';
import 'package:petmatch/model/petbreed.model.dart';
import 'package:petmatch/model/petskin.model.dart';

import '../constant/domain.dart';
import '../model/RequestMatch.model.dart';
import '../model/pet.model.dart';
import '../model/petblood.model.dart';

List<String> list3 = <String>[
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9',
  '10',
  '11',
  '12',
  '13',
  '14',
  '15',
  '16',
  '17',
  '18',
  '19',
  '20',
]; //อายุ

/// Flutter code sample for [ToggleButtons].

class Filter extends StatefulWidget {
  final Pet pet;
  const Filter({Key? key, required this.pet});

  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  static FlutterSecureStorage storageToken = new FlutterSecureStorage();
  final dio = Dio();

  @override
  void initState() {
    getPetblood();
    getPetskin();
    getPetbreed();
    getData();
    super.initState();
  }

// <------------เลือด------------>
  List<Petblood> petbloods = [];
  Petblood? petbloodsSelect;
  Future<void> getPetblood() async {
    try {
      petbloods = [];
      Response responseService =
          await dio.get(url_api + '/petblood/get-petblood');
      if (responseService.statusCode == 200) {
        // final responseData = response.data;
        List<Petblood> response = [];
        responseService.data.forEach((element) {
          response.add(Petblood.fromJson(element));
        });
        setState(() {
          petbloods = response;
        });
      } else {
        print('Request failed with status: ${responseService.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that may occur during the request
      print('Error: $e');
    }
  }

  void _onDropDownItemSelectedPetblood(Petblood newSelectedBank) {
    setState(() {
      petbloodsSelect = newSelectedBank;
    });
  }
  // <----------------------------->

  // <------------สีขน------------>
  List<Petskin> petskins = [];
  Petskin? petskinSelect;
  Future<void> getPetskin() async {
    try {
      petskins = [];
      Response responseService =
          await dio.get(url_api + '/petskin/get-petskin');
      if (responseService.statusCode == 200) {
        // final responseData = response.data;
        List<Petskin> response = [];
        responseService.data.forEach((element) {
          response.add(Petskin.fromJson(element));
        });
        setState(() {
          petskins = response;
        });
      } else {
        print('Request failed with status: ${responseService.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that may occur during the request
      print('Error: $e');
    }
  }

  void _onDropDownItemSelectedPetskin(Petskin newSelectedPetskin) {
    setState(() {
      petskinSelect = newSelectedPetskin;
    });
  }
  // <----------------------------->

  // <------------สายพันธุ์------------>
  List<Petbreed> petbreeds = [];
  Petbreed? petbreedSelect;
  Future<void> getPetbreed() async {
    try {
      petbreeds = [];
      Response responseService =
          await dio.get(url_api + '/petbreed/get-petbreed');
      if (responseService.statusCode == 200) {
        // final responseData = response.data;
        List<Petbreed> response = [];
        responseService.data.forEach((element) {
          response.add(Petbreed.fromJson(element));
        });
        setState(() {
          petbreeds = response;
        });
      } else {
        print('Request failed with status: ${responseService.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that may occur during the request
      print('Error: $e');
    }
  }

  void _onDropDownItemSelectedPetbreed(Petbreed newSelectedPetbreed) {
    setState(() {
      petbreedSelect = newSelectedPetbreed;
    });
  }

  static String printJson(jsonObject, {bool isShowLog = true}) {
    JsonEncoder encoder = new JsonEncoder.withIndent("     ");
    String response = encoder.convert(jsonObject);
    if (true == isShowLog) {
      log(response);
    }
    return response;
  }

  int? sex_pet;
  String? id_user;
  void addPet(BuildContext context) async {
    id_user = await storageToken.read(key: 'id_user');
    try {
      final Map<String, dynamic> petData = {
        "id_blood": petbloodsSelect!.idBlood,
        "id_skin": petskinSelect!.idSkin,
        "id_breed": petbreedSelect!.idBreed.toString(),
        "name_pet": nameControl.text,
        "age_pet": dropdownValue3,
        "id_user": id_user,
        "sex_pet": sex_pet == 0 ? "ผู้" : "เมีย"
      };
      Response response =
          await dio.post(url_api + '/pet/create-pet', data: petData);
      if (response.statusCode == 201) {
        Navigator.of(context).pop();
      } else {
        print("HTTP Error: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  int? id_district;
  int? id_subdistrict;
  List<DropdownMenuEntry<Districtmodel>> dataList =
      <DropdownMenuEntry<Districtmodel>>[];
  Future<void> getData() async {
    try {
      dataList = [];
      final response = await dio.get(url_api + '/district/get-district');
      if (response.statusCode == 200) {
        final responseData = response.data;
        for (var element in responseData) {
          dataList.add(DropdownMenuEntry<Districtmodel>(
            value: Districtmodel.fromJson(element),
            label: element["name_district"],
          ));
        }
        setState(() {});
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that may occur during the request
      print('Error: $e');
    }
  }

  List<DropdownMenuEntry<DistrictSubModel>> dataSubList =
      <DropdownMenuEntry<DistrictSubModel>>[];
  Future<void> getDataSub(int id) async {
    try {
      final response = await dio.get(url_api +
          '/subdistrict/get-subdistrictbydistrictid/' +
          id.toString());
      if (response.statusCode == 200) {
        final responseData = response.data;
        // dataSubList = [];
        for (var element in responseData) {
          dataSubList.add(DropdownMenuEntry<DistrictSubModel>(
            value: DistrictSubModel.fromJson(element),
            label: element["name_subdistrict"],
          ));
        }
        setState(() {});
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
      setState(() {});
    } catch (e) {
      print('Error: $e');
    }
  }

  RequestMatch? req;
  goToMatch() {
    req = RequestMatch(
      age: dropdownValue3,
      petbreedSelect: petbreedSelect?.idBreed ?? null,
      petskinSelect: petskinSelect?.idSkin,
      petbloodsSelect: petbloodsSelect?.idBlood,
      id_district: id_district ?? null,
      sexPet: widget.pet.sexPet ?? null,
    );
    printJson(req);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: ((context) => PetMatch(pet: widget.pet, requestMatch: req!)),
      ),
    );
  }

  TextEditingController nameControl = TextEditingController();

  String dropdownValue3 = list3.first; //อายุ

  List<bool> isSelected = [false, false]; // 0 = เพศผู้, 1 = เพศเมีย

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 239, 83, 80),
        leading: IconButton(
          icon:
              Icon(Icons.arrow_back, color: Color.fromARGB(255, 255, 255, 255)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "เลือกรูปแบบสัตว์เลี้ยงที่สนใจ",
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
      ),
      // backgroundColor: Color.fromARGB(255, 255, 255, 255),

      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color:
              Color.fromARGB(255, 255, 255, 255), // Set your desired color here
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
///////////////////////////สัตว์เลี้ยง//////////////////////////////////////////////////////////////////////////////////////

              SizedBox(height: 10.0),
              Text(
                "อายุไม่เกิน(ปี)",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5.0),
              DropdownMenu<String>(
                initialSelection: list3.first,
                onSelected: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    dropdownValue3 = value!;
                  });
                },
                dropdownMenuEntries:
                    list3.map<DropdownMenuEntry<String>>((String value) {
                  return DropdownMenuEntry<String>(value: value, label: value);
                }).toList(),
                width: 380,
              ),

              SizedBox(height: 10.0),
              Text(
                "สายพันธุ์",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5.0),
              Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                        color: Color.fromARGB(255, 37, 37, 37), width: 1)),
                width: double.infinity,
                margin: EdgeInsets.only(left: 5, right: 5),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<Petbreed>(
                    style: TextStyle(
                      fontSize: 16,
                      color: const Color.fromARGB(255, 30, 30, 30),
                      fontFamily: "verdana_regular",
                    ),
                    hint: Text(
                      "เลือกสายพันธุ์",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontFamily: "verdana_regular",
                      ),
                    ),
                    items: petbreeds
                        .map<DropdownMenuItem<Petbreed>>((Petbreed value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Icon(valueItem.bank_logo),
                            SizedBox(
                              width: 15,
                            ),
                            Text(value.nameBreed!),
                          ],
                        ),
                      );
                    }).toList(),
                    isExpanded: true,
                    isDense: true,
                    onChanged: (Petbreed? newSelectedPetbreed) {
                      _onDropDownItemSelectedPetbreed(newSelectedPetbreed!);
                    },
                    value: petbreedSelect,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                "สีขน",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5.0),
              Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                        color: Color.fromARGB(255, 37, 37, 37), width: 1)),
                width: double.infinity,
                margin: EdgeInsets.only(left: 5, right: 5),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<Petskin>(
                    style: TextStyle(
                      fontSize: 16,
                      color: const Color.fromARGB(255, 30, 30, 30),
                      fontFamily: "verdana_regular",
                    ),
                    hint: Text(
                      "เลือกสีขน",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontFamily: "verdana_regular",
                      ),
                    ),
                    items: petskins
                        .map<DropdownMenuItem<Petskin>>((Petskin value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Icon(valueItem.bank_logo),
                            SizedBox(
                              width: 15,
                            ),
                            Text(value.typeSkin!),
                          ],
                        ),
                      );
                    }).toList(),
                    isExpanded: true,
                    isDense: true,
                    onChanged: (Petskin? newSelectedPetskin) {
                      _onDropDownItemSelectedPetskin(newSelectedPetskin!);
                    },
                    value: petskinSelect,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                "กรุ๊ปเลือด",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5.0),
              Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                        color: Color.fromARGB(255, 37, 37, 37), width: 1)),
                width: double.infinity,
                margin: EdgeInsets.only(left: 5, right: 5),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<Petblood>(
                    style: TextStyle(
                      fontSize: 16,
                      color: const Color.fromARGB(255, 30, 30, 30),
                      fontFamily: "verdana_regular",
                    ),
                    hint: Text(
                      "เลือกกรุ๊ปเลือด",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontFamily: "verdana_regular",
                      ),
                    ),
                    items: petbloods
                        .map<DropdownMenuItem<Petblood>>((Petblood value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Icon(valueItem.bank_logo),
                            SizedBox(
                              width: 15,
                            ),
                            Text(value.typeBlood!),
                          ],
                        ),
                      );
                    }).toList(),
                    isExpanded: true,
                    isDense: true,
                    onChanged: (Petblood? newSelectedPetblood) {
                      _onDropDownItemSelectedPetblood(newSelectedPetblood!);
                    },
                    value: petbloodsSelect,
                  ),
                ),
              ),
              Text(
                "เลือกเขต",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5.0),
              DropdownMenu<Districtmodel>(
                hintText: 'เลือกเขต',
                dropdownMenuEntries: dataList,
                onSelected: (Districtmodel? data) {
                  setState(() {
                    id_district = data!.idDistrict!;
                    dataSubList = [];
                  });
                  print(data!.idDistrict);
                },
                width: 340,
              ),

              SizedBox(height: 20.0),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 239, 83, 80),
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    goToMatch();
                  },
                  child: Text(
                    'ไปจับคู่เล๊ย',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  )), // <-- Check this comma
            ],
          ),
        ),
      ),
    );
  }
}
