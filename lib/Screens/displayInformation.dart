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

    final desiredCellHeight = screenHeight * 0.2;
    final desiredCellWidth = screenWidth;

    int cellsPerLine = 1;
    int cellsPerColumn = 1;
    int crossAxis = 1;

    if (provider.resolution_width_count > provider.resolution_height_count) {
      cellsPerLine = provider.resolution_width_count;
      cellsPerColumn = provider.resolution_height_count;
      print("widht sup");
      print("Line : $cellsPerLine ");
      print("Column : $cellsPerColumn");
      if (cellsPerColumn > 0) {
        crossAxis = cellsPerColumn;
      }
      //print(250 / cellsPerLine);
    } else {
      print("widht inf");
      cellsPerLine = provider.resolution_height_count;
      cellsPerColumn = provider.resolution_width_count;
      if (cellsPerLine > 0) {
        crossAxis = cellsPerLine;
      }
      print("Line : $cellsPerLine ");
      print("Column : $cellsPerColumn");
      print("CorssAXIS $crossAxis");
      //print(250 / cellsPerLine);
    }

    final cellAspectRatio = desiredCellWidth / desiredCellHeight;
    //final cellAspectRatio = cellsPerLine / 300;

    return Container(
      height: 300,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxis,
            childAspectRatio: 5,
            mainAxisExtent: 300 / cellsPerLine),
        itemCount:
            provider.resolution_height_count * provider.resolution_width_count,
        itemBuilder: (context, index) {
          return Container(
            height: 5,
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
                color: Colors.grey,
                border: Border.all(color: Colors.white, width: 3)),
          );
        },
      ),
    );
  }
}





// Column(
//       children: [
//         SizedBox(
//           height: desiredCellHeight,
//           child: GridView.builder(
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: crossAxis,
//               childAspectRatio: cellAspectRatio,
//             ),
//             itemCount: provider.resolution_height_count *
//                 provider.resolution_width_count,
//             itemBuilder: (context, index) {
//               return CardItems();
//             },
//           ),
//         ),
//       ],
//     );
