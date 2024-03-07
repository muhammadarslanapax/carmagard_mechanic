import 'package:carmagard/Constant/utility_function.dart';
import 'package:carmagard/Provider/loginprovider.dart';
import 'package:carmagard/View/Chat/chat_listview.dart';
import 'package:carmagard/View/Drawer/profile.dart';
import 'package:carmagard/View/Drawer/support.dart';
import 'package:carmagard/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:carmagard/View/Handymen/accountdetail.dart';
import 'package:carmagard/View/style.dart';

class UserDrawerView extends ConsumerStatefulWidget {
  const UserDrawerView({Key? key}) : super(key: key);

  @override
  ConsumerState<UserDrawerView> createState() => _UserDrawerViewState();
}

class _UserDrawerViewState extends ConsumerState<UserDrawerView> with Ui {
  @override
  Widget build(BuildContext context) {
    final userInfo = ref.watch(loginMechProvider);
    // print(userInfo.value);
    return Drawer(
      backgroundColor: Colors.grey.shade200,
      child: SafeArea(
        child: CustomScrollView(
          // padding: EdgeInsets.zero,
          slivers: [
            const SliverToBoxAdapter(
              child: _MiniProfile(),
            ),
            const SliverToBoxAdapter(
              child: Divider(
                color: Colors.transparent,
              ),
            ),
            SliverToBoxAdapter(
              // hasScrollBody: false,
              child: Container(
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    ListTile(
                      onTap: () => nav(context, const ProfileView()),
                      leading: SvgPicture.asset(Assets.assetsAccountCircle),
                      title: input(black, 16, "Profile", w400),
                      trailing: SvgPicture.asset(Assets.assetsArrowBackIos),
                    ),
                    ListTile(
                      onTap: () => nav(context, const ChatList()),
                      leading: const Icon(Icons.chat_outlined),
                      title: input(black, 16, "Chat", w400),
                      trailing: SvgPicture.asset(Assets.assetsArrowBackIos),
                    ),
                    /*      ListTile(
                      leading: SvgPicture.asset(Assets.assetsNotifications),
                      title: input(black, 16, "Notification", w400),
                      trailing: SvgPicture.asset(Assets.assetsArrowBackIos),
                    ),
                    ListTile(
                      leading: SvgPicture.asset(Assets.assetsBook),
                      title: input(black, 16, "Bookings", w400),
                      trailing: SvgPicture.asset(Assets.assetsArrowBackIos),
                    ),
                    ListTile(
                      onTap: () => nav(context, const AccountDetail()),
                      leading: SvgPicture.asset(Assets.assetsHelp),
                      title: input(black, 16, "Account Details", w400),
                      trailing: SvgPicture.asset(Assets.assetsArrowBackIos),
                    ),*/
                    ListTile(
                      onTap: () => nav(context, const SupportTab()),
                      leading: SvgPicture.asset(Assets.assetsHelp),
                      title: input(black, 16, "Support", w400),
                      trailing: SvgPicture.asset(Assets.assetsArrowBackIos),
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Divider(
                color: Colors.transparent,
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Container(
                decoration: BoxDecoration(
                    color: white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _MiniProfile extends ConsumerWidget {
  const _MiniProfile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfo = ref.watch(loginMechProvider);

    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const ProfileView()));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 120,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              child: SvgPicture.asset(
                'assets/user1.svg',
                height: 100,
                width: 100,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userInfo.value?.mechanic?.mechanicName ?? "",
                  style: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 18),
                ),
                const Text(
                  "View profile",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.green,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
