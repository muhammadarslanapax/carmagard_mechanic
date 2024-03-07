import 'package:carmagard/Constant/dio_int.dart';
import 'package:carmagard/Provider/loginprovider.dart';
import 'package:carmagard/View/formwidget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Constant/utility_function.dart';
import '../../Widget/custom_snackbar.dart';

class EditProfile extends ConsumerWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final details = ref.watch(loginMechProvider);
    return Scaffold(
      // appBar: AppBar(),
      backgroundColor: const Color(0xffF5F5F5),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverAppBar.medium(
              title: Text(
                "Edit profile",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            SliverToBoxAdapter(
              child: ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const _EditUserProfile()));
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                // leading: Image.asset(Assets.assetsLogout, width: 30),
                title: Text(
                  details.value?.mechanic?.mechanicName ?? "Profile",
                  style: const TextStyle(fontSize: 16),
                ),
                trailing: const Text(
                  "Edit",
                  style: TextStyle(color: Colors.green, fontSize: 12),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: ListTile(
                onTap: () {
                  // ref.read(successRelatedFunctionsProvider.notifier).logout();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const _ChangePassword()));
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                // leading: Image.asset(Assets.assetsLogout, width: 30),
                title: const Text(
                  "Password",
                  style: TextStyle(fontSize: 16),
                ),
                trailing: const Text(
                  "Edit",
                  style: TextStyle(color: Colors.green, fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EditUserProfile extends ConsumerStatefulWidget {
  const _EditUserProfile({super.key});

  @override
  ConsumerState<_EditUserProfile> createState() => _EditUserProfileState();
}

class _EditUserProfileState extends ConsumerState<_EditUserProfile> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController middleNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    middleNameController.dispose();
    addressController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userInfo = ref.watch(loginMechProvider);

    ref.listen(loginMechProvider, (previous, next) {
      if (!next.isLoading && next.hasError) {
        var snackBar = customSnackBar(errorBuilder(next.error));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        return;
      }
      if (next.value?.success != null) {
        var snackBar = customSnackBar("Updated successfully");
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });

    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      body: CustomScrollView(
        // padding: EdgeInsets.all(10),
        slivers: [
          const SliverAppBar.medium(
            title: Text(
              "Update your details",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            sliver: SliverList(
              delegate: SliverChildListDelegate.fixed([
                TextFieldWithColumn(
                  hint: "First Name",
                  controller: firstNameController,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldWithColumn(
                  hint: "Last Name",
                  controller: lastNameController,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldWithColumn(
                  hint: "Middle Name",
                  controller: middleNameController,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldWithColumn(
                  hint: "Address",
                  controller: addressController,
                ),
                // SliverToBoxAdapter(child: const Spacer()),
                /*SizedBox(
                  height: 500,
                ),*/
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.35,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: TextButton(
                      onPressed: () async {
                        /*await ref
                      .read(loginMechProvider.notifier)
                      .login("ebspcxrbg@emltmp.com", "1234567");*/
                        await ref
                            .read(loginMechProvider.notifier)
                            .updateDetails(
                                firstNameController.text.trim(),
                                lastNameController.text.trim(),
                                middleNameController.text.trim(),
                                addressController.text.trim());
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: const Color(
                              0xffFFA500), //const Color(0xffFFCC00),
                          fixedSize: const Size.fromHeight(50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24))),
                      child: Center(
                        child: userInfo.isLoading
                            ? const CircularProgressIndicator(
                                backgroundColor: Colors.white,
                                color: Color(0xffFFA500),
                              )
                            : const Text(
                                "Done",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                      )),
                ),
                // SizedBox(height: 10),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class _ChangePassword extends ConsumerStatefulWidget {
  const _ChangePassword({super.key});

  @override
  ConsumerState<_ChangePassword> createState() => __ChangePasswordState();
}

class __ChangePasswordState extends ConsumerState<_ChangePassword> {
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final userInfo = ref.watch(loginMechProvider);

    ref.listen(loginMechProvider, (previous, next) {
      if (!next.isLoading && next.hasError) {
        var snackBar = customSnackBar(errorBuilder(next.error));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        return;
      }
      if (next.value?.success != null && !next.isLoading) {
        var snackBar = customSnackBar("Changed successfully");

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });

    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      /* appBar: AppBar(
        title: const Text("Change your password"),
      ),*/
      body: CustomScrollView(
        // padding: EdgeInsets.all(10),
        slivers: [
          const SliverAppBar.medium(
            title: Text(
              "Change your password",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            sliver: SliverList(
              delegate: SliverChildListDelegate.fixed(
                [
                  TextFieldWithColumn(
                    hint: "Old Password",
                    controller: oldPasswordController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldWithColumn(
                    hint: "New Password",
                    controller: newPasswordController,
                  ),
                  /*    const SizedBox(
                    height: 10,
                  ),*/
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.55,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: TextButton(
                        onPressed: () async {
                          /*await ref
                                .read(loginMechProvider.notifier)
                                .login("ebspcxrbg@emltmp.com", "1234567");*/
                          await ref
                              .read(loginMechProvider.notifier)
                              .changePassword(
                                oldPasswordController.text.trim(),
                                newPasswordController.text.trim(),
                              );
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: const Color(
                                0xffFFA500), //const Color(0xffFFCC00),
                            fixedSize: const Size.fromHeight(50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24))),
                        child: Center(
                          child: userInfo.isLoading
                              ? const CircularProgressIndicator(
                                  backgroundColor: Colors.white,
                                  color: Color(0xffFFA500),
                                )
                              : const Text(
                                  "Update",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
