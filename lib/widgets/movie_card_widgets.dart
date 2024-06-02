// import 'package:flutter/material.dart';
// import 'package:netflix/common/utils.dart';
// import 'package:netflix/models/up_comming_Model.dart';

// class MovieCardWidget extends StatelessWidget {
//   final Future<UpCommingMovieModel> future;
//   final String headlineText;
//   const MovieCardWidget(
//       {super.key, required this.future, required this.headlineText});

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: future,
//       builder: (context, snapshot) {
//         var data = snapshot.data?.results;

//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               headlineText,
//               style: const TextStyle(fontWeight: FontWeight.bold),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: data!.length,
//                 scrollDirection: Axis.horizontal,
//                 itemBuilder: (context, index) {
//                   return Container(
//                     padding: EdgeInsets.all(5),
//                     decoration:
//                         BoxDecoration(borderRadius: BorderRadius.circular(20)),
//                     child:
//                         Image.network("${imageUrl}${data[index].posterPath}"),
//                   );
//                 },
//               ),
//             )
//           ],
//         );
//       },
//     );
//   }
// }
