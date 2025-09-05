public class Student
{
    // Properties (Fields)
    public string Name;
    public int Age;
    public string StudentId;
    private double gpa; // Private field

    // Constructor
    public Student(string name, int age, string studentId)
    {
        Name = name;
        Age = age;
        StudentId = studentId;
        gpa = 0.0;
    }

    // Methods
    public void DisplayInfo()
    {
        Console.WriteLine($"Name: {Name}");
        Console.WriteLine($"Age: {Age}");
        Console.WriteLine($"Student ID: {StudentId}");
        Console.WriteLine($"GPA: {gpa:F2}");
    }

    public void SetGPA(double newGpa)
    {
        if (newGpa >= 0.0 && newGpa <= 4.0)
        {
            gpa = newGpa;
        }
        else
        {
            Console.WriteLine("GPA harus antara 0.0 dan 4.0");
        }
    }

    public double GetGPA()
    {
        return gpa;
    }
}