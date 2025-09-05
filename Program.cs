using System;

class Program
{
    static void Main(string[] args)
    {
        #region test
        // var x = 5 + 2;
        // Console.WriteLine(x);

        // Console.WriteLine("=== Kalkulator Sederhana ===");
        // Console.Write("Masukkan angka pertama: ");
        // double angka1 = Convert.ToDouble(Console.ReadLine());

        // Console.Write("Masukkan angka kedua: ");
        // double angka2 = Convert.ToDouble(Console.ReadLine());

        // Console.WriteLine("Pilih operasi (+, -, *, /): ");
        // string operasi = Console.ReadLine();

        // double hasil = 0;

        // switch (operasi)
        // {
        //     case "+":
        //         hasil = angka1 + angka2;
        //         break;
        //     case "-":
        //         hasil = angka1 - angka2;
        //         break;
        //     case "*":
        //         hasil = angka1 * angka2;
        //         break;
        //     case "/":
        //         if (angka2 != 0)
        //             hasil = angka1 / angka2;
        //         else
        //             Console.WriteLine("Error: Pembagian dengan nol tidak diperbolehkan.");
        //         break;
        //     default:
        //         Console.WriteLine("Operasi tidak dikenali.");
        //         break;
        // }

        // Console.WriteLine($"Hasil: {hasil}");
        #endregion

        //ListOperations.Run();

        // var ages = new Dictionary<string, int>();
        // ages["bowo"] = 20;
        // ages["bowo"] = 50;
        // ages["bowo"] = 15;
        // ages["budi"] = 10;

        // foreach (var kvp in ages)
        // {
        //     Console.WriteLine($"{kvp.Key} : {kvp.Value}");
        // }

        var student1 = new Student("Alice", 20, "12345");
        var student2 = new Student("Bob", 21, "12346");

        student1.SetGPA(3.5);
        student1.DisplayInfo();

        Console.WriteLine();

        student2.SetGPA(3.8);
        student2.DisplayInfo();


    }

}

