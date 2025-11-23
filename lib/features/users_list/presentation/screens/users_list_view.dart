import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../resources/resources.dart';

class UsersListView extends StatefulWidget {
  const UsersListView({Key? key}) : super(key: key);

  @override
  State<UsersListView> createState() => _UsersListViewState();
}

class _UsersListViewState extends State<UsersListView> {
  List<UserModel> emailList = [
    UserModel(email: 'john.doe@example.com', isVerified: true),
    UserModel(email: 'jane.smith@example.com', isVerified: false),
    UserModel(email: 'bob.wilson@example.com', isVerified: true),
    UserModel(email: 'alice.brown@example.com', isVerified: false),
    UserModel(email: 'charlie.davis@example.com', isVerified: false),
  ];

  void toggleVerification(int index) {
    setState(() {
      emailList[index].isVerified = !emailList[index].isVerified;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: DataTable(
                decoration: BoxDecoration(gradient: R.colors.greenGradient),
                border: TableBorder.all(color: Colors.grey.shade300, width: 1),
                columns: [
                  DataColumn(
                    columnWidth: FixedColumnWidth(62.w),
                    label: Text(
                      'Email Address',
                      style: R.textStyles.nunito(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Status',
                      style: R.textStyles.nunito(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Action',
                      style: R.textStyles.nunito(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
                rows: emailList.asMap().entries.map((entry) {
                  int index = entry.key;
                  UserModel data = entry.value;

                  return DataRow(
                    cells: [
                      DataCell(
                        Text(
                          data.email,
                          style: R.textStyles.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: R.colors.white,
                          ),
                        ),
                      ),
                      DataCell(
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: data.isVerified
                                ? Colors.green.shade100
                                : Colors.orange.shade100,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            data.isVerified ? 'Verified' : 'Unverified',
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
                      DataCell(
                        ElevatedButton(
                          onPressed: () => toggleVerification(index),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: data.isVerified
                                ? Colors.red
                                : Colors.green,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                          ),
                          child: Text(
                            data.isVerified ? 'Unverify' : 'Verify',
                            style: R.textStyles.poppins(
                              color: R.colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
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
    );
  }
}

class UserModel {
  String email;
  bool isVerified;

  UserModel({required this.email, required this.isVerified});
}
