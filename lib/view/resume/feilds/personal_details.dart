import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:resumemaker/controller/resume_controller.dart';

import '../../../constants/style.dart';
import '../../../widgets/date_picker.dart';
import '../../../widgets/pick_image.dart';
import '../../../widgets/text_error.dart';
import '../../../widgets/textformfeild.dart';

class PersonalDetails extends StatelessWidget {
  PersonalDetails({Key? key}) : super(key: key);

  ResumeController resumeController = Get.find();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: wWhiteColor,
          ),
        ),
        title: Text(
          "Personal Details",
          style: MyTextStyles.headingxSmallBoldWhite,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
          children: [
            Text('   Profile Picture', style: MyTextStyles.headingxSmallBoldPrimary,),
            PickImage(),
            CustomTextFormFeild(
              controller: resumeController.bioUserName,
              keyboardType: TextInputType.name,
              icon: Icon(Icons.person),
              labelText: 'Name',
              maxLines: 1,
            ),

            CustomTextFormFeild(
              controller: resumeController.bioUserEmail,
              keyboardType: TextInputType.emailAddress,
              icon: Icon(Icons.email_rounded),
              labelText: 'Email',
              maxLines: 1,
            ),
            CustomTextFormFeild(
              controller: resumeController.bioUserPhoneNo,
              keyboardType: TextInputType.number,
              icon: Icon(Icons.call),
              labelText: 'Phone',
              maxLines: 1,
              maxLenght: 11,
            ),
            DatePicker(labelText: 'Date of Birth',controller: resumeController.bioUserDOB,),
            CustomTextFormFeild(
              controller: resumeController.bioUserWebsite,
              keyboardType: TextInputType.url,
              icon: Icon(Icons.laptop_chromebook),
              labelText: 'Website',
              maxLines: 1,
              maxLenght: 11,
            ),
            CustomTextFormFeild(
              controller: resumeController.bioUserAddress,
              keyboardType: TextInputType.text,
              icon: Icon(Icons.house),
              labelText: 'Address',
              maxLines: 2,
            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: (){
              resumeController.addBio();
            }, child: Text("Save")),
            Obx(() => TextError(errorMsg: resumeController.errorMsg.value,)),
          ],
        ),
      ),
    );
  }
}
