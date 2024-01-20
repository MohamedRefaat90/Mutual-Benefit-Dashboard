import 'package:flutter/material.dart';

import '../../../model/DashboardMenu.dart';
import 'Components/welcomeAdmin.dart';


class drawer extends StatelessWidget {
  const drawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        color: Colors.black87,
        child: Column(
          children: [
            welcomeAdmin(),
            const Divider(
              thickness: 2,
              indent: 50,
              endIndent: 50,
              color: Colors.white,
            ),
            SizedBox(
              height: 500,
              child: ListView.builder(
                itemCount: menuList.length,
                itemBuilder: (context, index) => MaterialButton(
                  onPressed: menuList[index]["press"],
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Icon(
                        menuList[index]["icon"],
                        color: Colors.white,
                      ),
                      const SizedBox(width: 20),
                      Text(menuList[index]["lable"],
                          style: const TextStyle(color: Colors.white))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
