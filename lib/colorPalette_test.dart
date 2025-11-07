// import 'package:flutter/material.dart';
// import 'design_system/variables/app_colors.dart';
//
// class colorTest extends StatefulWidget {
//   const colorTest({super.key});
//
//   @override
//   State<colorTest> createState() => _colorTestState();
// }
//
// class _colorTestState extends State<colorTest> {
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("ListView + Button"),
//       ),
//       body: Column(
//         children: [
//           // Die ListView nimmt den ganzen verfügbaren Platz ein
//           Expanded(
//             child: ListView.separated(
//               padding: const EdgeInsets.all(16),
//               itemCount: 5,
//               separatorBuilder: (context, index) => const SizedBox(height: 12),
//               itemBuilder: (context, index) {
//                 return Container(
//                   height: 100,
//                   decoration: BoxDecoration(
//                     color: AppColors.accentLight, //Colors.blue[100 * (index + 2)],
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   alignment: Alignment.center,
//                   child: Text(
//                     "Element ${index + 1}",
//                     style: const TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: AppColors.textPrimary,
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//
//           // Der Button am unteren Rand
//           Padding(
//             padding: const EdgeInsets.all(153.0),
//             child: SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: () {
//                   // Action
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: AppColors.accentDark, // deine Farbe
//                   foregroundColor: AppColors.textPrimary, // Textfarbe
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12), // abgerundete Ecken
//                   ),
//                 ),
//                 child: const Text("Weiter"),
//               )
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
