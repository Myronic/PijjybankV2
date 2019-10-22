import 'package:flutter/cupertino.dart';
import 'package:pijjybank/models/category.dart';

class Transaction {
  bool type; //expense if true, else income
  String title;
  double amount;
  String author, party;
  Category category;
  String description;
  DateTime date;

  Transaction(
      {@required this.type,
      @required this.title,
      @required this.amount,
      @required this.author,
      @required this.party,
      @required this.category,
      this.description,
      @required this.date});
}

List<Transaction> transactions = [
  Transaction(
      type: true,
      title: "Party",
      amount: 300,
      author: "Jash",
      party: "Hitansh",
      category: categories[0],
      date: DateTime.now()),
  Transaction(
      type: true,
      title: "Party",
      amount: 300,
      author: "Jash",
      party: "Hitansh",
      category: categories[0],
      date: DateTime.now()),  //DateTime.now().subtract(Duration(days: 1)))
  Transaction(
      type: true,
      title: "birty",
      amount: 100,
      author: "Jash",
      party: "Chetan",
      category: categories[1],
      date: DateTime.now().subtract(Duration(days: 1))),
  Transaction(
      type: true,
      title: "Party",
      amount: 300,
      author: "Jash",
      party: "Hitansh",
      category: categories[0],
      date: DateTime.now()),
  Transaction(
      type: true,
      title: "Party",
      amount: 300,
      author: "Jash",
      party: "Hitansh",
      category: categories[0],
      date: DateTime.now().subtract(Duration(days: 2))),
  Transaction(
      type: true,
      title: "Party",
      amount: 300,
      author: "Jash",
      party: "Hitansh",
      category: categories[0],
      date: DateTime.now().subtract(Duration(days: 2))),
  Transaction(
      type: true,
      title: "Party",
      amount: 300,
      author: "Jash",
      party: "Hitansh",
      category: categories[0],
      date: DateTime.now().subtract(Duration(days: 2))),
  Transaction(
      type: true,
      title: "Party",
      amount: 300,
      author: "Jash",
      party: "Hitansh",
      category: categories[0],
      date: DateTime.now()),
  Transaction(
      type: true,
      title: "Party",
      amount: 300,
      author: "Jash",
      party: "Hitansh",
      category: categories[0],
      date: DateTime.now()),
  Transaction(
      type: true,
      title: "Party",
      amount: 300,
      author: "Jash",
      party: "Hitansh",
      category: categories[0],
      date: DateTime.now()),
  Transaction(
      type: true,
      title: "Party",
      amount: 300,
      author: "Jash",
      party: "Hitansh",
      category: categories[0],
      date: DateTime.now()),
  Transaction(
      type: true,
      title: "Party",
      amount: 300,
      author: "Jash",
      party: "Hitansh",
      category: categories[0],
      date: DateTime.now().subtract(Duration(days: 3))),
  Transaction(
      type: true,
      title: "Party",
      amount: 300,
      author: "Jash",
      party: "Hitansh",
      category: categories[0],
      date: DateTime.now().subtract(Duration(days: 3))),
  Transaction(
      type: true,
      title: "Party",
      amount: 300,
      author: "Jash",
      party: "Hitansh",
      category: categories[0],
      date: DateTime.now().subtract(Duration(days: 3))),
  Transaction(
      type: true,
      title: "Party",
      amount: 300,
      author: "Jash",
      party: "Hitansh",
      category: categories[0],
      date: DateTime.now().subtract(Duration(days: 3))),
  Transaction(
      type: true,
      title: "Party",
      amount: 300,
      author: "Jash",
      party: "Hitansh",
      category: categories[0],
      date: DateTime.now().subtract(Duration(days: 3))),
  Transaction(
      type: true,
      title: "Party",
      amount: 300,
      author: "Jash",
      party: "Hitansh",
      category: categories[0],
      date: DateTime.now()),
  Transaction(
      type: true,
      title: "Party",
      amount: 300,
      author: "Jash",
      party: "Hitansh",
      category: categories[0],
      date: DateTime.now().subtract(Duration(days: 5))),
];
