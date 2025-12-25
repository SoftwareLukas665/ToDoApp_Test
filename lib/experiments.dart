// import 'package:flutter/material.dart';
//
//
// class lukas extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
//         child: Row(
//           children: [
//             Spacer(flex: 2),
//
//             Container(
//               height: 60,
//               width: 200,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(50),
//                 color: Colors.grey[350],
//               ),
//             ),
//
//             Spacer(),
//
//             Container(
//               height: 60,
//               width: 60,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(50),
//                 color: Colors.grey[350],
//               ),
//             ),
//
//             Spacer(flex: 2),
//           ],
//         )
//
//
//     );
//   }
// }
//
//
//
//
//
//
//
//
// class test extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Container(
//         height: 60,
//         width: 200,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(50),
//           color: Colors.grey[350],
//         ),
//         child: Row(
//           children: [
//             Expanded(
//               child: Center(
//                 child: Column(
//                   children: [
//                     Spacer(),
//                     IconButton(onPressed: () {}, icon: Icon(Icons.home)),
//                     //Text('Home'),
//                     Spacer(),
//                   ],
//                 ),
//               ),
//             ),
//
//             Expanded(
//               child: Center(
//                 child: Column(
//                   children: [
//                     Spacer(),
//                     IconButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => colorTest()),
//                         );
//                       },
//                       icon: Icon(Icons.person),
//                     ),
//                     //Text('Profil'),
//                     Spacer(),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class testTwo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 60,
//       width: 60,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(100),
//         color: Colors.grey[350],
//       ),
//       child: Row(
//         children: [
//           Expanded(
//             child: Center(
//               child: Column(
//                 children: [
//                   Spacer(),
//                   Icon(Icons.add, color: Colors.black, size: 50),
//                   Spacer(),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
