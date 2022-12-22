import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:resumemaker/controller/resume_controller.dart';
import 'package:resumemaker/models/user_resume_list_model.dart';
import '../../../../constants/images.dart';
import '../../../../constants/style.dart';
import 'package:get/get.dart';

import '../../../../widgets/set_image.dart';

class ResumeCardHomeListItem extends StatelessWidget {
  ResumeCardHomeListItem({Key? key}) : super(key: key);
  ResumeController resumeController = Get.find();


  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: resumeController.getStreamResumeListModel(),
        builder: (ctx, snapshot) {
        // Displaying LoadingSpinner to indicate waiting state
        if(snapshot.hasData){
      return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context,idex){
            UserResumeListModel userResumeListModel = snapshot.data![idex];
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              // elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: lightColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: userResumeListModel.image_profile!=null ?
                          SetImageFromMemery(height: 100, widget: 100, image: userResumeListModel.image_profile,) :
                          Image.asset(
                            resumeBro,
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Container(
                            // height: 90,
                            // color: secondary,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${userResumeListModel.name}',
                                  style: MyTextStyles.headingLargePrimary,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '${userResumeListModel.email}',
                                  style: MyTextStyles.headingxSmallGrey,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                    '${userResumeListModel.phoneNo}',
                                    style: MyTextStyles.headingxSmallGrey),
                                Text(
                                    '${userResumeListModel.dob}',
                                    style: MyTextStyles.headingxSmallGrey),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 1,
                      color: secondary.withOpacity(0.3),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                    backgroundColor: lightColor,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10)),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.edit,
                                      color: primary,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Edit",
                                      style: MyTextStyles.headingSmallPrimary,
                                    )
                                  ],
                                )),
                            const SizedBox(
                              width: 15,
                            ),
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                  backgroundColor: lightColor,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10)),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.remove_red_eye_rounded,
                                    color: primary,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "View",
                                    style: MyTextStyles.headingSmallPrimary,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.more_vert,
                          color: primary,
                          size: 25,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );

          });

    }
    if(!snapshot.hasData){
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Text("data");

  },
      ),
