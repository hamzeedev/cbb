import 'package:cached_network_image/cached_network_image.dart';
import 'package:cbb/data/network/firebase/services/update-profile.dart';
import 'package:cbb/data/user_prefe/user_pref.dart';
import 'package:cbb/res/colors/AppColors.dart';
import 'package:cbb/res/routes/routes_names.dart';
import 'package:cbb/utils/utils.dart';
import 'package:cbb/view/cbb/noticeBoard/notice_board.dart';
import 'package:cbb/view/cbb/noticeBoard/upload_Announcements.dart';
import 'package:cbb/view/chats/chats.dart';
import 'package:cbb/view/faqs/faqs.dart';
import 'package:cbb/view/home/home.dart';
import 'package:cbb/view/linkedUp/linkedup.dart';
import 'package:cbb/view/magazines/magazines.dart';
import 'package:cbb/view/setting/components/setting_header.dart';
import 'package:cbb/view/setting/help_support/components/question_box.dart';
import 'package:cbb/view_model/controllers/bottom_navigation_controller.dart';
import 'package:cbb/view_model/controllers/user_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MyDrawer extends StatelessWidget {
   MyDrawer({Key? key}) : super(key: key);
   final controller=Get.put(PictureController());
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      backgroundColor: AppColors.primaryColor.withOpacity(.8),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: const BoxDecoration(color: Colors.white),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 40,
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
                                radius: 40,
                                backgroundImage: imageProvider,
                              );
                            },
                            errorWidget: (context, url, error) {
                              return const CircleAvatar(
                                radius: 40,
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
                                 Get.back();
                                 Utils.showSnackBar('Uploading Picture', 'Please wait your profile image is being updated'
                                     , Icon(Icons.access_time_sharp));
                                 UpdateProfile.updateProfilePicture(image: picker.path,name: picker.name);
                               }

                             },
                             child: Container(
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(20),
                                 color: Colors.white
                               ),
                               padding: EdgeInsets.all(2),
                               child: Icon(Icons.edit_note_sharp,color: Colors.black,size: 20,),
                             ),
                           )
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      UserData.userName,
                      style: const TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      UserData.role,
                      style: const TextStyle(color: Colors.blue, fontSize: 12),
                    )
                  ],
                ),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                ListTile(
                  title: const Text(
                    'View Profile',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    // Get.to();
                    // Navigate to the user profile page
                  },
                ),
                ListTile(
                  title: const Text(
                    'Services',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    // Navigate to the services page
                  },
                ),
                ListTile(
                  title: const Text(
                    'Settings',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Get.toNamed(RoutesNames.setting);
                  },
                ),
                ListTile(
                  title: const Text(
                    'Hall of Fame',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Get.back();
                    // final controller = Get.put(NavigationController());
                    // controller.changePage(1);
                    Get.to(HomeView(title: "HALL OF FAME"));
                  },
                ),
                ListTile(
                  title: const Text(
                    'Linked Up',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Get.back();
                    // final controller = Get.put(NavigationController());
                    // controller.changePage(1);
                    Get.to(const LinkedUpPage(
                      backOk: true,
                    ));
                  },
                ),
                ListTile(
                  title: const Text(
                    'FAQs',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Get.to(() => const Faqs());
                  },
                ),
                ListTile(
                  title: const Text(
                    'Chats',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Get.to(() => const ChatPage());
                  },
                ),
                ListTile(
                  title: const Text(
                    'Notice Board',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Get.to(() => const NoticeBoard());
                  },
                ),
                ListTile(
                  title: const Text(
                    'Magazine',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Get.to(() => MagazinePage());
                  },
                ),
                ListTile(
                  title: const Text(
                    'Support',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    // Navigate to the support page
                  },
                ),
                ListTile(
                  title: const Text(
                    'About',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    // Navigate to the about page
                  },
                ),
                ListTile(
                  title: const Text(
                    'Logout',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    UserPref.logout();
                    // Navigate to the about page
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
