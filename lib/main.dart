import 'package:carmagard/TabComponent/homepage.dart';
import 'package:carmagard/View/Auth/User/login.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'Provider/loginprovider.dart';
import 'View/style.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Provider/shared_prefrence_provider.dart';
import 'Widget/custom_snackbar.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  runApp(ProviderScope(overrides: [
    sharedPreferenceProvider.overrideWithValue(prefs),
  ], child: const MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  Stream<Widget> loading() async* {
    final sharedPro = ref.read(sharedPreferenceProvider);
    final dayDiff =
        DateTime.tryParse(sharedPro.getString("login_expire_in") ?? "");
    // await Future.delayed(const Duration(seconds: 3));
    print("DayDiff: ${dayDiff}");
    if (dayDiff == null || dayDiff.isBefore(DateTime.now())) {
      yield const LoginScreen();
    } else {
      print("This block ran");
      final email = ref.read(sharedPreferenceProvider).getString("email");
      final password = ref.read(sharedPreferenceProvider).getString("password");
      ref.read(loginMechProvider.notifier).login(email!, password!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carmagard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'WorkSan',
        appBarTheme: AppBarTheme.of(context)
            .copyWith(backgroundColor: const Color(0xffF5F5F5)),
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder<Widget>(
          stream: loading(),
          initialData: const SplashScreen(),
          builder: (context, sn) {
            return sn.data!;
          }),
    );
  }
}

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(loginMechProvider, (previous, next) {
      if (!next.isLoading && next.hasError) {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) {
          return const LoginScreen();
        }));

        return;
      }
      if (next.value?.success == true && !next.isLoading) {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) {
          return const HomePage();
        }));
      }
    });
    return Scaffold(
      backgroundColor: Ui().bg,
      body: Column(
        children: [
          Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 100,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width - 100,
                        child: Image.asset('assets/logo.png')),
                    // Ui().input(Ui().black30, 32, 'HandyMan', Ui().w700)
                  ],
                ),
              ),
            ),
          ),
          const Spacer(),
          // Padding(
          //   padding: Ui().pSymmetric(30, 0),
          //   child: Image.asset('assets/powered.png'),
          // ),
        ],
      ),
    );
  }
}
