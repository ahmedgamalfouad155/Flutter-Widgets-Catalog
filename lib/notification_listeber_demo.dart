import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class NotificationListenerDemo extends StatefulWidget {
  const NotificationListenerDemo({super.key});

  @override
  State<NotificationListenerDemo> createState() =>
      _NotificationListenerDemoState();
}

class _NotificationListenerDemoState extends State<NotificationListenerDemo> {
  bool _showAppBar = true;
  List<int> items = List.generate(20, (index) => index);
  bool _isLoading = false;
  String _scrollStatus = "Idle";

  Future<void> _loadMore() async {
    setState(() => _isLoading = true);

    await Future.delayed(const Duration(seconds: 2)); // محاكاة API

    final nextItems =
        List.generate(10, (index) => items.length + index); // عناصر جديدة
    setState(() {
      items.addAll(nextItems);
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _showAppBar
          ? AppBar(
              title: const Text("NotificationListener Demo"),
              backgroundColor: Colors.blue,
            )
          : null,
      body: Column(
        children: [
          Container(
            color: Colors.black12,
            padding: const EdgeInsets.all(8),
            child: Text("Scroll Status: $_scrollStatus"),
          ),
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                // ✅ 1- إخفاء/إظهار AppBar
                if (notification is UserScrollNotification) {
                  if (notification.direction == ScrollDirection.reverse) {
                    if (_showAppBar) {
                      setState(() {
                        _showAppBar = false;
                        _scrollStatus = "Scrolling Down (AppBar Hidden)";
                      });
                    }
                  } else if (notification.direction == ScrollDirection.forward) {
                    if (!_showAppBar) {
                      setState(() {
                        _showAppBar = true;
                        _scrollStatus = "Scrolling Up (AppBar Visible)";
                      });
                    }
                  }
                }

                // ✅ 2- Infinite Scroll
                if (notification is ScrollEndNotification &&
                    notification.metrics.pixels ==
                        notification.metrics.maxScrollExtent) {
                  if (!_isLoading) {
                    _scrollStatus = "Reached Bottom - Loading More...";
                    _loadMore();
                  }
                }

                // ✅ 3- عرض الحالة الحالية للـ Scroll
                if (notification is ScrollUpdateNotification) {
                  _scrollStatus =
                      "Scrolling... position: ${notification.metrics.pixels.toStringAsFixed(0)}";
                  setState(() {});
                }

                return true;
              },
              child: ListView.builder(
                itemCount: items.length + 1,
                itemBuilder: (context, index) {
                  if (index == items.length) {
                    return _isLoading
                        ? const Center(
                            child: Padding(
                              padding: EdgeInsets.all(16),
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : const SizedBox(); // فراغ لو مفيش تحميل
                  }
                  return ListTile(
                    leading: const Icon(Icons.task),
                    title: Text("Item ${items[index]}"),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
