import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'learn_page.dart';
import '../widgets/custom_button.dart';

// Task 6: App with two pages and navigation
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _animationController.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Language App'),
        backgroundColor: Colors.blue,
        elevation: 2,
      ),
      body: FadeTransition(
        opacity: _animationController,
        child: _selectedIndex == 0 
            ? HomeContent(isTablet: isTablet) 
            : LearnPage(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Learn',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  final bool isTablet;
  
  const HomeContent({super.key, required this.isTablet});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Second Activity Task 1: Three Text widgets in Row with equal spacing
          Container(
            padding: EdgeInsets.all(isTablet ? 24 : 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Learn', style: TextStyle(fontSize: isTablet ? 22 : 18)),
                Text('Practice', style: TextStyle(fontSize: isTablet ? 22 : 18)),
                Text('Master', style: TextStyle(fontSize: isTablet ? 22 : 18)),
              ],
            ),
          ),

          // Second Activity Task 2: Two buttons in Column, centered
          Container(
            padding: EdgeInsets.all(isTablet ? 24 : 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomButton(
                  text: 'Start Learning',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LearnPage()),
                    );
                  },
                ),
                const SizedBox(height: 16),
                CustomButton(
                  text: 'View Progress',
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Progress feature coming soon!')),
                    );
                  },
                ),
              ],
            ),
          ),

          // Second Activity Task 3: Container with padding, margin, background color
          Container(
            margin: EdgeInsets.all(isTablet ? 24 : 16),
            padding: EdgeInsets.all(isTablet ? 28 : 20),
            decoration: BoxDecoration(
              color: Colors.blue.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'Welcome to Sign Language Learning!',
              style: TextStyle(fontSize: isTablet ? 20 : 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),

          // Second Activity Task 4: Profile card layout
          ProfileCard(isTablet: isTablet),

          // Second Activity Task 5: Responsive layout with Expanded
          Container(
            padding: EdgeInsets.all(isTablet ? 24 : 16),
            height: isTablet ? 120 : 100,
            child: Row(
              children: [
                Expanded(
                  child: InteractiveContainer(
                    color: Colors.orange.shade200,
                    text: 'Lessons',
                    margin: const EdgeInsets.only(right: 8),
                  ),
                ),
                Expanded(
                  child: InteractiveContainer(
                    color: Colors.green.shade200,
                    text: 'Practice',
                    margin: const EdgeInsets.only(left: 8),
                  ),
                ),
              ],
            ),
          ),

          // Second Activity Task 7: Stack layout
          StackLayoutWidget(isTablet: isTablet),

          // Second Activity Task 8: Flexible in Column
          FlexibleLayoutWidget(isTablet: isTablet),

          InteractiveChatBubbleWidget(isTablet: isTablet),

          // Second Activity Task 10: Row and Column grid-like layout
          GridLikeLayout(isTablet: isTablet),
        ],
      ),
    );
  }
}

class InteractiveContainer extends StatefulWidget {
  final Color color;
  final String text;
  final EdgeInsets margin;

  const InteractiveContainer({
    super.key,
    required this.color,
    required this.text,
    required this.margin,
  });

  @override
  State<InteractiveContainer> createState() => _InteractiveContainerState();
}

class _InteractiveContainerState extends State<InteractiveContainer> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${widget.text} tapped!')),
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: widget.margin,
        decoration: BoxDecoration(
          color: _isPressed ? widget.color.withOpacity(0.7) : widget.color,
          borderRadius: BorderRadius.circular(8),
          boxShadow: _isPressed ? [] : [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            widget.text,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

// Second Activity Task 4: Profile card layout
class ProfileCard extends StatelessWidget {
  final bool isTablet;
  
  const ProfileCard({super.key, required this.isTablet});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(isTablet ? 24 : 16),
      padding: EdgeInsets.all(isTablet ? 20 : 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: isTablet ? 40 : 30,
                backgroundColor: Colors.blue.shade200,
                child: Icon(Icons.person, size: isTablet ? 45 : 35, color: Colors.white),
              ),
              SizedBox(width: isTablet ? 20 : 16),
              Text(
                'John Doe',
                style: TextStyle(fontSize: isTablet ? 24 : 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: isTablet ? 16 : 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Level: Beginner', style: TextStyle(fontSize: isTablet ? 16 : 14)),
              SizedBox(height: isTablet ? 6 : 4),
              Text('Lessons Completed: 5', style: TextStyle(fontSize: isTablet ? 16 : 14)),
              SizedBox(height: isTablet ? 6 : 4),
              Text('Current Streak: 3 days', style: TextStyle(fontSize: isTablet ? 16 : 14)),
            ],
          ),
        ],
      ),
    );
  }
}

// Second Activity Task 7: Stack layout
class StackLayoutWidget extends StatelessWidget {
  final bool isTablet;
  
