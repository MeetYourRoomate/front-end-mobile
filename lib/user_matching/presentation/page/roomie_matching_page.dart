import 'package:flutter/cupertino.dart';

import 'package:meet_your_roommate_app/profile/user_profile_provider.dart';
import 'package:meet_your_roommate_app/user_matching/presentation/widget/user_matching_widget.dart';
import 'package:provider/provider.dart';

class RoomieMatchingPage extends StatefulWidget {
  const RoomieMatchingPage({super.key});

  @override
  State<RoomieMatchingPage> createState() => _RoomieMatchingPageState();
}

class _RoomieMatchingPageState extends State<RoomieMatchingPage> {
  List images = [
    "https://p0.piqsels.com/preview/901/709/96/colombia-medellin.jpg",
    "https://p1.pxfuel.com/preview/110/923/657/model-young-male-smiling.jpg",
    "http://www.eldiario.net/noticias/2014/2014_09/nt140923/f_2014-09-23_68.jpg",
    "https://e00-elmundo.uecdn.es/assets/multimedia/imagenes/2019/04/17/15555171640615.jpg",
    "https://images.ecestaticos.com/4p56t84xWYPuXzT3ZBiUlj54RAs=/70x0:2638x1809/992x700/filters:fill(white):format(jpg)/f.elconfidencial.com%2Foriginal%2F317%2Fae0%2F456%2F317ae0456e63bd37ce7fa809d5955672.jpg",
    "https://lamenteesmaravillosa.com/wp-content/uploads/2012/06/mujer-ojos-cerrados-conectando-con-si-misma.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    final userProfileProvider = Provider.of<UserProfileProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Encuentra tu Roomie",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: UserMatchingWidget(
              images: images,
              profiles: userProfileProvider.listProfiles,
            ),
          )
        ],
      ),
    );
  }
}
