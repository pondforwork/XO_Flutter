import 'package:flutter/material.dart';

class PlayGame extends StatefulWidget {
  const PlayGame({Key? key}) : super(key: key);

  @override
  State<PlayGame> createState() => _PlayGameState();
}

class _PlayGameState extends State<PlayGame> {
  List<List<String>> board = [
    ['', '', ''],
    ['', '', ''],
    ['', '', ''],
  ];

  List<List<Color>> cellColors = [
    [Colors.blue, Colors.blue, Colors.blue],
    [Colors.blue, Colors.blue, Colors.blue],
    [Colors.blue, Colors.blue, Colors.blue],
  ];

  bool isXTurn = true; // true for X, false for O

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 200,
          ),
          Column(
            children: [
              Center(
                child: Text(
                  isXTurn ? "Turn X" : "Turn O",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Column(
            children: List.generate(3, (row) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (col) {
                  return GestureDetector(
                    onTap: () {
                      _onCellTap(row, col);
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.all(8),
                      color: cellColors[row][col],
                      child: Center(
                        child: Text(
                          board[row][col],
                          style: TextStyle(fontSize: 40, color: Colors.white),
                        ),
                      ),
                    ),
                  );
                }),
              );
            }),
          ),
        ],
      ),
    );
  }

  void _onCellTap(int row, int col) {
    if (board[row][col].isEmpty) {
      setState(() {
        board[row][col] = isXTurn ? 'X' : 'O';
        isXTurn = !isXTurn;
        cellColors[row][col] = isXTurn ? Colors.red : Colors.green;
        _checkForWin();
      });
    }
  }

  void _checkForWin() {
    // Check rows
    for (int i = 0; i < 3; i++) {
      if (board[i][0] == board[i][1] &&
          board[i][1] == board[i][2] &&
          board[i][0].isNotEmpty) {
        _showWinDialog(board[i][0]);
        return;
      }
    }

    // Check columns
    for (int i = 0; i < 3; i++) {
      if (board[0][i] == board[1][i] &&
          board[1][i] == board[2][i] &&
          board[0][i].isNotEmpty) {
        _showWinDialog(board[0][i]);
        return;
      }
    }

    // Check diagonals
    if (board[0][0] == board[1][1] &&
        board[1][1] == board[2][2] &&
        board[0][0].isNotEmpty) {
      _showWinDialog(board[0][0]);
      return;
    }

    if (board[0][2] == board[1][1] &&
        board[1][1] == board[2][0] &&
        board[0][2].isNotEmpty) {
      _showWinDialog(board[0][2]);
      return;
    }
  }

  void _showWinDialog(String winner) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Game Over'),
          content: Text('$winner wins!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _resetGame();
              },
              child: Text('Play Again'),
            ),
          ],
        );
      },
    );
  }

  void _resetGame() {
    setState(() {
      for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
          board[i][j] = '';
          cellColors[i][j] = Colors.blue;
        }
      }
      isXTurn = true;
    });
  }
}
