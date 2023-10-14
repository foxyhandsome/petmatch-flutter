import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petmatch/JIB_USER/allpet.dart';
import 'package:petmatch/JIB_USER/loginjib.dart';
import 'package:petmatch/JIB_USER/menu.dart';
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

class registeruserjib extends StatefulWidget {
  @override
  _registeruserjibState createState() => _registeruserjibState();
}


class _registeruserjibState extends State<registeruserjib> {
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
          "สมัครสมาชิก",
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

                    Text (
                    "ข้อมูลเจ้าของสัตว์เลี้ยง",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    ),
                  ),


                SizedBox(height: 10.0),
                TextField(
                decoration: InputDecoration(
                  labelText: 'ชื่อผู้ใช้งาน',
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
                  hintText: 'ใส่ชื่อผู้ใช้งาน',
                  prefixIcon: Icon(Icons.person),
                ),
              ),

              SizedBox(height: 20.0), 
              TextField(
                decoration: InputDecoration(
                  labelText: 'รหัสผ่าน',
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
                  hintText: 'ใส่รหัสผ่าน',
                  prefixIcon: Icon(Icons.lock),
                ),
              ),

                SizedBox(height: 20.0),
                TextField(
                controller: usernameController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'เบอร์โทรศัพท์',
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
                  hintText: 'ใส่เบอร์โทรศัพท์',
                  prefixIcon: Icon(Icons.phone),
                ),
              ),

                SizedBox(height: 20.0),
                TextField(
                decoration: InputDecoration(
                  labelText: 'แนะนำเพิ่มเติม',
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
                  hintText: '',
                  prefixIcon: Icon(Icons.chat),
                ),
              ),

                    SizedBox(height: 10.0),
                    Text (
                    "แขวง",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 5.0),
                  DropdownMenu<String>(
                        initialSelection: list1.first,
                        onSelected: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            dropdownValue1 = value!;
                          });
                        },
                        dropdownMenuEntries: list1.map<DropdownMenuEntry<String>>((String value) {
                          return DropdownMenuEntry<String>(value: value, label: value);
                        }).toList(),
                      ),

                    SizedBox(height: 10.0),
                    Text (
                    "เขต",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 5.0),
                  DropdownMenu<String>(
                        initialSelection: list2.first,
                        onSelected: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            dropdownValue2 = value!;
                          });
                        },
                        dropdownMenuEntries: list2.map<DropdownMenuEntry<String>>((String value) {
                          return DropdownMenuEntry<String>(value: value, label: value);
                        }).toList(),
                      ),

                        TextButton(
                          onPressed: () {Navigator.push(context, MaterialPageRoute(builder: ((context) => loginjib()))); // โค้ดที่ต้องการให้ทำงานเมื่อปุ่มถูกกด
                          },
                          child: Text(
                            'หากมีบัญชีผู้ใช้แล้ว กดเพื่อเข้าสู่ระบบ',
                            style: TextStyle(
                              fontSize: 12,
                                color: Color.fromARGB(255,239,83,80), // สีเส้นขอบเมื่อได้รับการกด
                            ),
                          ),
                        ),
                        
                        ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromARGB(255,239,83,80),
                                minimumSize: const Size.fromHeight(50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: ((context) => Menu())));
                          },
                          child: Text('สมัครสมาชิก')
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
    home: registeruserjib(),
  ));
}