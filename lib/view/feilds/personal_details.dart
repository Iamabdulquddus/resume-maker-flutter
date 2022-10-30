import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants/style.dart';
import '../../widgets/date_picker.dart';
import '../../widgets/pick_image.dart';
import '../../widgets/textformfeild.dart';

class PersonalDetails extends StatelessWidget {
  const PersonalDetails({Key? key}) : super(key: key);

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
              keyboardType: TextInputType.name,
              icon: Icon(Icons.person),
              labelText: 'Name',
              maxLines: 1,
            ),
            CustomTextFormFeild(
              keyboardType: TextInputType.text,
              icon: Icon(Icons.house),
              labelText: 'Address',
              maxLines: 2,
            ),
            CustomTextFormFeild(
              keyboardType: TextInputType.emailAddress,
              icon: Icon(Icons.email_rounded),
              labelText: 'Email',
              maxLines: 1,
            ),
            CustomTextFormFeild(
              keyboardType: TextInputType.number,
              icon: Icon(Icons.call),
              labelText: 'Phone',
              maxLines: 1,
              maxLenght: 11,
            ),
            DatePicker(labelText: 'Date of Birth',),
            CustomTextFormFeild(
              keyboardType: TextInputType.url,
              icon: Icon(Icons.laptop_chromebook),
              labelText: 'Website',
              maxLines: 1,
              maxLenght: 11,
            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: (){}, child: Text("Save"))
          ],
        ),
      ),
    );
  }
}
