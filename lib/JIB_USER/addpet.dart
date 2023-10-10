import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petmatch/JIB_USER/allpet.dart';
import 'package:petmatch/JIB_USER/loginjib.dart';
import 'package:petmatch/JIB_USER/profileuser.dart';
import 'dart:io';
import 'package:petmatch/authenticationsScreen/editdog.dart';


List<String> list1 = 
<String>[
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

List<String> list3 = <String>['1', '2','3','4','5','6','7','8','9','10',]; //อายุ

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
  'สุนัขขนสองสี' , 
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
  login(){
    if(usernameController.text.isNotEmpty && passwordController.text.isNotEmpty){
      
    }
  }
  File? _image;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String dropdownValue1 = list1.first; //แขวง
  String dropdownValue2 = list2.first; //เขต
  String dropdownValue3 = list3.first; //อายุ
  String dropdownValue4 = list4.first; //พันธุ์
  String dropdownValue5 = list5.first; //สีขน
  String dropdownValue6 = list6.first; //กรุ๊ปเลือด

  List<bool> isSelected = [false, false]; // 0 = เพศผู้, 1 = เพศเมีย
  

    Future getImageDog() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

    Future getImagePetCert() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }


  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Color.fromARGB(255,239,83,80),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color.fromARGB(255, 255, 255, 255)),
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
            color: Color.fromARGB(255, 255, 255, 255), // Set your desired color here
          ),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

///////////////////////////สัตว์เลี้ยง//////////////////////////////////////////////////////////////////////////////////////
                    
                    Text (
                    "ข้อมูลสัตว์เลี้ยง",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    ),
                  ),

                    SizedBox(height: 10.0),
                    GestureDetector(
                    onTap: getImageDog,
                    child: ClipOval(
                      child: _image == null
                          ? CircleAvatar(
                              radius: 150,
                              child: Icon(Icons.pets, size: 100),
                            )
                          : CircleAvatar(
                              radius: 150,
                              backgroundImage: FileImage(_image!),
                            ),
                    ),
                  ),


                    SizedBox(height: 20.0),
                    ToggleButtons(
                      children: <Widget>[
                        Column(
                          children: [
                            Icon(Icons.male,size: 35.0,),
                            Text('เพศผู้'),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.female,size: 35.0,),
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
                TextField(
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
                      color: Color.fromARGB(255,239,83,80), // สีเส้นขอบเมื่อได้รับการกด
                    ),
                  ),
                  // Gradient ขอบของ TextField
                  contentPadding: EdgeInsets.all(10.0),
                  hintStyle: TextStyle(color: Colors.white),
                  hintText: 'ใส่ชื่อสัตว์เลี้ยง',
                  prefixIcon: Icon(Icons.pets),
                ),
              ),

                    SizedBox(height: 10.0),
                    Text (
                    "อายุ(ปี)",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
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
                        dropdownMenuEntries: list3.map<DropdownMenuEntry<String>>((String value) {
                          return DropdownMenuEntry<String>(value: value, label: value);
                        }).toList(),
                      ),

                    SizedBox(height: 10.0),
                    Text (
                    "สายพันธุ์",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 5.0),
                  DropdownMenu<String>(
                        initialSelection: list4.first,
                        onSelected: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            dropdownValue4 = value!;
                          });
                        },
                        dropdownMenuEntries: list4.map<DropdownMenuEntry<String>>((String value) {
                          return DropdownMenuEntry<String>(value: value, label: value);
                        }).toList(),
                      ),

                    SizedBox(height: 10.0),
                    Text (
                    "สีขน",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 5.0),
                  DropdownMenu<String>(
                        initialSelection: list5.first,
                        onSelected: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            dropdownValue5 = value!;
                          });
                        },
                        dropdownMenuEntries: list5.map<DropdownMenuEntry<String>>((String value) {
                          return DropdownMenuEntry<String>(value: value, label: value);
                        }).toList(),
                      ),

                    SizedBox(height: 10.0),
                    Text (
                    "กรุ๊ปเลือด",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 5.0),
                  DropdownMenu<String>(
                        initialSelection: list6.first,
                        onSelected: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            dropdownValue6 = value!;
                          });
                        },
                        dropdownMenuEntries: list6.map<DropdownMenuEntry<String>>((String value) {
                          return DropdownMenuEntry<String>(value: value, label: value);
                        }).toList(),
                      ),

                SizedBox(height: 20.0),
                     Text (
                    "อัปโหลดใบตรวจสุขภาพสัตว์เลี้ยง",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),

                    SizedBox(height: 10.0),
                    GestureDetector(
                      onTap: getImagePetCert,
                      child: Container(
                        width: 400,  // Set the desired width
                        height: 600, // Set the desired height
                        decoration: BoxDecoration(
                        border: Border.all(
                        color: Colors.black, // สีขอบ
                        width: 2.0, // ความหนาขอบ
                        ),
                          color: Color.fromARGB(255, 255, 255, 255), // Change to the desired background color
                          borderRadius: BorderRadius.circular(10.0), // Adjust the border radius as needed
                        ),
                        child: ClipRect(
                          child: _image == null
                              ? Icon(
                                  Icons.local_hospital,
                                  size: 100,
                                  color: Color.fromARGB(255, 236, 112, 99), // Change to desired color
                                )
                              : Image.file(
                                  _image!,
                                  fit: BoxFit.cover,
                                  width: 200, // Set width to match the container width
                                  height: 400, // Set height to match the container height
                                ),
                        ),
                      ),
                    ),

                      SizedBox(height: 10.0),
                        ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromARGB(255,239,83,80),
                                minimumSize: const Size.fromHeight(50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: ((context) => allpet())));
                          },
                          child: Text('เพิ่มสัตว์เลี้ยง')
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
          }

void main() {
  runApp(MaterialApp(
    home: addpet(),
  ));
}