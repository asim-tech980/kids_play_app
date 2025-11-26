import 'package:cloud_firestore/cloud_firestore.dart';

import '../features/blogs/data/model/blogs_model.dart';

class Services {
  static Future<List<Map<String, dynamic>>> getUsers() async {
    try {
      final FirebaseFirestore _firestore = FirebaseFirestore.instance;

      QuerySnapshot snapshot = await _firestore.collection('users').get();

      return snapshot.docs.map((doc) {
        return {
          "id": doc.id,
          "email": doc['email'] ?? '',
          "isVerified": doc['isVerified'] ?? false,
        };
      }).toList();
    } catch (e) {
      print('Error fetching users: $e');
      return [];
    }
  }

  static Future<bool> updateUserVerification(
    String userId,
    bool isVerify,
  ) async {
    try {
      final FirebaseFirestore _firestore = FirebaseFirestore.instance;
      await _firestore.collection('users').doc(userId).update({
        'isVerified': isVerify, // 🔥 Only updating this field
      });
      return true;
    } catch (e) {
      print('Error updating verification: $e');
      return false;
    }
  }

  static Future<void> addBlog({
    required String title,
    required String description,
  }) async {
    try {
      final CollectionReference _blogsCollection = FirebaseFirestore.instance
          .collection('blogs');
      await _blogsCollection.add({'title': title, 'description': description});
    } catch (e) {
      throw Exception('Failed to add blog: $e');
    }
  }

  static Stream<List<BlogsModel>> getBlogs() {
    final CollectionReference _blogsCollection = FirebaseFirestore.instance
        .collection('blogs');
    return _blogsCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return BlogsModel(
          title: doc['title'] ?? '',
          description: doc['description'] ?? '',
        );
      }).toList();
    });
  }

  static Future<List<BlogsModel>> fetchBlogsOnce() async {
    try {
      final CollectionReference _blogsCollection = FirebaseFirestore.instance
          .collection('blogs');
      QuerySnapshot snapshot = await _blogsCollection.get();
      return snapshot.docs.map((doc) {
        return BlogsModel(
          title: doc['title'] ?? '',
          description: doc['description'] ?? '',
        );
      }).toList();
    } catch (e) {
      throw Exception('Failed to fetch blogs: $e');
    }
  }

  // Fetch all users
  static Stream<QuerySnapshot> getUsersStream() {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    return _firestore.collection('users').snapshots();
  }

  // Fetch all blogs
  static Stream<QuerySnapshot> getBlogsStream() {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    return _firestore.collection('blogs').snapshots();
  }

  // Fetch stats
  static Future<Map<String, int>> getStats() async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    var usersSnapshot = await _firestore.collection('users').get();
    var verifiedUsersSnapshot = await _firestore
        .collection('users')
        .where('isVerified', isEqualTo: true)
        .get();
    var unverifiedUsersSnapshot = await _firestore
        .collection('users')
        .where('isVerified', isEqualTo: false)
        .get();
    var blogsSnapshot = await _firestore.collection('blogs').get();

    return {
      'totalUsers': usersSnapshot.docs.length,
      'verifiedUsers': verifiedUsersSnapshot.docs.length,
      'unverifiedUsers': unverifiedUsersSnapshot.docs.length,
      'totalBlogs': blogsSnapshot.docs.length,
    };
  }
}
