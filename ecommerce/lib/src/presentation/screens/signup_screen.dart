import 'package:ecommerce/src/bloc/authentication/remember_switch_cubit.dart';
import 'package:ecommerce/src/bloc/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/widgets.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Sign Up",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            BlocBuilder<SignupBloc, SignupState>(
              builder: (context, state) {
                if (state is SignupInitial) {
                  return Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          controller: state.usernameController,
                          decoration: InputDecoration(
                            label: Text('Username'),
                            labelStyle: Theme.of(context).textTheme.labelMedium
                                ?.copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.outlineVariant,
                                ),
                          ),
                          validator: (value) {
                            if (value == '' || value == null) {
                              return "Username is required";
                            } else {
                              return null;
                            }
                          },
                        ),
                        TextFormField(
                          controller: state.emailController,
                          decoration: InputDecoration(
                            label: Text('Email'),
                            labelStyle: Theme.of(context).textTheme.labelMedium
                                ?.copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.outlineVariant,
                                ),
                          ),
                          validator: (value) {
                            if (value == '' || value == null) {
                              return "email is required";
                            } else {
                              return null;
                            }
                          },
                        ),
                        TextFormField(
                          controller: state.passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            label: Text('Password'),
                            labelStyle: Theme.of(context).textTheme.labelMedium
                                ?.copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.outlineVariant,
                                ),
                          ),
                          validator: (value) {
                            if (value == '' || value == null) {
                              return "password is required";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ],
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),

            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Remember Me',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                BlocBuilder<RememberSwitchCubit, RememberSwitchState>(
                  builder: (context, state) {
                    return Switch(
                      value: state is switchedChanged ? state.value : true,
                      onChanged: (value) => context
                          .read<RememberSwitchCubit>()
                          .switchToggle(value),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: primaryFullWidthButton(
        buttonText: "Sign Up",
        onTap: () {
          if (formKey.currentState!.validate()) {
            print("object");
          }
        },
        backgroundColor: null,
        textColor: null,
      ),
    );
  }
}
