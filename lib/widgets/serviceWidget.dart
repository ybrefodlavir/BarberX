// import 'package:flutter/material.dart';
// import '../models/services.dart';
// import 'home_page.dart';

// class  extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//   width: 130,
//   margin: EdgeInsets.only(left: 20),
//   decoration: BoxDecoration(
//     borderRadius: BorderRadius.only(
//         bottomLeft: Radius.circular(15),
//         topLeft: Radius.circular(5),
//         topRight: Radius.circular(5)),
//     color: Color(0xff35415D),
//   ),
//   child: Column(
//     children: [
//       Container(
//         margin:
//             EdgeInsets.only(left: 15, top: 15, right: 15),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.only(
//               bottomLeft: Radius.circular(15),
//               topLeft: Radius.circular(5),
//               topRight: Radius.circular(5)),
//           color: Color(0xffDFC38A),
//         ),
//         child: Column(
//           children: [
//             Container(
//               margin: EdgeInsets.only(
//                   left: 5, top: 5, right: 5),
//               child: Image.asset(
//                 'image/weddingcut.png',
//                 width: 90,
//                 height: 90,
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.only(top: 13, bottom: 9),
//               alignment: Alignment.center,
//               child: Text(
//                 'Wedding Cut',
//                 style: TextStyle(
//                   color: Color(0xff35415D),
//                   fontSize: 13,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       Container(
//         margin: EdgeInsets.only(top: 5, bottom: 7),
//         alignment: Alignment.center,
//         child: Text(
//           'Rp 30.000,-',
//           style: TextStyle(
//             color: Color(0xffF7D99F),
//             fontSize: 12,
//           ),
//         ),
//       ),
//     ],
//   ),
// ),

//   }

