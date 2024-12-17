import 'package:direction_astrologer/utils/assets.dart';

class EmailModel {
  String email;
  String userName;
  String userId;
  String image;
  String firebase_id;

  EmailModel(
      {required this.email,
      required this.userName,
      required this.userId,
      required this.image,
      required this.firebase_id});
}

List<EmailModel> model = [
  EmailModel(
    email: 'test1@gmail.com',
    userName: 'Pastor',
    userId: 'Pastor Joseph Fernandez',
    image: AppAssets.instance().png_doctor_one,
    firebase_id: 'pastor_joseph_fernandez',
  ),
  EmailModel(
    email: 'test2@gmail.com',
    userName: 'Father',
    userId: 'Father Daniel Jones',
    image: AppAssets.instance().png_doctor_two,
    firebase_id: 'father_daniel_jones',
  ),
  EmailModel(
    email: 'test3@gmail.com',
    userName: 'Brother',
    userId: 'Brother Ramesh Babu',
    image: AppAssets.instance().png_doctor_three,
    firebase_id: 'brother_ramesh_babu',
  ),
  EmailModel(
    email: 'test4@gmail.com',
    userName: 'Sister',
    userId: 'Sister Leena Daisy',
    image: AppAssets.instance().png_doctor_four,
    firebase_id: 'sister_leena_daisy',
  ),
  EmailModel(
    email: 'test5@gmail.com',
    userName: 'Rebecca',
    userId: 'Pastor Rebecca Rosy',
    image: AppAssets.instance().png_doctor_five,
    firebase_id: 'pastor_rebecca_rosy',
  ),
];
