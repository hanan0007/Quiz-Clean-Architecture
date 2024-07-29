// import 'package:flutter/material.dart';

// class MarqueeText extends StatefulWidget {
//    MarqueeText({super.key});

//   @override
//   State<MarqueeText> createState() => _MarqueeTextState();
// }

// class _MarqueeTextState extends State<MarqueeText> with SingleTickerProviderStateMixin {
//    late AnimationController animationController;
//   late ScrollController scrollController;
  
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//      scrollController = ScrollController();
//     animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 10),
//     );
//   }
//   @override
//   Widget build(BuildContext context) {
//      return Scaffold(
//       appBar: AppBar(
//         title: const Text('HomeView'),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: SizedBox(
//           height: 50,
//           width: double.infinity,
//           child: ListView(
//             controller: controller.scrollController,
//             scrollDirection: Axis.horizontal,
//             children: const <Widget>[
//               Center(
//                 child: Text(
//                   'This is a marquee text. This is a marquee text. This is a marquee text. This is a marquee text.',
//                   style: TextStyle(fontSize: 24),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }