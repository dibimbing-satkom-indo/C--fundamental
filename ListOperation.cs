using System;
using System.Collections.Generic;
using System.Linq;

class ListOperations
{
    public static void Run()
    {
        List<string> students = new List<string>
        { "Alice", "Bob", "Charlie", "Diana" };

        // Menambah elemen
        students.Add("Eve");
        students.Insert(1, "Frank"); // Insert di index 1

        // Mengakses elemen
        Console.WriteLine($"Student pertama: {students[0]}");
        Console.WriteLine($"Jumlah students: {students.Count}");

        // Mencari elemen
        bool hasAlice = students.Contains("Alice");
        int indexOfBob = students.IndexOf("Bob");

        // Menghapus elemen
        students.Remove("Charlie");
        students.RemoveAt(0); // Hapus index 0

        // Iterasi dengan for loop
        Console.WriteLine("\nDaftar students setelah modifikasi:");
        for (int i = 0; i < students.Count; i++)
        {
            Console.WriteLine($"{i + 1}. {students[i]}");
        }

        // Menggunakan LINQ
        var studentsStartingWithA = students.Where(s => s.StartsWith("A")).ToList();
        var sortedStudents = students.OrderBy(s => s).ToList();
    }
}