
import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import '';
import 'buttons.dart';
import 'informations.dart';
import 'inpu_field.dart';


class Reminders extends StatefulWidget {
  const Reminders({Key? key}) : super(key: key);

  @override
  State<Reminders> createState() => _RemindersState();
}

class _RemindersState extends State<Reminders> {

  DateTime _selectedDate = DateTime.now();
  // final _taskController = Get.put(meddcinecontroller());
  var notifyHelper;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      
      body: 

          Column(
            children: [
              CustomAppBar(title: "",),
              
              _addCalender(),
              _addMycalender(),
              
             
            
            ],
          ),
       
    );
  }

  // _showTasks(){
  //   return Expanded(
  //     child: Obx(() {
  //       return ListView.builder(
  //         itemCount: _taskController.taskList.length,
  //         itemBuilder: (_, context){
  //           print(_taskController.taskList.length);
  //             return Container(
  //               width: 200,
  //               height: 100,
  //               color: Colors.green,
  //                 margin: EdgeInsets.only(bottom: 10),

  //             );
  //         });
  //     },)
    
  //   );
  // }

  _addCalender() {
    return Container(
                margin: EdgeInsets.only(left: 20 ,right: 20,top: 10),
                child: Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Text(DateFormat.yMMMEd().format(DateTime.now()),
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),)
                        ],
                      ),
                    ),
                    Mybutton(label:"+ Add Task" ,onTap:()async {
                     await Get.to(Addpage());
                    //  _taskController.getTasks();

                      
                      } ),
                  ],
                ),
              );
  }
  _addMycalender(){
    return Container(
              margin: EdgeInsets.only(top:10,left: 20),
              child:
               DatePicker(
                DateTime.now(),
                height: 100,
                width: 80,
                initialSelectedDate: DateTime.now(),
                selectedTextColor: Colors.white,
                selectionColor: Color(0xFF398AE5),
                dateTextStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey
                ),
                monthTextStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey
                ),
                dayTextStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey
                ),
                onDateChange: (date) {
                  _selectedDate=date;
                },
              ),
            );
  }






}



class CustomAppBar extends StatelessWidget {
  final String title;

  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
    
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.grey, spreadRadius: 0, blurRadius: 0)],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 30,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      fontSize: 24.0,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 40), // Add some spacing on the right side
            ],
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}

  
class CustomDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                // Handle cancel appointment button press
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 4),
                width: MediaQuery.of(context).size.width*0.9,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.blue
                  ),
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                height: 55,
                child: Text(
                  'Edit',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                // Handle edit appointment button press
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 4),
                width: MediaQuery.of(context).size.width*0.9,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.red
                  ),
                  color: Color.fromARGB(255, 247, 81, 69),
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                height: 50,
                child: Text(
                  'Delete',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                // Handle close button press
                Navigator.pop(context);
              },
              child: Container(
                 margin: EdgeInsets.symmetric(vertical: 4),
                width: MediaQuery.of(context).size.width*0.9,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.grey
                  ),
                  color: Color.fromARGB(255, 199, 199, 199),
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                height: 50,
                child: Text(
                  'Close',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
  
