import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_sync/core/extensions/extensions.dart';
import 'package:health_sync/domain/entities/auth/register_request_entity.dart';
import 'package:health_sync/presentation/ui/register/manager/register_page_event.dart';

import '../../../../core/assets/assets_paths.dart';
import '../../../../core/common/common_imports.dart';
import '../../../../core/extensions/spaces.dart';
import '../../../themes/colors.dart';
import '../manager/controller_manager.dart';
import '../manager/register_page_view_model.dart';

class RegisterPageBody extends StatelessWidget {
  const RegisterPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<RegisterPageViewModel>();
    final controllerManager = context.read<RegisterControllerManager>();
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 32,
                ),
                width: context.width * 0.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.secondary,
                      blurRadius: 30,
                      spreadRadius: 0.5,
                      offset: const Offset(0, 5),
                    ),
                  ],
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
                      _firstnameLastnameRow(context),
                      verticalSpace(26),
                      Text(
                        context.locale.user_name,
                        style: Theme.of(context).textTheme.titleMedium,
                        textAlign: TextAlign.start,
                      ),
                      verticalSpace(11),
                      TextFormField(
                        controller: controllerManager.usernameController,
                        decoration: InputDecoration(
                          hintText: context.locale.user_name,
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
                        context.locale.email,
                        style: Theme.of(context).textTheme.titleMedium,
                        textAlign: TextAlign.start,
                      ),
                      verticalSpace(11),
                      TextFormField(
                        controller: controllerManager.emailController,
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
                        controller: controllerManager.passwordController,
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
                      verticalSpace(26),
                      Text(
                        context.locale.phone_number,
                        style: Theme.of(context).textTheme.titleMedium,
                        textAlign: TextAlign.start,
                      ),
                      verticalSpace(11),
                      TextFormField(
                        controller: controllerManager.phoneNumberController,
                        decoration: InputDecoration(
                          hintText: context.locale.phone_number,
                          labelText: context.locale.enter_your_phone_number,
                          prefixIcon: Icon(Icons.phone_android, color: gray),
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
                        context.locale.address,
                        style: Theme.of(context).textTheme.titleMedium,
                        textAlign: TextAlign.start,
                      ),
                      verticalSpace(11),
                      TextFormField(
                        controller: controllerManager.addressController,
                        decoration: InputDecoration(
                          hintText: context.locale.address,
                          labelText: context.locale.enter_your_address,
                          prefixIcon: Icon(Icons.location_city, color: gray),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return context.locale.enter_your_email;
                          }
                        },
                        onChanged: (value) {},
                      ),

                      verticalSpace(32),
                      _registerButton(context),
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

  Widget _registerButton(BuildContext context) {
    final viewModel = context.read<RegisterPageViewModel>();
    final controllerManager = context.read<RegisterControllerManager>();
    return ElevatedButton(
      onPressed: () {
        RegisterRequestEntity entity = createRegisterRequestEntity(
          controllerManager,
        );
        viewModel.onEvent(
          RegisterEvent(entity: entity, key: controllerManager.formKey),
        );
      },
      child: Text(
        context.locale.register,
        style: Theme.of(context).textTheme.labelMedium,
      ),
    );
  }

  Widget _firstnameLastnameRow(BuildContext context) {
    final controllerManager = context.read<RegisterControllerManager>();
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.locale.first_name,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              verticalSpace(8),
              TextFormField(
                controller: controllerManager.firstNameController,
                decoration: InputDecoration(
                  hintText: context.locale.first_name,
                  labelText: context.locale.enter_your_first_name,
                  prefixIcon: Icon(Icons.person, color: gray),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return context.locale.enter_your_first_name;
                  }
                },
              ),
            ],
          ),
        ),

        horizontalSpace(16),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.locale.last_name,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              verticalSpace(8),
              TextFormField(
                controller: controllerManager.lastNameController,
                decoration: InputDecoration(
                  hintText: context.locale.last_name,
                  labelText: context.locale.enter_your_last_name,
                  prefixIcon: Icon(Icons.person, color: gray),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return context.locale.enter_your_last_name;
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  RegisterRequestEntity createRegisterRequestEntity(
    RegisterControllerManager controllerManager,
  ) {
    final entity = RegisterRequestEntity(
      firstName: controllerManager.firstNameController.text,
      lastName: controllerManager.lastNameController.text,
      username: controllerManager.usernameController.text,
      email: controllerManager.emailController.text,
      password: controllerManager.passwordController.text,
      phoneNumber: controllerManager.phoneNumberController.text,
      address: controllerManager.addressController.text,
      gender: "Male",
      accessLevel: "PATIENT",
    );
    return entity;
  }
}

enum Gender { MALE, FEMALE }
