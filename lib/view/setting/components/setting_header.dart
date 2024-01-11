import 'package:cached_network_image/cached_network_image.dart';
import 'package:cbb/view_model/controllers/user_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../data/network/firebase/services/update-profile.dart';
import '../../../res/colors/AppColors.dart';
import '../../../utils/utils.dart';

class SettingHeader extends StatelessWidget {
  const SettingHeader({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 205,
        width: MediaQuery.sizeOf(context).width,
        color: AppColors.primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child:  SettingHeaderBody());
  }
}

class SettingHeaderBody extends StatelessWidget {
   SettingHeaderBody({super.key});
   final controller=Get.put(PictureController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.pop(context),
              color: Colors.white,
            ),
            const Spacer(),
            const Column(
              children: [
                Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 4,
                ),
                Icon(
                  Icons.circle,
                  color: Colors.white,
                  size: 5,
                ),
              ],
            )
          ],
        ),
        const Spacer(),
        CircleAvatar(
          radius: 50,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Obx(() => CachedNetworkImage(
                imageUrl: controller.url.value,
                placeholder: (context, url) {
                  return const Center(
                    child: SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 0.5,
                      ),
                    ),
                  );
                },
                imageBuilder: (context, imageProvider) {
                  return CircleAvatar(
                    radius: 50,
                    backgroundImage: imageProvider,
                  );
                },
                errorWidget: (context, url, error) {
                  return const CircleAvatar(
                    radius: 50,
                    child: Center(
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  );
                },
              ),),
              Align(alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    onTap: () async {
                      final picker=await ImagePicker().pickImage(source: ImageSource.gallery);
                      if(picker!=null){
                        Utils.showSnackBar('Uploading Picture', 'Please wait your profile image is being updated'
                            , const Icon(Icons.access_time_sharp));
                        UpdateProfile.updateProfilePicture(image: picker.path,name: picker.name);
                      }

                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white
                      ),
                      padding: const EdgeInsets.all(2),
                      child: const Icon(Icons.edit_note_sharp,color: Colors.black,size: 20,),
                    ),
                  )
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
         Text(
          UserData.userName,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}



class PictureController extends GetxController{
  RxString url=UserData.profilePicture.obs;
  changePicture({required String image}){
    url.value=image;
  }


}