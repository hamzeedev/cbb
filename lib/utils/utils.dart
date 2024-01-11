import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Utils {
  // static String extractFirebaseError(String error) {
  //   return error.substring(error.indexOf(']') + 1);
  // }

  static void showSnackBar(String title, String message, Widget icon) {
    Get.showSnackbar(GetSnackBar(
      backgroundColor: Colors.white,
      title: title,
      isDismissible: true,
      duration: const Duration(milliseconds: 2000),
      icon: icon,
      titleText: Text(
        title,
        style: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, height: 0),
      ),
      messageText: Text(
        message,
        style: const TextStyle(color: Colors.grey, height: 0),
      ),
      borderColor: Colors.black,
      snackPosition: SnackPosition.BOTTOM,
      borderRadius: 20,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      snackStyle: SnackStyle.GROUNDED,
    ));
  }

  // static showCustomDialog({required BuildContext context,VoidCallback? onTap,required String text,required Widget icon,String? buttonText,Widget? widget}){
  //   showGeneralDialog(context: context,
  //     barrierDismissible: false,
  //     barrierColor: Colors.black12,
  //     pageBuilder: (context, animation, secondaryAnimation) {
  //       return  Center(
  //         child: Container(
  //           width: MediaQuery.sizeOf(context).width,
  //           margin: const EdgeInsets.symmetric(horizontal: 20),
  //           child: ClipRRect(
  //             borderRadius: BorderRadius.circular(20),
  //             child: widget?? Container(
  //               height: 400,
  //               padding: const EdgeInsets.symmetric(horizontal: 20),
  //               decoration: const BoxDecoration(
  //                   color: Colors.white
  //               ),
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   icon,
  //                   const SizedBox(height: 20,),
  //                   Padding(
  //                     padding: const EdgeInsets.symmetric(horizontal: 10),
  //                     child: Text(text,textAlign: TextAlign.center,style: Theme.of(context).textTheme.labelMedium!.copyWith(
  //                       color: Colors.black,
  //                     ),),
  //                   ),
  //                   const SizedBox(height: 20,),
  //                   GestureDetector(onTap: onTap,
  //                     child: Card(
  //                       color: Colors.white,
  //                       shape: OutlineInputBorder(
  //                           borderRadius: BorderRadius.circular(20),
  //                           borderSide: BorderSide(
  //                               color: Colors.grey.withOpacity(.2)
  //                           )
  //                       ),
  //                       child: Container(
  //                         decoration: BoxDecoration(
  //                             borderRadius: BorderRadius.circular(20),
  //                             color: Colors.white
  //                         ),
  //                         child: Padding(
  //                           padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
  //                           child: Text(buttonText?? 'Ok',style: Theme.of(context).textTheme.labelLarge!.copyWith(
  //                               color: primaryColor,
  //                               fontWeight: FontWeight.bold,
  //                               fontSize: 15
  //                           ),),
  //                         ),
  //                       ),
  //                     ),
  //                   )
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ),
  //       );
  //     },);
  // }




  static  String getCurrentDate() {
    final now = DateTime.now();
    final formattedDate = DateFormat('dd-MM-yyyy').format(now);
    return formattedDate;
  }
 static String getCurrentTime() {
    final now = TimeOfDay.now();
    final formattedTime = DateFormat('h:mm a').format(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, now.hour, now.minute));
    return formattedTime;
  }
}



class ShimmerEffects{

}



