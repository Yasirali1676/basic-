// import 'package:csc_picker/csc_picker.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF618264),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
//             child: Card(
//               color: const Color(0xFF79AC78),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12.0), // Adjust the radius as needed
//               ),
//               shadowColor: Colors.black,
//               elevation: 10.0,
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: CSCPicker(
//                   layout: Layout.vertical,
//                   flagState: CountryFlag.ENABLE,
//                   onCountryChanged: (country){
//                     print(country);
//                   },
//                   onStateChanged: (state){
//                     print(state);
//                   },
//                   onCityChanged: (city){
//                     print(city);
//                   },
//                   ///placeholders for dropdown search field
//                   countrySearchPlaceholder: "Country",
//                   stateSearchPlaceholder: "State",
//                   citySearchPlaceholder: "City",

//                   ///labels for dropdown
//                   countryDropdownLabel: "Select Country",
//                   stateDropdownLabel: "Select State",
//                   cityDropdownLabel: "Select City",
//                   dropdownDialogRadius: 12.0,
//                   searchBarRadius: 30.0,
//                   dropdownDecoration: BoxDecoration(
//                       borderRadius: BorderRadius.all(Radius.circular(10)),
//                       color: Color(0xFFB0D9B1),
//                       border:
//                       Border.all(color: Colors.grey.shade800, width: 2)),

//                   disabledDropdownDecoration: BoxDecoration(
//                       borderRadius: BorderRadius.all(Radius.circular(10)),
//                       color: Color(0xFFD0E7D2),
//                       border:
//                       Border.all(color: Colors.grey.shade600, width: 2)),
//                   ///selected item style [OPTIONAL PARAMETER]
//                   selectedItemStyle: TextStyle(
//                     color: Colors.grey.shade800,
//                     fontSize: 14,
//                   ),

//                   ///DropdownDialog Heading style [OPTIONAL PARAMETER]
//                   dropdownHeadingStyle: TextStyle(
//                       color: Colors.grey.shade900,
//                       fontSize: 17,
//                       fontWeight: FontWeight.bold),

//                   ///DropdownDialog Item style [OPTIONAL PARAMETER]
//                   dropdownItemStyle: TextStyle(
//                     color: Colors.grey.shade800,
//                     fontSize: 14,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }