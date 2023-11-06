import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:todo_app/provider/provider.dart';
import 'package:todo_app/widgets/date_time_widget.dart';
import 'package:todo_app/widgets/radio_widget.dart';
import 'package:todo_app/widgets/textfield_widget.dart';

import '../constants/app_style.dart';

class AddNewTask extends StatelessWidget {
  const AddNewTask({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Consumer<Providerdata>(builder: (context, getdata, child) {
      return Container(
        padding: const EdgeInsets.all(30),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0))),
        height: size.height * 0.88,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            width: double.infinity,
            child: Text(
              "New Task Todo",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
          ),
          Divider(
            color: Colors.grey.shade200,
            thickness: 1.2,
          ),
          const SizedBox(
            height: 12,
          ),
          const Text("Title Task", style: AppStyle.headingOne),
          const SizedBox(
            height: 6,
          ),
          TextFieldWidget(
              hintText: "Add Task Name",
              maxLine: 1,
              textController: getdata.titleController),
          const SizedBox(
            height: 12,
          ),
          const Text("Description", style: AppStyle.headingOne),
          const SizedBox(
            height: 6,
          ),
          TextFieldWidget(
              hintText: "Add Description",
              maxLine: 1,
              textController: getdata.descriptionController),
          const SizedBox(
            height: 12,
          ),
          const Text("Category", style: AppStyle.headingOne),
          Row(
            children: [
              Expanded(
                  child: RadioWidget(
                onchangeValue: () {
                  getdata.setRadioValue(1);
                },
                valueInput: 1,
                categColor: Colors.green,
                titleRadio: "LRN",
              )),
              Expanded(
                  child: RadioWidget(
                onchangeValue: () {
                  getdata.setRadioValue(2);
                },
                valueInput: 2,
                categColor: Colors.blue.shade200,
                titleRadio: "WRK",
              )),
              Expanded(
                  child: RadioWidget(
                onchangeValue: () {
                  getdata.setRadioValue(3);
                },
                valueInput: 3,
                categColor: Colors.amber.shade700,
                titleRadio: "GEN",
              )),
            ],
          ),
          //date and time section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DateTimeWidget(
                  onTap: () => getdata.setDate(context),
                  iconSelection: CupertinoIcons.calendar,
                  titleText: "Date",
                  valueText: getdata.dateValue.toString()),
              SizedBox(
                width: 22,
              ),
              DateTimeWidget(
                  onTap: () => getdata.setTime(context),
                  iconSelection: CupertinoIcons.clock,
                  titleText: "Time",
                  valueText: getdata.timeValue.toString()),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          //button Section
          Row(
            children: [
              Expanded(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.blue.shade800,
                          backgroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(color: Colors.blue.shade800),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 15)),
                      onPressed: () {
                        getdata.clear(context);
                      },
                      child: const Text("Cancel"))),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.blue.shade800,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 15)),
                      onPressed: () {
                        getdata.checkValues(context);
                      },
                      child: const Text("Create")))
            ],
          )
        ]),
      );
    });
  }
}
