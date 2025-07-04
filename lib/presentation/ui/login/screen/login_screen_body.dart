import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_sync/core/assets/assets_paths.dart' hide Icons;
import 'package:health_sync/core/extensions/extensions.dart';
import 'package:health_sync/core/extensions/spaces.dart';
import 'package:health_sync/presentation/themes/colors.dart';
import 'package:health_sync/presentation/ui/login/managers/login_screen_events.dart';
import 'package:health_sync/presentation/ui/login/managers/login_screen_view_model.dart';

import '../managers/login_text_controllers_manager.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final controllerManager = context.read<LoginTextControllerManager>();
    final viewModel = context.read<LoginScreenViewModel>();
    return Center(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Image.asset(Images.logo),
            verticalSpace(32),
            Material(
              elevation: 12,
              borderRadius: BorderRadius.circular(8),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 32),
                width: context.width * 0.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.secondary,
                      blurRadius: 30,
                      spreadRadius: 0.5,
                      offset: const Offset(0, 5),
                    )
                  ]
                ),
                child: Form(
                  key: controllerManager.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        context.locale.welcome_back,
                        style: Theme.of(context).textTheme.titleLarge,
                        textAlign: TextAlign.center,
                      ),
                      verticalSpace(30),
                      Text(
                        context.locale.email,
                        style: Theme.of(context).textTheme.titleMedium,
                        textAlign: TextAlign.start,
                      ),
                      verticalSpace(11),
                      TextFormField(
                        controller: controllerManager.getController(
                          LoginFormFields.EMAIL,
                        ),
                        decoration: InputDecoration(
                          hintText: context.locale.email,
                          labelText: context.locale.enter_your_email,
                          prefixIcon: Icon(Icons.email, color: gray),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return context.locale.enter_your_email;
                          }
                        },
                        onChanged: (value) {},
                      ),
                      verticalSpace(26),
                      Text(
                        context.locale.password,
                        style: Theme.of(context).textTheme.titleMedium,
                        textAlign: TextAlign.start,
                      ),
                      verticalSpace(11),
                      TextFormField(
                        controller: controllerManager.getController(
                          LoginFormFields.PASSWORD,
                        ),
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: context.locale.password,
                          labelText: context.locale.enter_your_password,
                          prefixIcon: Icon(Icons.lock, color: gray),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return context.locale.enter_your_password;
                          }
                        },
                      ),
                      verticalSpace(32),
                      ElevatedButton(
                        onPressed: () {
                          final email = controllerManager
                              .getController(LoginFormFields.EMAIL)
                              .text;
                          final password = controllerManager
                              .getController(LoginFormFields.PASSWORD)
                              .text;
                          viewModel.onEvent(
                            LoginEvent(email: email, password: password, key: controllerManager.formKey),
                          );
                        },
                        child: Text(
                          context.locale.login,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ),
                      verticalSpace(24),
                      Text(
                        context.locale.need_help,
                        style: Theme.of(context).textTheme.displayMedium,
                        textAlign: TextAlign.center,
                      ),
                      verticalSpace(32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.security, color: gray),
                          horizontalSpace(8),
                          Text(
                            context.locale.secure_login,
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
