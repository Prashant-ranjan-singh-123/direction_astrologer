class EmailModel {
  String email;
  String userName;
  String userId;

  EmailModel(
      {required this.email, required this.userName, required this.userId});
}

List<EmailModel> model = [
  EmailModel(
      email: 'test1@gmail.com',
      userName: 'Pastor',
      userId: 'Pastor Joseph Fernandez'),
  EmailModel(
      email: 'test2@gmail.com',
      userName: 'Father',
      userId: 'Father Daniel Jones'),
  EmailModel(
      email: 'test3@gmail.com',
      userName: 'Brother',
      userId: 'Brother Ramesh Babu'),
  EmailModel(
      email: 'test4@gmail.com',
      userName: 'Sister',
      userId: 'Sister Leena Daisy'),
  EmailModel(
      email: 'test5@gmail.com',
      userName: 'Rebecca',
      userId: 'Pastor Rebecca Rosy'),
];