  const StackLayoutWidget({super.key, required this.isTablet});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(isTablet ? 24 : 16),
      height: isTablet ? 250 : 200,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade300, Colors.purple.shade300],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: FloatingActionButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Add new lesson!')),
                );
              },
              child: const Icon(Icons.add),
            ),
          ),
          Center(
            child: Text(
              'Featured Lesson',
              style: TextStyle(
                color: Colors.white,
                fontSize: isTablet ? 28 : 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Second Activity Task 8: Flexible in Column
class FlexibleLayoutWidget extends StatelessWidget {
  final bool isTablet;
  
  const FlexibleLayoutWidget({super.key, required this.isTablet});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(isTablet ? 24 : 16),
      height: isTablet ? 250 : 200,
      child: Column(
        children: [
          Flexible(
            flex: 2,
            child: Container(
              margin: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                color: Colors.teal.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  'Alphabet Signs',
                  style: TextStyle(fontSize: isTablet ? 18 : 16),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.only(top: 8),
              decoration: BoxDecoration(
                color: Colors.amber.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  'Numbers',
                  style: TextStyle(fontSize: isTablet ? 18 : 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InteractiveChatBubbleWidget extends StatefulWidget {
  final bool isTablet;
  
  const InteractiveChatBubbleWidget({super.key, required this.isTablet});

  @override
  State<InteractiveChatBubbleWidget> createState() => _InteractiveChatBubbleWidgetState();
}

class _InteractiveChatBubbleWidgetState extends State<InteractiveChatBubbleWidget> {
  final TextEditingController _messageController = TextEditingController();
  final List<ChatMessage> _messages = [
    ChatMessage(text: 'How do I sign "Hello"?', isUser: true),
    ChatMessage(text: 'Wave your hand!', isUser: false),
  ];

  void _sendMessage() {
    if (_messageController.text.trim().isNotEmpty) {
      setState(() {
        _messages.add(ChatMessage(text: _messageController.text, isUser: true));
        _messageController.clear();
      });
      
      // Simulate response
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          _messages.add(ChatMessage(
            text: 'Great question! Let me help you with that.',
            isUser: false,
          ));
        });
      });
    }
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(widget.isTablet ? 24 : 16),
      padding: EdgeInsets.all(widget.isTablet ? 20 : 16),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Chat Assistant',
            style: TextStyle(
              fontSize: widget.isTablet ? 20 : 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          ..._messages.map((message) => ChatBubble(
            message: message,
            isTablet: widget.isTablet,
          )),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _messageController,
                  decoration: InputDecoration(
                    hintText: 'Ask a question...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: widget.isTablet ? 20 : 16,
                      vertical: widget.isTablet ? 14 : 12,
                    ),
                  ),
                  onSubmitted: (_) => _sendMessage(),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                onPressed: _sendMessage,
                icon: const Icon(Icons.send),
                color: Colors.blue,
                iconSize: widget.isTablet ? 32 : 28,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ChatMessage {
  final String text;
  final bool isUser;

  ChatMessage({required this.text, required this.isUser});
}

class ChatBubble extends StatelessWidget {
  final ChatMessage message;
  final bool isTablet;

  const ChatBubble({super.key, required this.message, required this.isTablet});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(isTablet ? 14 : 12),
        margin: EdgeInsets.only(
          bottom: 8,
          left: message.isUser ? 50 : 0,
          right: message.isUser ? 0 : 50,
        ),
        decoration: BoxDecoration(
          color: message.isUser ? Colors.blue.shade300 : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          message.text,
          style: TextStyle(
            color: message.isUser ? Colors.white : Colors.black87,
            fontSize: isTablet ? 16 : 14,
          ),
        ),
      ),
    );
  }
}

// Second Activity Task 10: Row and Column grid-like layout
class GridLikeLayout extends StatelessWidget {
  final bool isTablet;
  
  const GridLikeLayout({super.key, required this.isTablet});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(isTablet ? 24 : 16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: AnimatedGridItem(
                  color: Colors.red.shade200,
                  text: 'A',
                  height: isTablet ? 100 : 80,
                ),
              ),
              Expanded(
                child: AnimatedGridItem(
                  color: Colors.green.shade200,
                  text: 'B',
                  height: isTablet ? 100 : 80,
                ),
              ),
              Expanded(
                child: AnimatedGridItem(
                  color: Colors.blue.shade200,
                  text: 'C',
                  height: isTablet ? 100 : 80,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: AnimatedGridItem(
                  color: Colors.yellow.shade200,
                  text: 'D',
                  height: isTablet ? 100 : 80,
                ),
              ),
              Expanded(
                child: AnimatedGridItem(
                  color: Colors.purple.shade200,
                  text: 'E',
                  height: isTablet ? 100 : 80,
                ),
              ),
              Expanded(
                child: AnimatedGridItem(
                  color: Colors.orange.shade200,
                  text: 'F',
                  height: isTablet ? 100 : 80,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AnimatedGridItem extends StatefulWidget {
  final Color color;
  final String text;
  final double height;

  const AnimatedGridItem({
    super.key,
    required this.color,
    required this.text,
    required this.height,
  });

  @override
  State<AnimatedGridItem> createState() => _AnimatedGridItemState();
}

class _AnimatedGridItemState extends State<AnimatedGridItem> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() => _isTapped = !_isTapped);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Letter ${widget.text} selected!'),
            duration: const Duration(milliseconds: 500),
          ),
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: widget.height,
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(8),
          border: _isTapped ? Border.all(color: Colors.black, width: 3) : null,
        ),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: _isTapped ? 24 : 20,
              fontWeight: _isTapped ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
