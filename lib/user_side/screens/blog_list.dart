import 'package:flutter/material.dart';
import '../../model/blog.dart';
import '../../web_admin_panel/services/firebase_service.dart';
import '../components/app_bar.dart';
import '../components/blog_container.dart';
import '../components/button.dart';
import '../components/constants.dart';
import '../components/drawer.dart';
import '../components/footer.dart';
import '../components/hash_tags_container.dart';
import '../components/line.dart';
import '../components/textss.dart';

class BlogList extends StatefulWidget {
  BlogList({super.key});

  @override
  State<BlogList> createState() => _BlogListState();
}

class _BlogListState extends State<BlogList> {
  final List<String> hashtags = [
    'Fashion',
    'Promo',
    'Policy',
    'Lookbook',
    'Year2021',
    'New'
  ];
  final FirebaseService _firebaseService = FirebaseService();
  late Future<List<Blog>> _futureBlogs;
  List<Blog> _displayedBlogs = [];
  List<Blog> _allBlogs = [];
  bool _isLoadingMore = false;
  int _blogsPerPage = 4; // Changed to load 4 more each time

  @override
  void initState() {
    super.initState();
    _futureBlogs = _firebaseService.fetchBlogs();
    _loadInitialBlogs();
  }

  Future<void> _loadInitialBlogs() async {
    try {
      final blogs = await _futureBlogs;
      setState(() {
        _allBlogs = blogs; // Store all blogs
        _displayedBlogs = blogs.take(3).toList(); // Display first 3 blogs
      });
    } catch (error) {
      // Handle errors if needed
    }
  }

  Future<void> _loadMoreBlogs() async {
    setState(() {
      _isLoadingMore = true;
    });

    try {
      final startIndex = _displayedBlogs.length;
      final endIndex = startIndex + _blogsPerPage;
      if (startIndex < _allBlogs.length) {
        setState(() {
          _displayedBlogs.addAll(
            _allBlogs.getRange(startIndex, endIndex.clamp(0, _allBlogs.length)),
          );
        });
      }
    } catch (error) {
      // Handle errors if needed
    } finally {
      setState(() {
        _isLoadingMore = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppbar,
      drawer: const MyTabbedDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            TextWidget(size: 22, text: blog, color: Colors.black,letterSpacing: 2),

            CustomPaint(
              size: const Size(250, 50), // Adjust size as needed
              painter: LineWithDiamondPainter(),
            ),
            SizedBox(
              height: 30, // Adjust height as needed
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: hashtags.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: HashTagsContainer(name: hashtags[index]),
                  );
                },
              ),
            ),
            _buildBlogList(),
            const SizedBox(height: 30),
            _isLoadingMore
                ? const CircularProgressIndicator()
                : Mybutton2(text: loadMore, onTap: _loadMoreBlogs),
            const SizedBox(height: 30),
            const Footer(),
          ],
        ),
      ),
    );
  }

  Widget _buildBlogList() {
    if (_displayedBlogs.isEmpty) {
      return const Center(child: Text(noBlogAvailable));
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _displayedBlogs.length,
      itemBuilder: (context, index) {
        final blog = _displayedBlogs[index];
        return BlogContainer(
          bgImage: blog.imageUrl,
          name: blog.tag,
        );
      },
    );
  }
}

