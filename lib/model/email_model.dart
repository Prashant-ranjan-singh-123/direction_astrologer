import 'package:direction_astrologer/utils/assets.dart';

class EmailModel {
  String email;
  String userName;
  String userId;
  String image;

  EmailModel(
      {required this.email,
      required this.userName,
      required this.userId,
      required this.image});
}

List<EmailModel> model = [
  EmailModel(
      email: 'test1@gmail.com',
      userName: 'Pastor',
      userId: 'Pastor Joseph Fernandez',
      image: AppAssets.instance().png_doctor_one),
  EmailModel(
      email: 'test2@gmail.com',
      userName: 'Father',
      userId: 'Father Daniel Jones',
      image: AppAssets.instance().png_doctor_two),
  EmailModel(
      email: 'test3@gmail.com',
      userName: 'Brother',
      userId: 'Brother Ramesh Babu',
      image: AppAssets.instance().png_doctor_three),
  EmailModel(
      email: 'test4@gmail.com',
      userName: 'Sister',
      userId: 'Sister Leena Daisy',
      image: AppAssets.instance().png_doctor_four),
  EmailModel(
      email: 'test5@gmail.com',
      userName: 'Rebecca',
      userId: 'Pastor Rebecca Rosy',
      image: AppAssets.instance().png_doctor_five),
];
