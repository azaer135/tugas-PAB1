import 'dart:io';
import 'kalkulator.dart';

void main() {
  Kalkulator kalkulator = Kalkulator();
  bool ulangi = true;

  print("=== KALKULATOR SEDERHANA ===");

  while (ulangi) {
    print("\nPilih operasi:");
    print("[1] Tambah");
    print("[2] Kurang");
    print("[3] Kali");
    print("[4] Bagi");

    print("Masukkan pilihan:");
    String? pilihan = stdin.readLineSync();

    if (pilihan != "1" &&
        pilihan != "2" &&
        pilihan != "3" &&
        pilihan != "4") {
      print("Pilihan tidak valid.");
      continue;
    }

    double angka1 = inputAngka("Masukkan bilangan pertama:");
    double angka2 = inputAngka("Masukkan bilangan kedua:");

    double hasil;

    if (pilihan == "1") {
      hasil = kalkulator.tambah(angka1, angka2);
    } else if (pilihan == "2") {
      hasil = kalkulator.kurang(angka1, angka2);
    } else if (pilihan == "3") {
      hasil = kalkulator.kali(angka1, angka2);
    } else {
      if (angka2 == 0) {
        print("Bilangan kedua tidak boleh 0 saat pembagian.");
        continue;
      }

      hasil = kalkulator.bagi(angka1, angka2);
    }

    print("Hasil: $hasil");

    print("\nApakah ingin menghitung lagi?");
    print("Ketik Y untuk Ya atau T untuk Tidak.");

    String? jawaban = stdin.readLineSync();

    if (jawaban?.toUpperCase() == "Y") {
      ulangi = true;
    } else {
      ulangi = false;
    }
  }

  print("\nProgram kalkulator selesai.");
}

double inputAngka(String pesan) {
  while (true) {
    print(pesan);
    String? input = stdin.readLineSync();

    double? angka = double.tryParse(input ?? "");

    if (angka != null) {
      return angka;
    }

    print("Input tidak valid. Silakan masukkan angka.");
  }
}
