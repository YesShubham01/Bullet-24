// import 'package:flutter/material.dart';

// import '../Pages/BuyScreen/buy_screen.dart';
// import '../Pages/SellScreen/sell_screen.dart';
// import '../Res/Theme/theme.dart';

// //! ignoring the idea for now.

// class SwitchPage extends StatefulWidget {
//   final bool isBuy;

//   const SwitchPage({Key? key, required this.isBuy}) : super(key: key);

//   @override
//   State<SwitchPage> createState() => _SwitchPageState();
// }

// class _SwitchPageState extends State<SwitchPage> {
//   @override
//   void initState() {
//     super.initState();
//     futureSwitch();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: lightGreyBackground,
//       body: Center(child: BuySellSwitch(isBuy: widget.isBuy)),
//     );
//   }

//   void futureSwitch() {
//     Future.delayed(const Duration(milliseconds: 1000), () {
//       if (widget.isBuy) {
//         Navigator.of(context).pushReplacement(
//           MaterialPageRoute(
//             builder: (context) => const SellScreen(),
//           ),
//         );
//       } else {
//         Navigator.of(context).pushReplacement(
//           MaterialPageRoute(
//             builder: (context) => const BuyScreen(),
//           ),
//         );
//       }
//     });
//   }
// }

// class BuySellSwitch extends StatelessWidget {
//   final bool isBuy;

//   const BuySellSwitch({Key? key, required this.isBuy}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Positioned(
//           child: _bgContainer(),
//         ),
//         AnimatedPositioned(
//           duration: const Duration(milliseconds: 250),
//           left: isBuy ? 1 : 40,
//           child: _circularContainer(),
//         ),
//         Positioned(
//           top: 3,
//           left: 3,
//           child: Hero(
//             tag: "buyText",
//             child: Text(
//               "Buy",
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 color: isBuy ? Colors.white : Colors.black,
//               ),
//             ),
//           ),
//         ),
//         Positioned(
//           top: 3,
//           right: 3,
//           child: Hero(
//             tag: "sellText",
//             child: Text(
//               "Sell",
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 color: isBuy ? Colors.black : Colors.white,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _circularContainer() {
//     return Hero(
//       tag: "circularContainer",
//       child: Container(
//         decoration: const BoxDecoration(
//           shape: BoxShape.circle,
//           color: Colors.blue,
//         ),
//         height: 29,
//         width: 30,
//       ),
//     );
//   }

//   Widget _bgContainer() {
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 300),
//       height: 30,
//       width: 70,
//       decoration: ShapeDecoration(
//         color: BS_FSG_button_false_color,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20),
//         ),
//         shadows: [
//           BoxShadow(
//             color: shadow_false,
//             blurRadius: 4,
//             offset: const Offset(-2, 6),
//             spreadRadius: 0,
//           ),
//         ],
//       ),
//     );
//   }
// }
