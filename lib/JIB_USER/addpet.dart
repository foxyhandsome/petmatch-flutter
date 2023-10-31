import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petmatch/JIB_USER/allpet.dart';
import 'package:petmatch/JIB_USER/loginjib.dart';
import 'package:petmatch/JIB_USER/menu.dart';
import 'package:petmatch/JIB_USER/profileuser.dart';
import 'dart:io';
import 'package:petmatch/authenticationsScreen/editdog.dart';

import '../constant/domain.dart';
import '../model/petblood.model.dart';
import '../model/petbreed.model.dart';
import '../model/petskin.model.dart';

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
]; //อายุ

class addpet extends StatefulWidget {
  @override
  _addpetState createState() => _addpetState();
}

class _addpetState extends State<addpet> {
  static FlutterSecureStorage storageToken = new FlutterSecureStorage();
  final dio = Dio();

  @override
  void initState() {
    getPetblood();
    getPetskin();
    getPetbreed();
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

  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  Future getImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
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
        "picture_pet": image,
        "id_blood": petbloodsSelect!.idBlood,
        "id_skin": petskinSelect!.idSkin,
        "id_breed": petbreedSelect!.idBreed.toString(),
        "name_pet": nameControl.text,
        "age_pet": dropdownValue3,
        "id_user": id_user,
        "health_pet": imageBreed,
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

  String? image;
  Future<void> chooseFile(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: source,
      maxWidth: 500,
      imageQuality: 100,
    );
    if (pickedFile == null) return;
    final bytes = await pickedFile.readAsBytes();
    final String base64String = base64Encode(bytes);
    image = base64String;
    setState(() {});
  }

  void _showImageSourceActionSheet(BuildContext context) {
    Function(ImageSource) selectImageSource = (imageSource) {
      chooseFile(imageSource);
    };

    if (Platform.isIOS) {
      showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              child: Text(
                'ถ่ายภาพ',
                style: TextStyle(
                  fontFamily: 'anupark',
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
                selectImageSource(ImageSource.camera);
              },
            ),
            CupertinoActionSheetAction(
              child: Text(
                'เลือกภาพถ่าย',
                style: TextStyle(
                  fontFamily: 'anupark',
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
                selectImageSource(ImageSource.gallery);
              },
            )
          ],
        ),
      );
    } else {
      showModalBottomSheet(
        context: context,
        builder: (context) => Wrap(children: [
          ListTile(
            leading: Icon(Icons.camera_alt),
            title: Text(
              'ถ่ายภาพ',
              style: TextStyle(
                fontFamily: 'anupark',
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              selectImageSource(ImageSource.camera);
            },
          ),
          ListTile(
            leading: Icon(Icons.photo_album),
            title: Text(
              'เลือกภาพถ่าย',
              style: TextStyle(
                fontFamily: 'anupark',
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              selectImageSource(ImageSource.gallery);
            },
          ),
        ]),
      );
    }
  }

  String? imageBreed;
  Future<void> chooseFileBreed(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: source,
      maxWidth: 500,
      imageQuality: 100,
    );
    if (pickedFile == null) return;
    final bytes = await pickedFile.readAsBytes();
    final String base64String = base64Encode(bytes);
    imageBreed = base64String;
    setState(() {});
  }

  void _showImageSourceActionSheetBreed(BuildContext context) {
    Function(ImageSource) selectImageSource = (imageSource) {
      chooseFileBreed(imageSource);
    };

    if (Platform.isIOS) {
      showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              child: Text(
                'ถ่ายภาพ',
                style: TextStyle(
                  fontFamily: 'anupark',
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
                selectImageSource(ImageSource.camera);
              },
            ),
            CupertinoActionSheetAction(
              child: Text(
                'เลือกภาพถ่าย',
                style: TextStyle(
                  fontFamily: 'anupark',
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
                selectImageSource(ImageSource.gallery);
              },
            )
          ],
        ),
      );
    } else {
      showModalBottomSheet(
        context: context,
        builder: (context) => Wrap(children: [
          ListTile(
            leading: Icon(Icons.camera_alt),
            title: Text(
              'ถ่ายภาพ',
              style: TextStyle(
                fontFamily: 'anupark',
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              selectImageSource(ImageSource.camera);
            },
          ),
          ListTile(
            leading: Icon(Icons.photo_album),
            title: Text(
              'เลือกภาพถ่าย',
              style: TextStyle(
                fontFamily: 'anupark',
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              selectImageSource(ImageSource.gallery);
            },
          ),
        ]),
      );
    }
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
          "เพิ่มสัตว์เลี้ยง",
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

              Text(
                "ข้อมูลสัตว์เลี้ยง",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 10.0),
              if (imageBreed != null)
                CircleAvatar(
                    radius: 120,
                    backgroundImage:
                        MemoryImage(base64Decode("${imageBreed}"))),

              SizedBox(height: 20.0),
              Text(
                "รูปสัตว์เลี้ยง",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),

              SizedBox(height: 15.0),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 125, 152, 91),
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    _showImageSourceActionSheet(context);
                  },
                  child: Text('อัปโหลดรูปสัตว์เลี้ยง')),
              SizedBox(height: 20.0),

              SizedBox(height: 20.0),
              ToggleButtons(
                children: <Widget>[
                  Column(
                    children: [
                      Icon(
                        Icons.male,
                        size: 35.0,
                      ),
                      Text('เพศผู้'),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.female,
                        size: 35.0,
                      ),
                      Text('เพศเมีย'),
                    ],
                  ),
                ],
                isSelected: isSelected,
                onPressed: (int index) {
                  setState(() {
                    for (int i = 0; i < isSelected.length; i++) {
                      isSelected[i] = i == index;
                    }
                    sex_pet = index;
                  });
                },
                constraints: BoxConstraints.tightFor(
                  width: 60.0, // ปรับความกว้างตามต้องการ
                  height: 60.0,
                ),
              ),

              SizedBox(height: 20.0),
              Container(
                width: 380, // ปรับความกว้างตามที่ต้องการ
                child: TextField(
                  controller: nameControl,
                  decoration: InputDecoration(
                    labelText: 'ชื่อสัตว์เลี้ยง',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.white, // สีเส้นขอบ
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.black, // สีเส้นขอบเมื่อไม่ได้รับการกด
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Color.fromARGB(
                            255, 239, 83, 80), // สีเส้นขอบเมื่อได้รับการกด
                      ),
                    ),
                    // Gradient ขอบของ TextField
                    contentPadding: EdgeInsets.all(10.0),
                    hintStyle: TextStyle(color: Colors.white),
                    hintText: 'ใส่ชื่อสัตว์เลี้ยง',
                    prefixIcon: Icon(Icons.pets),
                  ),
                ),
              ),

              SizedBox(height: 10.0),
              Text(
                "อายุ(ปี)",
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
              SizedBox(height: 10.0),
              if (image != null)
                CircleAvatar(
                    radius: 120,
                    backgroundImage: MemoryImage(base64Decode("${image}"))),

              SizedBox(height: 20.0),
              Text(
                "ใบยืนยันพันธุ์",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),

              SizedBox(height: 15.0),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 228, 151, 150),
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    _showImageSourceActionSheetBreed(context);
                  },
                  child: Text('อัปโหลดใบยืนยันพันธุ์')),
              SizedBox(height: 20.0),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 239, 83, 80),
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    addPet(context);
                  },
                  child: Text('บันทึก')), // <-- Check this comma
            ],
          ),
        ),
      ),
    );
  }
}
