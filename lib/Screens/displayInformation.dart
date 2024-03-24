// import 'package:absens_clone_app/helper/provider.dart';
// import 'package:absens_clone_app/widgets/card.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../widgets/getX.dart';

// class DisplayInformation extends StatefulWidget {
//   const DisplayInformation({super.key});

//   @override
//   State<DisplayInformation> createState() => _DisplayInformationState();
// }

// class _DisplayInformationState extends State<DisplayInformation> {
//   // ... (remaining code from your original implementation)

//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<MyProvider>(context);

//     return Consumer<MyProvider>(builder: (context, snapshot, child) {
//       final screenHeight = MediaQuery.of(context).size.height;
//       final screenWidth = MediaQuery.of(context).size.width;

//       // Calculate desired cell size based on 40% vertical height and 100% horizontal width
//       final desiredCellHeight = screenHeight * 0.4;
//       final desiredCellWidth = screenWidth;

//       // Create an AspectRatio widget to maintain consistent aspect ratio
//       return Column(
//         children: [
//           SizedBox(
//             height: desiredCellHeight,
//             child: GridView.builder(
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: provider.resolution_width_count == 0
//                     ? 1
//                     : provider.resolution_width_count,
//                 childAspectRatio: desiredCellWidth /
//                     desiredCellHeight, // Maintain aspect ratio
//               ),
//               itemCount: provider.resolution_height_count *
//                   provider.resolution_width_count,
//               itemBuilder: (context, index) {
//                 return CardItems();
//               },
//             ),
//           ),
//         ],
//       );
//     });
//   }
// }

import 'package:absens_clone_app/helper/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/card.dart';
import '../widgets/getX.dart';
//import 'helper/provider.dart';

class DisplayInformation extends StatefulWidget {
  const DisplayInformation({super.key});

  @override
  State<DisplayInformation> createState() => _DisplayInformationState();
}

class _DisplayInformationState extends State<DisplayInformation> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MyProvider>(context);

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final desiredCellHeight = screenHeight * 0.3;
    final desiredCellWidth = screenWidth;

    int cellsPerLine = 1;
    int cellsPerColumn = 1;

    if (provider.resolution_width_count > provider.resolution_height_count) {
      cellsPerLine = provider.resolution_width_count;
      cellsPerColumn = provider.resolution_height_count;
    } else {
      cellsPerLine = provider.resolution_height_count;
      cellsPerColumn = provider.resolution_width_count;
    }

    final cellAspectRatio = desiredCellWidth / desiredCellHeight;

    return Column(
      children: [
        SizedBox(
          height: desiredCellHeight,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: cellsPerLine == 0 ? 1 : cellsPerLine,
              childAspectRatio: cellAspectRatio,
            ),
            itemCount: provider.resolution_height_count *
                provider.resolution_width_count,
            itemBuilder: (context, index) {
              return CardItems();
            },
          ),
        ),
      ],
    );
  }
}
