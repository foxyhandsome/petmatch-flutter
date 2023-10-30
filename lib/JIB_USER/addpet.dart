import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

List<String> list1 = <String>[
  '	พระบรมมหาราชวัง ',
  '	วังบูรพาภิรมย์',
  ' วัดราชบพิธ',
  '	สำราญราษฎร์',
  '	ศาลเจ้าพ่อเสือ',
  ' เสาชิงช้า',
  '	บวรนิเวศ',
  '	ตลาดยอด',
  '	ชนะสงคราม',
  '	บ้านพานถม',
  '	บ้านพานถม',
  '	วัดสามพระยา',
  '	ดุสิต',
  '	วชิรพยาบาล',
  ' สวนจิตรลดา',
  ' สี่แยกมหานาค',
  '	ถนนนครไชยศรี',
  ' กระทุ่มราย',
  ' หนองจอก',
  ' คลองสิบ',
  '	คลองสิบสอง',
  ' โคกแฝด',
  ' คู้ฝั่งเหนือ',
  '	ลำผักชี',
  '	ลำต้อยติ่ง',
  '	มหาพฤฒาราม',
  ' สีลม',
  '	สุริยวงศ์',
  '	บางรัก',
  '	สี่พระยา',
  '	อนุสาวรีย์',
  '	ท่าแร้ง',
  '	คลองจั่น',
  '	หัวหมาก',
  '	รองเมือง',
  '	วังใหม่',
  '	ปทุมวัน',
  '	ลุมพินี',
  '	ป้อมปราบ',
  '	วัดเทพศิรินทร์',
  '	คลองมหานาค',
  '	บ้านบาตร',
  '	วัดโสมนัส',
  ' บางจาก',
  '	พระโขนงใต้',
  '	มีนบุรี',
  '	แสนแสบ',
  '	ลาดกระบัง',
  '	คลองสองต้นนุ่น',
  '	คลองสามประเวศ',
  ' ลำปลาทิว',
  '	ทับยาว',
  '	ขุมทอง',
  '	ช่องนนทรี',
  '	บางโพงพาง',
  '	จักรวรรดิ',
  '	สัมพันธวงศ์',
  '	ตลาดน้อย',
  '	สามเสนใน',
  '	พญาไท',
  '	วัดกัลยาณ์',
  '	หิรัญรูจี',
  '	บางยี่เรือ',
  '	บุคคโล',
  '	ตลาดพลู',
  '	ดาวคะนอง',
  '	สำเหร่',
  '	วัดอรุณ',
  '	วัดท่าพระ',
  '	ห้วยขวาง',
  '	บางกะปิ',
  '	สามเสนนอก',
  '	สมเด็จเจ้าพระยา',
  ' คลองสาน',
  '	บางลำภูล่าง',
  '	คลองต้นไทร',
  '	คลองชักพระ',
  ' ตลิ่งชัน',
  '	ฉิมพลี',
  ' บางพรม',
  '	บางระมาด',
  ' บางเชือกหนัง',
  '	ศิริราช',
  '	บ้านช่างหล่อ',
  '	บางขุนนนท์',
  ' บางขุนศรี',
  ' อรุณอมรินทร์',
  '	ท่าข้าม',
  ' แสมดำ',
  ' บางหว้า',
  '	บางด้วน',
  '	บางจาก',
  '	บางแวก',
  '	คลองขวาง',
  '	ปากคลองภาษีเจริญ',
  '	คูหาสวรรค์',
  '	หนองแขม',
  '	หนองค้างพลู',
  ' ราษฎร์บูรณะ',
  '	บางปะกอก',
  '	บางพลัด',
  ' บางอ้อ',
  '	บางบำหรุ',
  '	บางยี่ขัน',
  '	ดินแดง',
  '	รัชดาภิเษก',
  ' คลองกุ่ม',
  '	นวมินทร์',
  '	นวลจันทร์',
  '	ทุ่งวัดดอน',
  '	ยานนาวา',
  '	ทุ่งมหาเมฆ',
  '	บางซื่อ',
  '	วงศ์สว่าง',
  '	ลาดยาว',
  '	เสนานิคม',
  '	จันทรเกษม',
  '	จอมพล',
  '	จตุจักร',
  '	บางคอแหลม',
  '	วัดพระยาไกร',
  ' บางโคล่',
  ' ประเวศ',
  ' หนองบอน',
  ' ดอกไม้',
  ' คลองเตย',
  ' คลองตัน',
  ' พระโขนง',
  ' สวนหลวง',
  '	อ่อนนุช',
  '	พัฒนาการ',
  ' บางขุนเทียน',
  '	บางค้อ',
  ' บางมด',
  '	จอมทอง',
  '	สีกัน',
  '	ดอนเมือง',
  ' สนามบิน',
  ' ทุ่งพญาไท',
  '	ถนนพญาไท',
  '	ถนนเพชรบุรี',
  '	มักกะสัน',
  '	ลาดพร้าว',
  ' จรเข้บัว',
  '	คลองเตยเหนือ',
  '	คลองตันเหนือ',
  '	พระโขนงเหนือ',
  '	บางแค',
  '	บางแคเหนือ',
  ' บางไผ่',
  '	หลักสอง',
  '	ทุ่งสองห้อง',
  '	ตลาดบางเขน',
  ' สายไหม',
  '	ออเงิน',
  '	คลองถนน',
  '	คันนายาว',
  '	รามอินทรา',
  ' สะพานสูง',
  ' ราษฎร์พัฒนา',
  '	ทับช้าง',
  '	วังทองหลาง',
  ' สะพานสอง',
  '	คลองเจ้าคุณสิงห์',
  '	พลับพลา',
  '	สามวาตะวันตก',
  ' สามวาตะวันออก',
  ' บางชัน',
  ' ทรายกองดิน',
  '	ทรายกองดินใต้',
  '	บางนาเหนือ',
  ' บางนาใต้',
  ' ทวีวัฒนา',
  '	ศาลาธรรมสพน์',
  '	บางมด',
  '	ทุ่งครุ',
  ' บางบอนเหนือ',
  '	บางบอนใต้',
  ' คลองบางพราน',
  ' คลองบางบอน',
]; //แขวง