//       body: FutureBuilder(
//         future: resumeController.getResumeList(),
//         builder: (ctx, snapshot) {
//           // Displaying LoadingSpinner to indicate waiting state
//           if(snapshot.hasData){
//             return ListView.builder(
//                 itemCount: snapshot.data!.length,
//                 itemBuilder: (context,idex){
//                   UserResumeListModel userResumeListModel = snapshot.data![idex];
//               return Card(
//                 margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
//                 // elevation: 1,
//                 child: Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Column(
//                     children: [
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             // padding: const EdgeInsets.all(8.0),
//                             decoration: BoxDecoration(
//                               color: lightColor,
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: Image.asset(
//                               resumeBro,
//                               height: 100,
//                               width: 100,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           const SizedBox(
//                             width: 20,
//                           ),
//                           Expanded(
//                             child: Container(
//                               // height: 90,
//                               // color: secondary,
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     '${userResumeListModel.name}',
//                                     style: MyTextStyles.headingLargePrimary,
//                                     overflow: TextOverflow.ellipsis,
//                                   ),
//                                   const SizedBox(
//                                     height: 5,
//                                   ),
//                                   Text(
//                                     'Angelayu@gmail.com',
//                                     style: MyTextStyles.headingxSmallGrey,
//                                     overflow: TextOverflow.ellipsis,
//                                   ),
//                                   Text('03004400443',
//                                       style: MyTextStyles.headingxSmallGrey),
//                                   Text('Oct 25, 2022 02:18 pm',
//                                       style: MyTextStyles.headingxSmallGrey),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       Divider(
//                         thickness: 1,
//                         color: secondary.withOpacity(0.3),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             children: [
//                               TextButton(
//                                   onPressed: () {},
//                                   style: TextButton.styleFrom(
//                                       backgroundColor: lightColor,
//                                       padding: const EdgeInsets.symmetric(
//                                           horizontal: 20, vertical: 10)),
//                                   child: Row(
//                                     children: [
//                                       const Icon(
//                                         Icons.edit,
//                                         color: primary,
//                                       ),
//                                       const SizedBox(
//                                         width: 10,
//                                       ),
//                                       Text(
//                                         "Edit",
//                                         style: MyTextStyles.headingSmallPrimary,
//                                       )
//                                     ],
//                                   )),
//                               const SizedBox(
//                                 width: 15,
//                               ),
//                               TextButton(
//                                 onPressed: () {},
//                                 style: TextButton.styleFrom(
//                                     backgroundColor: lightColor,
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 20, vertical: 10)),
//                                 child: Row(
//                                   children: [
//                                     const Icon(
//                                       Icons.remove_red_eye_rounded,
//                                       color: primary,
//                                     ),
//                                     const SizedBox(
//                                       width: 10,
//                                     ),
//                                     Text(
//                                       "View",
//                                       style: MyTextStyles.headingSmallPrimary,
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const Icon(
//                             Icons.more_vert,
//                             color: primary,
//                             size: 25,
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//
//             });
//
//           }
//           if(!snapshot.hasData){
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           return Text("data");
//
//
//         },
//
// // Future that needs to be resolved
// // inorder to display something on the Canvas
//       ),



//       body:  GetBuilder<ResumeController>(
//           builder: (_) => Future(() => null)
//               ListView.builder(
//               itemCount: resumeController.userResumeListModel.length,
//               itemBuilder: (context,index){
//                 return Card(
//                   margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
//                   // elevation: 1,
//                   child: Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Column(
//                       children: [
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Container(
//                               // padding: const EdgeInsets.all(8.0),
//                               decoration: BoxDecoration(
//                                 color: lightColor,
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: Image.asset(
//                                 resumeBro,
//                                 height: 100,
//                                 width: 100,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                             const SizedBox(
//                               width: 20,
//                             ),
//                             Expanded(
//                               child: Container(
//                                 // height: 90,
//                                 // color: secondary,
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       '${resumeController.userResumeListModel[index].name}',
//                                       style: MyTextStyles.headingLargePrimary,
//                                       overflow: TextOverflow.ellipsis,
//                                     ),
//                                     const SizedBox(
//                                       height: 5,
//                                     ),
//                                     Text(
//                                       'Angelayu@gmail.com',
//                                       style: MyTextStyles.headingxSmallGrey,
//                                       overflow: TextOverflow.ellipsis,
//                                     ),
//                                     Text('03004400443',
//                                         style: MyTextStyles.headingxSmallGrey),
//                                     Text('Oct 25, 2022 02:18 pm',
//                                         style: MyTextStyles.headingxSmallGrey),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         Divider(
//                           thickness: 1,
//                           color: secondary.withOpacity(0.3),
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Row(
//                               children: [
//                                 TextButton(
//                                     onPressed: () {},
//                                     style: TextButton.styleFrom(
//                                         backgroundColor: lightColor,
//                                         padding: const EdgeInsets.symmetric(
//                                             horizontal: 20, vertical: 10)),
//                                     child: Row(
//                                       children: [
//                                         const Icon(
//                                           Icons.edit,
//                                           color: primary,
//                                         ),
//                                         const SizedBox(
//                                           width: 10,
//                                         ),
//                                         Text(
//                                           "Edit",
//                                           style: MyTextStyles.headingSmallPrimary,
//                                         )
//                                       ],
//                                     )),
//                                 const SizedBox(
//                                   width: 15,
//                                 ),
//                                 TextButton(
//                                   onPressed: () {},
//                                   style: TextButton.styleFrom(
//                                       backgroundColor: lightColor,
//                                       padding: const EdgeInsets.symmetric(
//                                           horizontal: 20, vertical: 10)),
//                                   child: Row(
//                                     children: [
//                                       const Icon(
//                                         Icons.remove_red_eye_rounded,
//                                         color: primary,
//                                       ),
//                                       const SizedBox(
//                                         width: 10,
//                                       ),
//                                       Text(
//                                         "View",
//                                         style: MyTextStyles.headingSmallPrimary,
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const Icon(
//                               Icons.more_vert,
//                               color: primary,
//                               size: 25,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               })
//       ),
      // body: ListView(
      //   children: [
      //     Card(
      //       margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      //       // elevation: 1,
      //       child: Padding(
      //         padding: const EdgeInsets.all(10.0),
      //         child: Column(
      //           children: [
      //             Row(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Container(
      //                   // padding: const EdgeInsets.all(8.0),
      //                   decoration: BoxDecoration(
      //                     color: lightColor,
      //                     borderRadius: BorderRadius.circular(10),
      //                   ),
      //                   child: Image.asset(
      //                     resumeBro,
      //                     height: 100,
      //                     width: 100,
      //                     fit: BoxFit.cover,
      //                   ),
      //                 ),
      //                 const SizedBox(
      //                   width: 20,
      //                 ),
      //                 Expanded(
      //                   child: Container(
      //                     // height: 90,
      //                     // color: secondary,
      //                     child: Column(
      //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                       crossAxisAlignment: CrossAxisAlignment.start,
      //                       children: [
      //                         Text(
      //                           'Muhammad Abdul Quddus',
      //                           style: MyTextStyles.headingLargePrimary,
      //                           overflow: TextOverflow.ellipsis,
      //                         ),
      //                         const SizedBox(
      //                           height: 5,
      //                         ),
      //                         Text(
      //                           'Angelayu@gmail.com',
      //                           style: MyTextStyles.headingxSmallGrey,
      //                           overflow: TextOverflow.ellipsis,
      //                         ),
      //                         Text('03004400443',
      //                             style: MyTextStyles.headingxSmallGrey),
      //                         Text('Oct 25, 2022 02:18 pm',
      //                             style: MyTextStyles.headingxSmallGrey),
      //                       ],
      //                     ),
      //                   ),
      //                 ),
      //               ],
      //             ),
      //             Divider(
      //               thickness: 1,
      //               color: secondary.withOpacity(0.3),
      //             ),
      //             Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: [
      //                 Row(
      //                   children: [
      //                     TextButton(
      //                         onPressed: () {},
      //                         style: TextButton.styleFrom(
      //                             backgroundColor: lightColor,
      //                             padding: const EdgeInsets.symmetric(
      //                                 horizontal: 20, vertical: 10)),
      //                         child: Row(
      //                           children: [
      //                             const Icon(
      //                               Icons.edit,
      //                               color: primary,
      //                             ),
      //                             const SizedBox(
      //                               width: 10,
      //                             ),
      //                             Text(
      //                               "Edit",
      //                               style: MyTextStyles.headingSmallPrimary,
      //                             )
      //                           ],
      //                         )),
      //                     const SizedBox(
      //                       width: 15,
      //                     ),
      //                     TextButton(
      //                       onPressed: () {},
      //                       style: TextButton.styleFrom(
      //                           backgroundColor: lightColor,
      //                           padding: const EdgeInsets.symmetric(
      //                               horizontal: 20, vertical: 10)),
      //                       child: Row(
      //                         children: [
      //                           const Icon(
      //                             Icons.remove_red_eye_rounded,
      //                             color: primary,
      //                           ),
      //                           const SizedBox(
      //                             width: 10,
      //                           ),
      //                           Text(
      //                             "View",
      //                             style: MyTextStyles.headingSmallPrimary,
      //                           )
      //                         ],
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //                 const Icon(
      //                   Icons.more_vert,
      //                   color: primary,
      //                   size: 25,
      //                 ),
      //               ],
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //     ElevatedButton(
      //       onPressed: () async {
      //         Navigator.of(context)
      //             .push(MaterialPageRoute(builder: (context) => const SelectResumeTemplate()));
      //       },
      //       child: const Text('something'),
      //     ),
      //
      //   ],
      // ),
    );

  }
}
