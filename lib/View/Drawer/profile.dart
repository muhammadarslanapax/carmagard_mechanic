import 'package:carmagard/Constant/dio_int.dart';
import 'package:carmagard/Provider/loginprovider.dart';
import 'package:carmagard/Provider/rating_provider.dart';
import 'package:carmagard/Service/baseurl.dart';
import 'package:carmagard/View/Auth/User/login.dart';
import 'package:carmagard/View/Profile/edit_profile.dart';
import 'package:carmagard/View/Service/all_services.dart';
import 'package:carmagard/View/style.dart';
import 'package:carmagard/generated/assets.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../Provider/success_related_functions_provider.dart';

class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({super.key});

  @override
  ConsumerState createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView> with Ui {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Profile",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
            onPressed: () {
              nav(context, const EditProfile());
            },
            child: input(
              Colors.green,
              15,
              "Edit Profile",
              w500,
            ),
          )
        ],
      ),
      body: ListView(
        // padding: const EdgeInsets.all(10),
        children: [
          const _LiteProfile(),

          /* ListTile(
            onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const EditProfile())),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
            // leading: Image.asset(Assets.assetsLogout, width: 30),
            title: input(black, 16, "Edit profile", w400),
          ),*/
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                hspacer(10),
                ListTile(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const MechanicService())),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  leading: const Icon(Icons.settings_suggest_outlined),
                  title: input(black, 16, "Services", w400),
                ),
                const Divider(),
                ListTile(
                  onTap: () async {
                    await ref
                        .read(successRelatedFunctionsProvider.notifier)
                        .logout();
                    ref.invalidate(loginMechProvider);
                    if (mounted) {
                      navW(context, const LoginScreen());
                    }
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  leading: const Icon(Icons.logout_rounded),
                  title: input(black, 16, "Log out", w400),
                ),
                hspacer(10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LiteProfile extends ConsumerWidget {
  const _LiteProfile();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(loginMechProvider);
    final emailVerified = switch (data.value?.mechanic?.isPhoneVerified) {
      true => "VERIFIED",
      _ => "VERIFY"
    };
    return Column(
      children: [
        Container(
          height: 220,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 30,
                child: SvgPicture.asset("assets/user1.svg"),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "${data.value?.mechanic?.mechanicName ?? ""} ${data.value?.mechanic?.lastName ?? ""}",
                style: const TextStyle(
                  fontSize: 19,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                data.value?.mechanic?.email ?? "",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black.withOpacity(0.8),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ListTile(
                  onTap: () async {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  // leading: Image.asset(Assets.assetsLogout, width: 30),
                  leading: const Icon(Icons.phone_outlined),
                  title: Text(
                    data.value?.mechanic?.phoneNumber ?? "Phone number",
                    style: const TextStyle(fontSize: 16),
                  ),
                  trailing: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    height: 25,
                    width: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: const Color(0xff32BB78)),
                    child: Center(
                      child: Text(
                        emailVerified,
                        style: const TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )),
            ],
          ),
        ),
        const Divider(
          // height: ,
          thickness: 5,
          color: Colors.transparent,
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
