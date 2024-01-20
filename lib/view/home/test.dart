int main() {
  List<Map<String, dynamic>> menuList = [
    {
      "lable": "Dashboard",
      "icon": 10,
    },
    {
      "lable": "Manage Users",
      "icon": 3,
    },
    {
      "lable": "Manage Requests",
      "icon": 3,
    },
    {
      "lable": "Manage Orders",
      "icon": 5,
    },
    {
      "lable": "Manage Country",
      "icon": 3,
    },
    {
      "lable": "Manage Category",
      "icon": 4,
    },
    {
      "lable": "Manage Admin",
      "icon": 8,
    },
    {
      "lable": "Profile",
      "icon": 33,
    },
  ];
  print(menuList[7]['icon']);
  return 0;
}