// // children: [
// //                     Container(
// //                       width: 130,
// //                       margin: EdgeInsets.only(left: 20),
// //                       decoration: BoxDecoration(
// //                         borderRadius: BorderRadius.only(
// //                             bottomLeft: Radius.circular(15),
// //                             topLeft: Radius.circular(5),
// //                             topRight: Radius.circular(5)),
// //                         color: Color(0xff35415D),
// //                       ),
// //                       child: Column(
// //                         children: [
// //                           Container(
// //                             margin:
// //                                 EdgeInsets.only(left: 15, top: 15, right: 15),
// //                             decoration: BoxDecoration(
// //                               borderRadius: BorderRadius.only(
// //                                   bottomLeft: Radius.circular(15),
// //                                   topLeft: Radius.circular(5),
// //                                   topRight: Radius.circular(5)),
// //                               color: Color(0xffDFC38A),
// //                             ),
// //                             child: Column(
// //                               children: [
// //                                 Container(
// //                                   margin: EdgeInsets.only(
// //                                       left: 5, top: 5, right: 5),
// //                                   child: Image.asset(
// //                                     'image/weddingcut.png',
// //                                     width: 90,
// //                                     height: 90,
// //                                   ),
// //                                 ),
// //                                 Container(
// //                                   margin: EdgeInsets.only(top: 13, bottom: 9),
// //                                   alignment: Alignment.center,
// //                                   child: Text(
// //                                     'Wedding Cut',
// //                                     style: TextStyle(
// //                                       color: Color(0xff35415D),
// //                                       fontSize: 13,
// //                                     ),
// //                                   ),
// //                                 ),
// //                               ],
// //                             ),
// //                           ),
// //                           Container(
// //                             margin: EdgeInsets.only(top: 5, bottom: 7),
// //                             alignment: Alignment.center,
// //                             child: Text(
// //                               'Rp 30.000,-',
// //                               style: TextStyle(
// //                                 color: Color(0xffF7D99F),
// //                                 fontSize: 12,
// //                               ),
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                     Container(
// //                       width: 130,
// //                       height: 170,
// //                       margin: EdgeInsets.only(left: 20),
// //                       decoration: BoxDecoration(
// //                         borderRadius: BorderRadius.only(
// //                             bottomLeft: Radius.circular(15),
// //                             topLeft: Radius.circular(5),
// //                             topRight: Radius.circular(5)),
// //                         color: Color(0xff35415D),
// //                       ),
// //                       child: Column(
// //                         children: [
// //                           Container(
// //                             margin:
// //                                 EdgeInsets.only(left: 15, top: 15, right: 15),
// //                             decoration: BoxDecoration(
// //                               borderRadius: BorderRadius.only(
// //                                   bottomLeft: Radius.circular(15),
// //                                   topLeft: Radius.circular(5),
// //                                   topRight: Radius.circular(5)),
// //                               color: Color(0xffDFC38A),
// //                             ),
// //                             child: Column(
// //                               children: [
// //                                 Container(
// //                                   margin: EdgeInsets.only(
// //                                       left: 5, top: 5, right: 5),
// //                                   child: Image.asset(
// //                                     'image/coloring.png',
// //                                     width: 90,
// //                                     height: 90,
// //                                   ),
// //                                 ),
// //                                 Container(
// //                                   margin: EdgeInsets.only(top: 13, bottom: 9),
// //                                   alignment: Alignment.center,
// //                                   child: Text(
// //                                     'Coloring',
// //                                     style: TextStyle(
// //                                       color: Color(0xff35415D),
// //                                       fontSize: 13,
// //                                     ),
// //                                   ),
// //                                 ),
// //                               ],
// //                             ),
// //                           ),
// //                           Container(
// //                             margin: EdgeInsets.only(top: 5, bottom: 7),
// //                             alignment: Alignment.center,
// //                             child: Text(
// //                               'Rp 40.000,-',
// //                               style: TextStyle(
// //                                 color: Color(0xffF7D99F),
// //                                 fontSize: 12,
// //                               ),
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                     Container(
// //                       width: 130,
// //                       height: 170,
// //                       margin: EdgeInsets.only(left: 20),
// //                       decoration: BoxDecoration(
// //                         borderRadius: BorderRadius.only(
// //                             bottomLeft: Radius.circular(15),
// //                             topLeft: Radius.circular(5),
// //                             topRight: Radius.circular(5)),
// //                         color: Color(0xff35415D),
// //                       ),
// //                       child: Column(
// //                         children: [
// //                           Container(
// //                             margin:
// //                                 EdgeInsets.only(left: 15, top: 15, right: 15),
// //                             decoration: BoxDecoration(
// //                               borderRadius: BorderRadius.only(
// //                                   bottomLeft: Radius.circular(15),
// //                                   topLeft: Radius.circular(5),
// //                                   topRight: Radius.circular(5)),
// //                               color: Color(0xffDFC38A),
// //                             ),
// //                             child: Column(
// //                               children: [
// //                                 Container(
// //                                   margin: EdgeInsets.only(
// //                                       left: 5, top: 5, right: 5),
// //                                   child: Image.asset(
// //                                     'image/beardtrim.png',
// //                                     width: 90,
// //                                     height: 90,
// //                                   ),
// //                                 ),
// //                                 Container(
// //                                   margin: EdgeInsets.only(top: 13, bottom: 9),
// //                                   alignment: Alignment.center,
// //                                   child: Text(
// //                                     'Beard Trim',
// //                                     style: TextStyle(
// //                                       color: Color(0xff35415D),
// //                                       fontSize: 13,
// //                                     ),
// //                                   ),
// //                                 ),
// //                               ],
// //                             ),
// //                           ),
// //                           Container(
// //                             margin: EdgeInsets.only(top: 5, bottom: 7),
// //                             alignment: Alignment.center,
// //                             child: Text(
// //                               'Rp 20.000,-',
// //                               style: TextStyle(
// //                                 color: Color(0xffF7D99F),
// //                                 fontSize: 12,
// //                               ),
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                   ],