import "dart:io";

List<List<String>> data = [
  ['1', '2', '3'],
  ['4', '5', '6'],
  ['7', '8', '9'],
];

void printData() {
  print("");
  for (var i = 0; i < 3; i++) {
    print("${data[i][0]} | ${data[i][1]} | ${data[i][2]}");
    print("--+---+--");
  }
}

String convertPlayer(player) {
  if (player == 0) {
    return "X";
  }
  else {
    return "O";
  }
}

bool checkWinner(player) {
  var check = convertPlayer(player);
  for (var i = 0; i < 3; i++) {
    if ((data[i][0] == check && data[i][1] == check && data[i][2] == check) ||
        (data[0][i] == check && data[1][i] == check && data[2][i] == check)) {
      return true;
    }
  }
  if ((data[0][0] == check && data[1][1] == check && data[2][2] == check) ||
      (data[0][2] == check && data[1][1] == check && data[2][0] == check)) {
    return true;
  }
  return false;
}

bool checkDraw() {
  for (var i = 0; i < 3; i++) {
    for (var j = 0; j < 3; j++) {
      if (data[i][j] != 'X' && data[i][j] != 'O') {
        return false;
      }
    }
  }
  return true;
}

void checkData(i, j, player) {
  if(data[i][j] == "X" || data[i][j] == "O") {
    print("Sudah terisi, silakan ulangi!");
    takeInp(player);
  }
  else {
    data[i][j] = convertPlayer(player);
  }
}

void readInp(inp, player) {
  switch(inp) {
    case '1':
      checkData(0, 0, player);
      break;
    case '2':
      checkData(0, 1, player);
      break;
    case '3':
      checkData(0, 2, player);
      break;
    case '4':
      checkData(1, 0, player);
      break;
    case '5':
      checkData(1, 1, player);
      break;
    case '6':
      checkData(1, 2, player);
      break;
    case '7':
      checkData(2, 0, player);
      break;
    case '8':
      checkData(2, 1, player);
      break;
    case '9':
      checkData(2, 2, player);
      break;
    default:
      print("Tidak valid, silakan ulangi!");
      takeInp(player);
  }
}

void takeInp(int player) {
  printData();
  stdout.write("Pemain ${player + 1} (${convertPlayer(player)}), pilih angka: ");
  String? inp = stdin.readLineSync();
  readInp(inp, player);
}

void playGame() {
  var play = true;
  var count = 0;
  while (play) {
    var player = count % 2;
    takeInp(player);
    if(checkWinner(player)) {
      printData();
      print("Yeayy, selamat pemain ${player + 1} (${convertPlayer(player)}) menang!!!!");
      play = false;
    }
    if (checkDraw()) {
      printData();
      print("Yahh, permainan seri!");
      play = false;
    }
    count++;
  }
}

void main() {
  print("====PERMAINAN TIC TAC TOE====");
  playGame();
}
