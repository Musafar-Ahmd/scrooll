📱 Flutter ListWheelScrollView UI Examples
This project contains two beautifully designed scrollable UIs using Flutter's ListWheelScrollView widget:

🛍️ 1. Product List Wheel
Description:
This screen displays a list of products in a scrollable vertical wheel format. Each product card contains:

Product Image
Title
Price
Static quantity

Features:
Smooth scroll animation to the next item using FloatingActionButton
Stylish card UI with elevation and rounded corners
Uses a FixedExtentScrollController for controlled scrolling

Preview:
(You can replace this with a screenshot if available)

Code Highlight:
ListWheelScrollView.useDelegate(
  controller: _scrollController,
  itemExtent: 280,
  childDelegate: ListWheelChildBuilderDelegate(
    childCount: products.length,
    builder: (context, index) => _buildProductCard(products[index]),
  ),
)

🗓️ 2. Custom Calendar Wheel
Description:
This screen mimics a calendar by displaying upcoming dates (up to 365 days) in a scrollable wheel. Each date card includes:

Day of the week
Full date
A subtle message (“Tap to select”)

Features:
Scrolls through a year's worth of future dates

Elegant material cards with day and date formatting

intl package is used for formatting (DateFormat)

dependencies:
  flutter:
    sdk: flutter
  intl: ^0.18.0


ListWheelScrollView.useDelegate(
  controller: _dateController,
  itemExtent: 120,
  childDelegate: ListWheelChildBuilderDelegate(
    childCount: totalDays,
    builder: (context, index) {
      DateTime date = startDate.add(Duration(days: index));
      return _buildDateCard(date);
    },
  ),
)

📂 Project Structure
bash
Copy
Edit
lib/
├── home_screen.dart       # Product List UI
├── calendar_screen.dart   # Custom Calendar UI

💡 Tips
You can customize the appearance by changing itemExtent, perspective, or using your own data model.
Extend the calendar with event markers or selectable dates.
