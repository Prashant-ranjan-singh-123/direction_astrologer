import 'package:flutter_bloc/flutter_bloc.dart';

import '../states/login_state.dart';

class LoginCubit extends Cubit<LoginState>{
  LoginCubit(): super(LoginState());
}