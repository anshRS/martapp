import 'package:client/providers/user_provider.dart';
import 'package:client/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BelowAppBar extends StatelessWidget {
  const BelowAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Container(
      decoration: const BoxDecoration(
        gradient: UtilityClass.appBarGradient,
      ),
      // color: Colors.black,
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
                text: 'Hello, ',
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
                children: [
                  TextSpan(
                    text: user.name,
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.w600
                    ),
                  )
                ]),
          ),
        ],
      ),
    );
  }
}
