import 'package:ecommerce/src/bloc/authentication/login_bloc.dart';
import 'package:ecommerce/src/routes/route_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:sign_in_button/sign_in_button.dart';
import '../widgets/widgets.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Let's Get Started",
            // style: Theme.of(context).textTheme.titleLarge,
            style: TextStyle(fontSize: 30),
          ),
          BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccess)  {
                Fluttertoast.showToast(msg: 'Login Success');

                Future.delayed(const Duration(microseconds: 500), () {
                  context.goNamed(Routes.HOME_ROUTE);
                });
              }
            },
            builder: (context, state) {
              if (state is LoginLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SignInButton(
                      Buttons.facebook,
                      onPressed: () =>
                          context.read<LoginBloc>().add(RequestTwitterLogin()),
                    ),
                    SignInButton(
                      Buttons.google,
                      onPressed: () =>
                          context.read<LoginBloc>().add(RequestGoogleLogin()),
                    ),
                    SignInButton(
                      Buttons.twitter,
                      onPressed: () =>
                          context.read<LoginBloc>().add(RequestTwitterLogin()),
                    ),
                  ],
                ),
              );
            },
          ),

          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context.pushNamed(Routes.LOGIN_ROUTE);
                    },
                    child: Text(
                      'Signin',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                ],
              ),
              primaryFullWidthButton(
                buttonText: 'Create An Account',
                onTap: () {
                  context.pushNamed(Routes.REGISTER_ROUTE);
                },
                backgroundColor: null,
                textColor: null,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