List<String> list2 = <String>[
  '	พระนคร',
  '	ดุสิต',
  ' หนองจอก',
  ' บางรัก',
  '	บางเขน',
  '	บางกะปิ',
  '	ปทุมวัน',
  '	ป้อมปราบศัตรูพ่าย',
  ' พระโขนง',
  ' มีนบุรี',
  '	ลาดกระบัง',
  '	ยานนาวา',
  '	สัมพันธวงศ์',
  ' พญาไท',
  ' ธนบุรี',
  ' บางกอกใหญ่',
  ' ห้วยขวาง',
  ' คลองสาน',
  '	ตลิ่งชัน',
  '	บางกอกน้อย',
  '	บางขุนเทียน',
  '	ภาษีเจริญ',
  ' หนองแขม',
  '	ราษฎร์บูรณะ',
  '	บางพลัด',
  '	ดินแดง',
  '	บึงกุ่ม',
  '	สาทร',
  '	บางซื่อ',
  ' จตุจักร',
  '	บางคอแหลม',
  '	ประเวศ',
  '	คลองเตย',
  '	สวนหลวง',
  '	จอมทอง',
  '	ดอนเมือง',
  '	ราชเทวี',
  '	ลาดพร้าว',
  ' วัฒนา',
  ' บางแค',
  '	หลักสี่',
  '	สายไหม',
  ' คันนายาว',
  ' สะพานสูง',
  '	วังทองหลาง',
  ' คลองสามวา',
  '	บางนา',
  '	ทวีวัฒนา',
  '	ทุ่งครุ',
  '	บางบอน',
]; //เขต

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

List<String> list4 = <String>[
  'ปอมเมอเรเนียน (Pomeranian)',
  'ไซบีเรียน ฮัสกี (Siberian Husky)',
  'ปั๊ก (Pug)',
  'ชิวาวา (Chihuahua)',
  'ไทยบางแก้ว (Thai Bangkaew)',
  'เฟรนช์ บูลด็อก (French Bulldog)',
  'โกลเด้น รีทรีฟเวอร์ (Golden Retriever)',
  'ไทยหลังอาน (Thai Ridgeback)',
  'อเมริกัน บูลลี่ (American Bully)',
  'พิทบูล (Pitbull)',
  'ชิสุ (Shih Tzu)',
  'บีเกิล (Beagle)',
  'หมาไทย',
  'ลาบราดอร์รีทรีฟเวอร์ (Labrador Retriever)',
  'คอร์กี้ (Corgi)',
  'พุดเดิ้ล (Poodle)',
  'อิงลิช บูลล์ด็อก (English Bulldogs)',
  'แจ็ครัสเซลล์เทอร์เรีย (Jack Russell Terrier)',
  'ยอร์คเชียร์เทอร์เรีย (Yorkshire Terrier)',
  'ซามอยด์ (Samoyed)',
]; //พันธุ์

List<String> list5 = <String>[
  'สุนัขขนสีเดียวล้วน',
  'สุนัขขนสองสี',
  'สุนัขขนสามสี',
  'สุนัขขนสีลายทักซิโด้',
  'สุนัขขนสีลายหินอ่อน',
  'สุนัขขนสีดำด่าง',
  'สุนัขขนสีลายจุด',
  'สุนัขขนสีลายเสือ',
  'สุนัขขนสีซาเบิล',
  'สุนัขขนสีอานม้า',
]; //สีขน
List<String> list6 = <String>[
  'DEA 1.1',
  'DEA 1.2',
  'DEA 3',
  'DEA 4',
  'DEA 5',
  'DEA 6',
  'DEA 7',
  'DEA 8',
]; //กรุ๊ปเลือด

class addpet extends StatefulWidget {
  @override
  _addpetState createState() => _addpetState();
}

class _addpetState extends State<addpet> {
  final dio = Dio();
  login() {
    if (usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {}
  }

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

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String dropdownValue1 = list1.first; //แขวง
  String dropdownValue2 = list2.first; //เขต
  String dropdownValue3 = list3.first; //อายุ
  String dropdownValue4 = list4.first; //พันธุ์
  String dropdownValue5 = list5.first; //สีขน
  String dropdownValue6 = list6.first; //กรุ๊ปเลือด

  List<bool> isSelected = [false, false]; // 0 = เพศผู้, 1 = เพศเมีย

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showImageSourceActionSheet(context);
        },
        tooltip: 'Pick Image',
        child: const Icon(Icons.add_a_photo),
      ),
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

              SizedBox(height: 20.0),
              Text(
                "อัปโหลดใบพันธุ์ประวัติสุนัข",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),

              SizedBox(height: 15.0),

              SizedBox(height: 10.0),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 239, 83, 80),
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => Menu())));
                  },
                  child: Text('บันทึก')), // <-- Check this comma
            ],
          ),
        ),
      ),
    );
  }
}
