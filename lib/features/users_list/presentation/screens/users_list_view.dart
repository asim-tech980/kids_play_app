import 'package:flutter/material.dart';
import 'package:kids_app_admin_panel/resources/textstyles.dart';
import 'package:kids_app_admin_panel/services/services.dart';
import 'package:sizer/sizer.dart';

import '../../../../resources/resources.dart';

class UsersListView extends StatefulWidget {
  const UsersListView({Key? key}) : super(key: key);

  @override
  State<UsersListView> createState() => _UsersListViewState();
}

class _UsersListViewState extends State<UsersListView> {
  List<UserModel> emailList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUsers(); // Fetch users on screen load
  }

  /// 🔹 Fetch users from Firestore
  void fetchUsers() async {
    List<Map<String, dynamic>> users = await Services.getUsers();

    setState(() {
      emailList = users.map((data) {
        return UserModel(
          id: data["id"],
          email: data["email"],
          isVerified: data["isVerified"],
        );
      }).toList();
      isLoading = false;
    });
  }

  /// 🔹 Toggle verification UI & update Firestore
  void toggleVerification(int index) async {
    bool newVerificationStatus = !emailList[index].isVerified;

    setState(() {
      emailList[index].isVerified = newVerificationStatus;
    });

    await changeUserVerification(emailList[index].id, newVerificationStatus);
  }

  /// 🔹 Firestore update
  Future<void> changeUserVerification(String userId, bool newValue) async {
    bool result = await Services.updateUserVerification(userId, newValue);
    if (result) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Verification updated successfully")),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Failed to update")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
                backgroundColor: R.colors.primaryColor2,
                color: R.colors.primaryColor,
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 3.h),
                Padding(
                  padding: const EdgeInsets.only(left: 35),
                  child: ShaderMask(
                    shaderCallback: (bounds) =>
                        LinearGradient(
                          colors: [
                            R.colors.primaryColor2,
                            R.colors.primaryColor,
                          ], // 60% opacity on second color
                          begin: Alignment.topRight,
                          end: Alignment.bottomCenter,
                        ).createShader(
                          Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                        ),
                    child: Text(
                      "User Records & Managements".toUpperCase(),
                      style: R.textStyles
                          .nunito(
                            fontWeight: FontWeight.w600,
                            fontSize: AdaptiveTextSize.getAdaptiveTextSize(25),
                          )
                          .copyWith(
                            color: R.colors.white,
                          ), // Use white as placeholder
                    ),
                  ),
                ),

                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: DataTable(
                            decoration: BoxDecoration(
                              gradient: R.colors.greenGradient,
                            ),
                            border: TableBorder.all(
                              color: Colors.grey.shade300,
                              width: 1,
                            ),
                            columns: [
                              DataColumn(
                                label: _columnTitle('Email Address'),
                                headingRowAlignment: MainAxisAlignment.center,
                                columnWidth: FixedColumnWidth(50.w),
                              ),
                              DataColumn(
                                label: _columnTitle('Status'),
                                headingRowAlignment: MainAxisAlignment.center,
                                columnWidth: FixedColumnWidth(15.w),
                              ),
                              DataColumn(
                                label: _columnTitle('Action'),
                                headingRowAlignment: MainAxisAlignment.center,
                                columnWidth: FixedColumnWidth(15.w),
                              ),
                            ],
                            rows: emailList.asMap().entries.map((entry) {
                              int index = entry.key;
                              UserModel data = entry.value;

                              return DataRow(
                                cells: [
                                  DataCell(
                                    Text(data.email, style: _tableText()),
                                  ),
                                  DataCell(
                                    Center(
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 6,
                                        ),
                                        decoration: BoxDecoration(
                                          color: data.isVerified
                                              ? Colors.green.shade100
                                              : Colors.orange.shade100,
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        child: Text(
                                          data.isVerified
                                              ? 'Verified'
                                              : 'Unverified',
                                          style: R.textStyles.poppins(
                                            color: data.isVerified
                                                ? Colors.green.shade800
                                                : Colors.orange.shade800,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: ElevatedButton(
                                        onPressed: () =>
                                            toggleVerification(index),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: data.isVerified
                                              ? Colors.red
                                              : Colors.green,
                                          foregroundColor: Colors.white,
                                        ),
                                        child: Text(
                                          data.isVerified
                                              ? 'Unverify'
                                              : 'Verify',
                                          style: _buttonText(),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  // 🔹 Reusable styles
  TextStyle _tableText() => R.textStyles.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: R.colors.white,
  );

  TextStyle _buttonText() => R.textStyles.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: R.colors.white,
  );

  Widget _columnTitle(String title) => Text(
    title,
    style: R.textStyles.nunito(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      color: Colors.white,
    ),
  );
}

class UserModel {
  final String id;
  final String email;
  bool isVerified;

  UserModel({required this.id, required this.email, required this.isVerified});
}
