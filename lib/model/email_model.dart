class EmailModel {
  String email;
  String userName;
  String userId;

  EmailModel(
      {required this.email, required this.userName, required this.userId});
}

List<EmailModel> model = [
  EmailModel(email: 'test1@gmail.com', userName: 'test1', userId: '1'),
  EmailModel(email: 'test2@gmail.com', userName: 'test2', userId: '2'),
  EmailModel(email: 'test3@gmail.com', userName: 'test3', userId: '3'),
  EmailModel(email: 'test4@gmail.com', userName: 'test4', userId: '4'),
  EmailModel(email: 'test5@gmail.com', userName: 'test5', userId: '5'),
];
