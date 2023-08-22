import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_practice/presentation/cubits/auth/auth_cubit.dart';
import 'package:test_practice/presentation/routes/app_router.dart';

@RoutePage()
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is Authenticated) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text('Welcome ${state.user.name}'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<AuthCubit>().login(username: 'John');
                    },
                    child: Text("Test"),
                  ),
                ],
              );
            }
            if (state is UnAuthenticated) {
              return Center(
                child: ElevatedButton(
                  onPressed: () async {
                    final res = await context
                        .pushRoute<String?>(LoginRoute(title: 'fasdfdf'));
                    if (res != null) {
                      print(res);
                    }
                  },
                  child: Text('Route'),
                ),
              );
            }
            if (state is AuthError) {
              return Center(
                child: Text(state.message),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
