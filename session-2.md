# Materi Presentasi C#
## Functions & Collections, Class & Object, Inheritance & Polymorphism

---

## **BAGIAN 1: FUNCTIONS & COLLECTIONS (60 menit)**

### **1.1 Functions (Methods) dalam C#**

#### **Pengertian Method**
Method adalah blok kode yang dapat dieksekusi dan dipanggil berulang kali. Method membantu mengorganisir kode dan menghindari pengulangan.

#### **Struktur Method**
```csharp
[access_modifier] [static] return_type MethodName(parameters)
{
    // Method body
    return value; // jika ada return type
}
```

#### **Contoh Method Sederhana**
```csharp
using System;

class Program
{
    // Method tanpa return value (void)
    public static void SayHello(string name)
    {
        Console.WriteLine($"Hello, {name}!");
    }
    
    // Method dengan return value
    public static int AddNumbers(int a, int b)
    {
        return a + b;
    }
    
    // Method dengan parameter default
    public static void PrintMessage(string message = "Default message")
    {
        Console.WriteLine(message);
    }
    
    static void Main(string[] args)
    {
        SayHello("Alice");
        
        int result = AddNumbers(5, 10);
        Console.WriteLine($"Hasil penjumlahan: {result}");
        
        PrintMessage(); // Menggunakan nilai default
        PrintMessage("Custom message");
    }
}
```

#### **Method Overloading**
```csharp
public class Calculator
{
    public int Add(int a, int b)
    {
        return a + b;
    }
    
    public double Add(double a, double b)
    {
        return a + b;
    }
    
    public int Add(int a, int b, int c)
    {
        return a + b + c;
    }
}
```

### **1.2 Collections - List<T>**

#### **Pengertian List**
List<T> adalah koleksi yang dapat berubah ukurannya (dynamic array) dan menyimpan elemen dengan tipe data yang sama.

#### **Deklarasi dan Inisialisasi List**
```csharp
using System;
using System.Collections.Generic;

class ListExample
{
    static void Main()
    {
        // Deklarasi List
        List<string> fruits = new List<string>();
        
        // Inisialisasi dengan nilai
        List<int> numbers = new List<int> { 1, 2, 3, 4, 5 };
        
        // Menambah elemen
        fruits.Add("Apple");
        fruits.Add("Banana");
        fruits.Add("Orange");
        
        Console.WriteLine("Daftar buah:");
        foreach (string fruit in fruits)
        {
            Console.WriteLine($"- {fruit}");
        }
    }
}
```

#### **Operasi List yang Umum**
```csharp
using System;
using System.Collections.Generic;
using System.Linq;

class ListOperations
{
    static void Main()
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
```

### **1.3 Collections - Dictionary<TKey, TValue>**

#### **Pengertian Dictionary**
Dictionary adalah koleksi yang menyimpan pasangan key-value. Setiap key harus unik dan digunakan untuk mengakses value yang terkait.

#### **Contoh Penggunaan Dictionary**
```csharp
using System;
using System.Collections.Generic;

class DictionaryExample
{
    static void Main()
    {
        // Deklarasi Dictionary
        Dictionary<string, int> studentGrades = new Dictionary<string, int>();
        
        // Menambah data
        studentGrades.Add("Alice", 95);
        studentGrades.Add("Bob", 87);
        studentGrades["Charlie"] = 92; // Alternatif cara menambah
        
        // Inisialisasi dengan data
        Dictionary<string, string> countries = new Dictionary<string, string>
        {
            {"ID", "Indonesia"},
            {"US", "United States"},
            {"JP", "Japan"},
            {"SG", "Singapore"}
        };
        
        // Mengakses value
        Console.WriteLine($"Nilai Alice: {studentGrades["Alice"]}");
        
        // Cek apakah key ada
        if (studentGrades.ContainsKey("Bob"))
        {
            Console.WriteLine($"Nilai Bob: {studentGrades["Bob"]}");
        }
        
        // Iterasi Dictionary
        Console.WriteLine("\nSemua nilai siswa:");
        foreach (KeyValuePair<string, int> kvp in studentGrades)
        {
            Console.WriteLine($"{kvp.Key}: {kvp.Value}");
        }
        
        // Atau menggunakan var
        foreach (var item in countries)
        {
            Console.WriteLine($"{item.Key} = {item.Value}");
        }
    }
}
```

#### **Dictionary Operations Lanjutan**
```csharp
using System;
using System.Collections.Generic;

class AdvancedDictionary
{
    static void Main()
    {
        Dictionary<int, string> employees = new Dictionary<int, string>
        {
            {101, "John Doe"},
            {102, "Jane Smith"},
            {103, "Bob Johnson"}
        };
        
        // TryGetValue - cara aman mengakses value
        if (employees.TryGetValue(101, out string employeeName))
        {
            Console.WriteLine($"Employee 101: {employeeName}");
        }
        
        // Update value
        employees[102] = "Jane Doe"; // Mengubah nama Jane Smith
        
        // Remove
        employees.Remove(103);
        
        // Keys dan Values collection
        Console.WriteLine("Employee IDs:");
        foreach (int id in employees.Keys)
        {
            Console.WriteLine($"ID: {id}");
        }
        
        Console.WriteLine("Employee Names:");
        foreach (string name in employees.Values)
        {
            Console.WriteLine($"Name: {name}");
        }
        
        Console.WriteLine($"Total employees: {employees.Count}");
    }
}
```

### **Latihan Functions & Collections**
```csharp
using System;
using System.Collections.Generic;
using System.Linq;

class Exercise1
{
    // Method untuk menghitung rata-rata dari List
    public static double CalculateAverage(List<int> numbers)
    {
        if (numbers.Count == 0) return 0;
        return numbers.Sum() / (double)numbers.Count;
    }
    
    // Method untuk mencari mahasiswa berdasarkan NIM
    public static string FindStudent(Dictionary<string, string> students, string nim)
    {
        return students.TryGetValue(nim, out string name) ? name : "Mahasiswa tidak ditemukan";
    }
    
    static void Main()
    {
        // Test List operations
        List<int> scores = new List<int> { 85, 90, 78, 92, 88 };
        Console.WriteLine($"Rata-rata nilai: {CalculateAverage(scores):F2}");
        
        // Test Dictionary operations
        Dictionary<string, string> mahasiswa = new Dictionary<string, string>
        {
            {"12345", "Alice"},
            {"12346", "Bob"},
            {"12347", "Charlie"}
        };
        
        Console.WriteLine(FindStudent(mahasiswa, "12345"));
        Console.WriteLine(FindStudent(mahasiswa, "99999"));
    }
}
```

---

## **BAGIAN 2: CLASS & OBJECT (60 menit)**

### **2.1 Konsep Class dan Object**

#### **Pengertian Class**
Class adalah template atau blueprint untuk membuat object. Class mendefinisikan properties (atribut) dan methods (behavior) yang dimiliki oleh object.

#### **Pengertian Object**
Object adalah instance dari class. Object memiliki state (nilai properties) dan behavior (methods yang dapat dipanggil).

### **2.2 Membuat Class Sederhana**

```csharp
using System;

// Definisi class
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

class Program
{
    static void Main()
    {
        // Membuat object dari class Student
        Student student1 = new Student("Alice", 20, "12345");
        Student student2 = new Student("Bob", 21, "12346");
        
        // Menggunakan methods
        student1.SetGPA(3.5);
        student1.DisplayInfo();
        
        Console.WriteLine();
        
        student2.SetGPA(3.8);
        student2.DisplayInfo();
    }
}
```

### **2.3 Properties dengan Get/Set**

```csharp
using System;

public class BankAccount
{
    private string accountNumber;
    private double balance;
    private string ownerName;
    
    // Properties dengan full syntax
    public string AccountNumber
    {
        get { return accountNumber; }
        set 
        { 
            if (!string.IsNullOrEmpty(value))
                accountNumber = value;
        }
    }
    
    // Auto-implemented property
    public string OwnerName { get; set; }
    
    // Property dengan validation
    public double Balance
    {
        get { return balance; }
        private set // Hanya class ini yang bisa set
        { 
            if (value >= 0)
                balance = value;
        }
    }
    
    // Constructor
    public BankAccount(string ownerName, string accountNumber, double initialBalance = 0)
    {
        OwnerName = ownerName;
        AccountNumber = accountNumber;
        Balance = initialBalance;
    }
    
    // Methods
    public void Deposit(double amount)
    {
        if (amount > 0)
        {
            Balance += amount;
            Console.WriteLine($"Deposited {amount:C}. New balance: {Balance:C}");
        }
        else
        {
            Console.WriteLine("Jumlah deposit harus positif");
        }
    }
    
    public bool Withdraw(double amount)
    {
        if (amount > 0 && amount <= Balance)
        {
            Balance -= amount;
            Console.WriteLine($"Withdrew {amount:C}. New balance: {Balance:C}");
            return true;
        }
        else
        {
            Console.WriteLine("Penarikan tidak valid atau saldo tidak cukup");
            return false;
        }
    }
    
    public void DisplayAccountInfo()
    {
        Console.WriteLine($"Account: {AccountNumber}");
        Console.WriteLine($"Owner: {OwnerName}");
        Console.WriteLine($"Balance: {Balance:C}");
    }
}

class Program
{
    static void Main()
    {
        BankAccount account = new BankAccount("John Doe", "ACC001", 1000);
        
        account.DisplayAccountInfo();
        Console.WriteLine();
        
        account.Deposit(500);
        account.Withdraw(200);
        account.Withdraw(2000); // Akan gagal
        
        Console.WriteLine();
        account.DisplayAccountInfo();
    }
}
```

### **2.4 Static Members**

```csharp
using System;

public class MathHelper
{
    // Static field
    public static readonly double PI = 3.14159265359;
    private static int operationCount = 0;
    
    // Static property
    public static int OperationCount 
    { 
        get { return operationCount; } 
    }
    
    // Static methods
    public static double CircleArea(double radius)
    {
        operationCount++;
        return PI * radius * radius;
    }
    
    public static double CircleCircumference(double radius)
    {
        operationCount++;
        return 2 * PI * radius;
    }
    
    public static int Max(int a, int b)
    {
        operationCount++;
        return (a > b) ? a : b;
    }
    
    public static void ResetOperationCount()
    {
        operationCount = 0;
    }
}

class Program
{
    static void Main()
    {
        // Memanggil static method tanpa membuat object
        double area = MathHelper.CircleArea(5);
        double circumference = MathHelper.CircleCircumference(5);
        int maxValue = MathHelper.Max(10, 20);
        
        Console.WriteLine($"Area: {area:F2}");
        Console.WriteLine($"Circumference: {circumference:F2}");
        Console.WriteLine($"Max value: {maxValue}");
        Console.WriteLine($"Operations performed: {MathHelper.OperationCount}");
        
        // Mengakses static field
        Console.WriteLine($"PI value: {MathHelper.PI}");
    }
}
```

### **2.5 Constructor Overloading**

```csharp
using System;

public class Rectangle
{
    public double Width { get; set; }
    public double Height { get; set; }
    
    // Default constructor
    public Rectangle()
    {
        Width = 1;
        Height = 1;
    }
    
    // Constructor dengan satu parameter (square)
    public Rectangle(double side)
    {
        Width = side;
        Height = side;
    }
    
    // Constructor dengan dua parameter
    public Rectangle(double width, double height)
    {
        Width = width;
        Height = height;
    }
    
    // Copy constructor
    public Rectangle(Rectangle other)
    {
        Width = other.Width;
        Height = other.Height;
    }
    
    public double CalculateArea()
    {
        return Width * Height;
    }
    
    public double CalculatePerimeter()
    {
        return 2 * (Width + Height);
    }
    
    public void DisplayInfo()
    {
        Console.WriteLine($"Rectangle: {Width} x {Height}");
        Console.WriteLine($"Area: {CalculateArea()}");
        Console.WriteLine($"Perimeter: {CalculatePerimeter()}");
    }
}

class Program
{
    static void Main()
    {
        // Menggunakan berbagai constructor
        Rectangle rect1 = new Rectangle(); // Default
        Rectangle rect2 = new Rectangle(5); // Square
        Rectangle rect3 = new Rectangle(4, 6); // Rectangle
        Rectangle rect4 = new Rectangle(rect3); // Copy
        
        Console.WriteLine("Rectangle 1 (default):");
        rect1.DisplayInfo();
        
        Console.WriteLine("\nRectangle 2 (square):");
        rect2.DisplayInfo();
        
        Console.WriteLine("\nRectangle 3:");
        rect3.DisplayInfo();
        
        Console.WriteLine("\nRectangle 4 (copy of rect3):");
        rect4.DisplayInfo();
    }
}
```

---

## **BAGIAN 3: INHERITANCE & POLYMORPHISM (60 menit)**

### **3.1 Inheritance (Pewarisan)**

#### **Konsep Inheritance**
Inheritance memungkinkan class baru (derived class/child class) untuk mewarisi properties dan methods dari class yang sudah ada (base class/parent class).

```csharp
using System;

// Base class (Parent class)
public class Animal
{
    public string Name { get; set; }
    public int Age { get; set; }
    
    public Animal(string name, int age)
    {
        Name = name;
        Age = age;
    }
    
    public virtual void MakeSound()
    {
        Console.WriteLine($"{Name} makes a sound");
    }
    
    public void Sleep()
    {
        Console.WriteLine($"{Name} is sleeping");
    }
    
    public virtual void DisplayInfo()
    {
        Console.WriteLine($"Name: {Name}, Age: {Age}");
    }
}

// Derived class (Child class)
public class Dog : Animal
{
    public string Breed { get; set; }
    
    // Constructor memanggil base constructor
    public Dog(string name, int age, string breed) : base(name, age)
    {
        Breed = breed;
    }
    
    // Override method dari parent class
    public override void MakeSound()
    {
        Console.WriteLine($"{Name} says: Woof! Woof!");
    }
    
    // Method khusus untuk Dog
    public void Fetch()
    {
        Console.WriteLine($"{Name} is fetching the ball");
    }
    
    public override void DisplayInfo()
    {
        base.DisplayInfo(); // Memanggil method parent
        Console.WriteLine($"Breed: {Breed}");
    }
}

public class Cat : Animal
{
    public bool IsIndoor { get; set; }
    
    public Cat(string name, int age, bool isIndoor) : base(name, age)
    {
        IsIndoor = isIndoor;
    }
    
    public override void MakeSound()
    {
        Console.WriteLine($"{Name} says: Meow!");
    }
    
    public void Climb()
    {
        Console.WriteLine($"{Name} is climbing");
    }
    
    public override void DisplayInfo()
    {
        base.DisplayInfo();
        Console.WriteLine($"Indoor cat: {IsIndoor}");
    }
}

class Program
{
    static void Main()
    {
        Dog dog = new Dog("Buddy", 3, "Golden Retriever");
        Cat cat = new Cat("Whiskers", 2, true);
        
        Console.WriteLine("=== Dog Info ===");
        dog.DisplayInfo();
        dog.MakeSound();
        dog.Fetch();
        dog.Sleep(); // Method dari parent class
        
        Console.WriteLine("\n=== Cat Info ===");
        cat.DisplayInfo();
        cat.MakeSound();
        cat.Climb();
        cat.Sleep(); // Method dari parent class
    }
}
```

### **3.2 Abstract Classes**

```csharp
using System;

// Abstract class tidak bisa diinstansiasi langsung
public abstract class Shape
{
    public string Color { get; set; }
    
    protected Shape(string color)
    {
        Color = color;
    }
    
    // Abstract method harus diimplementasi oleh derived class
    public abstract double CalculateArea();
    public abstract double CalculatePerimeter();
    
    // Concrete method dapat digunakan oleh derived class
    public void DisplayColor()
    {
        Console.WriteLine($"Color: {Color}");
    }
    
    // Virtual method dapat di-override
    public virtual void DisplayInfo()
    {
        Console.WriteLine($"This is a {Color} shape");
    }
}

public class Circle : Shape
{
    public double Radius { get; set; }
    
    public Circle(string color, double radius) : base(color)
    {
        Radius = radius;
    }
    
    public override double CalculateArea()
    {
        return Math.PI * Radius * Radius;
    }
    
    public override double CalculatePerimeter()
    {
        return 2 * Math.PI * Radius;
    }
    
    public override void DisplayInfo()
    {
        Console.WriteLine($"Circle - Radius: {Radius}");
        base.DisplayInfo();
        Console.WriteLine($"Area: {CalculateArea():F2}");
        Console.WriteLine($"Perimeter: {CalculatePerimeter():F2}");
    }
}

public class Rectangle : Shape
{
    public double Width { get; set; }
    public double Height { get; set; }
    
    public Rectangle(string color, double width, double height) : base(color)
    {
        Width = width;
        Height = height;
    }
    
    public override double CalculateArea()
    {
        return Width * Height;
    }
    
    public override double CalculatePerimeter()
    {
        return 2 * (Width + Height);
    }
    
    public override void DisplayInfo()
    {
        Console.WriteLine($"Rectangle - Width: {Width}, Height: {Height}");
        base.DisplayInfo();
        Console.WriteLine($"Area: {CalculateArea():F2}");
        Console.WriteLine($"Perimeter: {CalculatePerimeter():F2}");
    }
}

class Program
{
    static void Main()
    {
        // Shape shape = new Shape("Red"); // Error! Abstract class tidak bisa diinstansiasi
        
        Circle circle = new Circle("Red", 5);
        Rectangle rectangle = new Rectangle("Blue", 4, 6);
        
        Console.WriteLine("=== Circle ===");
        circle.DisplayInfo();
        
        Console.WriteLine("\n=== Rectangle ===");
        rectangle.DisplayInfo();
    }
}
```

### **3.3 Polymorphism**

#### **Method Polymorphism dengan Virtual/Override**
```csharp
using System;
using System.Collections.Generic;

public class Employee
{
    public string Name { get; set; }
    public int EmployeeId { get; set; }
    protected double baseSalary;
    
    public Employee(string name, int employeeId, double baseSalary)
    {
        Name = name;
        EmployeeId = employeeId;
        this.baseSalary = baseSalary;
    }
    
    public virtual double CalculateSalary()
    {
        return baseSalary;
    }
    
    public virtual void DisplayEmployeeInfo()
    {
        Console.WriteLine($"Employee: {Name} (ID: {EmployeeId})");
        Console.WriteLine($"Salary: {CalculateSalary():C}");
    }
}

public class Manager : Employee
{
    public double Bonus { get; set; }
    
    public Manager(string name, int employeeId, double baseSalary, double bonus) 
        : base(name, employeeId, baseSalary)
    {
        Bonus = bonus;
    }
    
    public override double CalculateSalary()
    {
        return baseSalary + Bonus;
    }
    
    public override void DisplayEmployeeInfo()
    {
        Console.WriteLine($"Manager: {Name} (ID: {EmployeeId})");
        Console.WriteLine($"Base Salary: {baseSalary:C}");
        Console.WriteLine($"Bonus: {Bonus:C}");
        Console.WriteLine($"Total Salary: {CalculateSalary():C}");
    }
}

public class SalesEmployee : Employee
{
    public double CommissionRate { get; set; }
    public double SalesAmount { get; set; }
    
    public SalesEmployee(string name, int employeeId, double baseSalary, 
                        double commissionRate) : base(name, employeeId, baseSalary)
    {
        CommissionRate = commissionRate;
        SalesAmount = 0;
    }
    
    public void RecordSale(double amount)
    {
        SalesAmount += amount;
    }
    
    public override double CalculateSalary()
    {
        return baseSalary + (SalesAmount * CommissionRate);
    }
    
    public override void DisplayEmployeeInfo()
    {
        Console.WriteLine($"Sales Employee: {Name} (ID: {EmployeeId})");
        Console.WriteLine($"Base Salary: {baseSalary:C}");
        Console.WriteLine($"Sales Amount: {SalesAmount:C}");
        Console.WriteLine($"Commission Rate: {CommissionRate:P}");
        Console.WriteLine($"Total Salary: {CalculateSalary():C}");
    }
}

class Program
{
    static void Main()
    {
        // Polymorphism - satu list untuk berbagai tipe employee
        List<Employee> employees = new List<Employee>();
        
        employees.Add(new Employee("John Doe", 101, 50000));
        employees.Add(new Manager("Jane Smith", 201, 70000, 15000));
        
        SalesEmployee salesEmp = new SalesEmployee("Bob Johnson", 301, 40000, 0.05);
        salesEmp.RecordSale(100000);
        employees.Add(salesEmp);
        
        // Polymorphic behavior - method yang dipanggil tergantung tipe object
        Console.WriteLine("=== Employee Salary Report ===");
        foreach (Employee emp in employees)
        {
            emp.DisplayEmployeeInfo(); // Akan memanggil method yang sesuai
            Console.WriteLine();
        }
        
        // Menghitung total salary
        double totalSalary = 0;
        foreach (Employee emp in employees)
        {
            totalSalary += emp.CalculateSalary();
        }
        Console.WriteLine($"Total Company Salary: {totalSalary:C}");
    }
}
```

### **3.4 Interface**

```csharp
using System;
using System.Collections.Generic;

// Interface mendefinisikan kontrak yang harus diimplementasi
public interface IVehicle
{
    string Brand { get; set; }
    string Model { get; set; }
    
    void Start();
    void Stop();
    double CalculateFuelConsumption(double distance);
}

// Interface untuk kemampuan terbang
public interface IFlyable
{
    double MaxAltitude { get; }
    void TakeOff();
    void Land();
}

public class Car : IVehicle
{
    public string Brand { get; set; }
    public string Model { get; set; }
    public double FuelEfficiency { get; set; } // km per liter
    
    public Car(string brand, string model, double fuelEfficiency)
    {
        Brand = brand;
        Model = model;
        FuelEfficiency = fuelEfficiency;
    }
    
    public void Start()
    {
        Console.WriteLine($"{Brand} {Model} engine started");
    }
    
    public void Stop()
    {
        Console.WriteLine($"{Brand} {Model} engine stopped");
    }
    
    public double CalculateFuelConsumption(double distance)
    {
        return distance / FuelEfficiency;
    }
    
    public void Honk()
    {
        Console.WriteLine($"{Brand} {Model}: Beep! Beep!");
    }
}

public class Airplane : IVehicle, IFlyable
{
    public string Brand { get; set; }
    public string Model { get; set; }
    public double MaxAltitude { get; private set; }
    public double FuelConsumptionRate { get; set; } // liters per km
    
    public Airplane(string brand, string model, double maxAltitude, double fuelConsumptionRate)
    {
        Brand = brand;
        Model = model;
        MaxAltitude = maxAltitude;
        FuelConsumptionRate = fuelConsumptionRate;
    }
    
    public void Start()
    {
        Console.WriteLine($"{Brand} {Model} engines started");
    }
    
    public void Stop()
    {
        Console.WriteLine($"{Brand} {Model} engines stopped");
    }
    
    public double CalculateFuelConsumption(double distance)
    {
        return distance * FuelConsumptionRate;
    }
    
    public void TakeOff()
    {
        Console.WriteLine($"{Brand} {Model} is taking off");
    }
    
    public void Land()
    {
        Console.WriteLine($"{Brand} {Model} is landing");
    }
}

class Program
{
    static void Main()
    {
        // Polymorphism dengan interface
        List<IVehicle> vehicles = new List<IVehicle>();
        
        vehicles.Add(new Car("Toyota", "Camry", 15.5));
        vehicles.Add(new Car("Honda", "Civic", 18.2));
        vehicles.Add(new Airplane("Boeing", "737", 12000, 3.5));
        
        Console.WriteLine("=== Vehicle Operations ===");
        foreach (IVehicle vehicle in vehicles)
        {
            Console.WriteLine($"\n{vehicle.Brand} {vehicle.Model}:");
            vehicle.Start();
            
            double fuel = vehicle.CalculateFuelConsumption(100);
            Console.WriteLine($"Fuel consumption for 100km: {fuel:F2} liters");
            
            vehicle.Stop();
            
            // Type checking untuk interface
            if (vehicle is IFlyable flyableVehicle)
            {
                Console.WriteLine($"This vehicle can fly up to {flyableVehicle.MaxAltitude}m");
                flyableVehicle.TakeOff();
                flyableVehicle.Land();
            }
        }
        
        // Interface sebagai parameter
        Console.WriteLine("\n=== Testing Vehicle Method ===");
        TestVehicle(new Car("BMW", "X5", 12.5));
    }
    
    // Method yang menerima interface sebagai parameter
    static void TestVehicle(IVehicle vehicle)
    {
        Console.WriteLine($"Testing {vehicle.Brand} {vehicle.Model}");
        vehicle.Start();
        Console.WriteLine($"Fuel needed for 50km: {vehicle.CalculateFuelConsumption(50):F2} liters");
        vehicle.Stop();
    }
}
```

### **3.5 Contoh Komprehensif: Sistem Manajemen Perpustakaan**

```csharp
using System;
using System.Collections.Generic;
using System.Linq;

// Base class untuk semua item di perpustakaan
public abstract class LibraryItem
{
    public string Id { get; set; }
    public string Title { get; set; }
    public DateTime DateAdded { get; set; }
    public bool IsAvailable { get; set; }
    
    protected LibraryItem(string id, string title)
    {
        Id = id;
        Title = title;
        DateAdded = DateTime.Now;
        IsAvailable = true;
    }
    
    public abstract void DisplayDetails();
    public abstract double CalculateLateFee(int daysLate);
    
    public virtual void CheckOut()
    {
        if (IsAvailable)
        {
            IsAvailable = false;
            Console.WriteLine($"{Title} has been checked out.");
        }
        else
        {
            Console.WriteLine($"{Title} is not available.");
        }
    }
    
    public virtual void Return()
    {
        IsAvailable = true;
        Console.WriteLine($"{Title} has been returned.");
    }
}

// Interface untuk item yang bisa dipinjam
public interface IBorrowable
{
    DateTime DueDate { get; set; }
    string BorrowerName { get; set; }
    void SetDueDate(int borrowPeriodDays);
}

// Interface untuk media digital
public interface IDigitalMedia
{
    double FileSizeMB { get; }
    string Format { get; }
    void Download();
}

public class Book : LibraryItem, IBorrowable
{
    public string Author { get; set; }
    public string ISBN { get; set; }
    public int PageCount { get; set; }
    public DateTime DueDate { get; set; }
    public string BorrowerName { get; set; }
    
    public Book(string id, string title, string author, string isbn, int pageCount) 
        : base(id, title)
    {
        Author = author;
        ISBN = isbn;
        PageCount = pageCount;
    }
    
    public override void DisplayDetails()
    {
        Console.WriteLine($"Book: {Title}");
        Console.WriteLine($"Author: {Author}");
        Console.WriteLine($"ISBN: {ISBN}");
        Console.WriteLine($"Pages: {PageCount}");
        Console.WriteLine($"Available: {IsAvailable}");
        if (!IsAvailable)
        {
            Console.WriteLine($"Borrowed by: {BorrowerName}");
            Console.WriteLine($"Due date: {DueDate:yyyy-MM-dd}");
        }
    }
    
    public override double CalculateLateFee(int daysLate)
    {
        return daysLate * 0.5; // $0.5 per day
    }
    
    public void SetDueDate(int borrowPeriodDays)
    {
        DueDate = DateTime.Now.AddDays(borrowPeriodDays);
    }
    
    public override void CheckOut()
    {
        base.CheckOut();
        SetDueDate(14); // 2 weeks default
    }
}

public class DVD : LibraryItem, IBorrowable
{
    public string Director { get; set; }
    public int RuntimeMinutes { get; set; }
    public string Genre { get; set; }
    public DateTime DueDate { get; set; }
    public string BorrowerName { get; set; }
    
    public DVD(string id, string title, string director, int runtime, string genre) 
        : base(id, title)
    {
        Director = director;
        RuntimeMinutes = runtime;
        Genre = genre;
    }
    
    public override void DisplayDetails()
    {
        Console.WriteLine($"DVD: {Title}");
        Console.WriteLine($"Director: {Director}");
        Console.WriteLine($"Runtime: {RuntimeMinutes} minutes");
        Console.WriteLine($"Genre: {Genre}");
        Console.WriteLine($"Available: {IsAvailable}");
        if (!IsAvailable)
        {
            Console.WriteLine($"Borrowed by: {BorrowerName}");
            Console.WriteLine($"Due date: {DueDate:yyyy-MM-dd}");
        }
    }
    
    public override double CalculateLateFee(int daysLate)
    {
        return daysLate * 1.0; // $1.0 per day
    }
    
    public void SetDueDate(int borrowPeriodDays)
    {
        DueDate = DateTime.Now.AddDays(borrowPeriodDays);
    }
    
    public override void CheckOut()
    {
        base.CheckOut();
        SetDueDate(7); // 1 week for DVDs
    }
}

public class EBook : LibraryItem, IDigitalMedia
{
    public string Author { get; set; }
    public double FileSizeMB { get; private set; }
    public string Format { get; private set; }
    public int DownloadCount { get; private set; }
    
    public EBook(string id, string title, string author, double fileSizeMB, string format) 
        : base(id, title)
    {
        Author = author;
        FileSizeMB = fileSizeMB;
        Format = format;
        DownloadCount = 0;
    }
    
    public override void DisplayDetails()
    {
        Console.WriteLine($"E-Book: {Title}");
        Console.WriteLine($"Author: {Author}");
        Console.WriteLine($"File Size: {FileSizeMB} MB");
        Console.WriteLine($"Format: {Format}");
        Console.WriteLine($"Download Count: {DownloadCount}");
    }
    
    public override double CalculateLateFee(int daysLate)
    {
        return 0; // No late fees for digital items
    }
    
    public void Download()
    {
        DownloadCount++;
        Console.WriteLine($"{Title} has been downloaded. Total downloads: {DownloadCount}");
    }
    
    public override void CheckOut()
    {
        Download(); // E-books are "checked out" by downloading
    }
    
    public override void Return()
    {
        Console.WriteLine($"E-Book {Title} doesn't need to be returned.");
    }
}

public class Library
{
    private List<LibraryItem> items;
    private Dictionary<string, string> borrowedItems; // ItemId -> BorrowerName
    
    public Library()
    {
        items = new List<LibraryItem>();
        borrowedItems = new Dictionary<string, string>();
    }
    
    public void AddItem(LibraryItem item)
    {
        items.Add(item);
        Console.WriteLine($"Added {item.Title} to the library.");
    }
    
    public void DisplayAllItems()
    {
        Console.WriteLine("=== Library Catalog ===");
        foreach (var item in items)
        {
            item.DisplayDetails();
            Console.WriteLine();
        }
    }
    
    public void CheckOutItem(string itemId, string borrowerName)
    {
        var item = items.FirstOrDefault(i => i.Id == itemId);
        if (item != null)
        {
            if (item is IBorrowable borrowableItem && item.IsAvailable)
            {
                borrowableItem.BorrowerName = borrowerName;
                borrowedItems[itemId] = borrowerName;
            }
            item.CheckOut();
        }
        else
        {
            Console.WriteLine("Item not found.");
        }
    }
    
    public void ReturnItem(string itemId)
    {
        var item = items.FirstOrDefault(i => i.Id == itemId);
        if (item != null)
        {
            item.Return();
            if (borrowedItems.ContainsKey(itemId))
            {
                borrowedItems.Remove(itemId);
            }
        }
        else
        {
            Console.WriteLine("Item not found.");
        }
    }
    
    public void DisplayAvailableItems()
    {
        Console.WriteLine("=== Available Items ===");
        var availableItems = items.Where(i => i.IsAvailable).ToList();
        foreach (var item in availableItems)
        {
            Console.WriteLine($"{item.Id}: {item.Title}");
        }
    }
    
    public void DisplayBorrowedItems()
    {
        Console.WriteLine("=== Borrowed Items ===");
        foreach (var kvp in borrowedItems)
        {
            var item = items.FirstOrDefault(i => i.Id == kvp.Key);
            if (item != null)
            {
                Console.WriteLine($"{item.Title} - Borrowed by: {kvp.Value}");
            }
        }
    }
    
    public double CalculateLateFees()
    {
        double totalFees = 0;
        foreach (var item in items.Where(i => !i.IsAvailable && i is IBorrowable))
        {
            var borrowableItem = (IBorrowable)item;
            if (DateTime.Now > borrowableItem.DueDate)
            {
                int daysLate = (DateTime.Now - borrowableItem.DueDate).Days;
                double fee = item.CalculateLateFee(daysLate);
                totalFees += fee;
                Console.WriteLine($"{item.Title} - {daysLate} days late - Fee: ${fee:F2}");
            }
        }
        return totalFees;
    }
}

class Program
{
    static void Main()
    {
        Library library = new Library();
        
        // Menambah berbagai jenis item
        library.AddItem(new Book("B001", "The Great Gatsby", "F. Scott Fitzgerald", "978-0-7432-7356-5", 180));
        library.AddItem(new Book("B002", "To Kill a Mockingbird", "Harper Lee", "978-0-06-112008-4", 281));
        library.AddItem(new DVD("D001", "Inception", "Christopher Nolan", 148, "Sci-Fi"));
        library.AddItem(new EBook("E001", "1984", "George Orwell", 2.5, "PDF"));
        
        Console.WriteLine("\n=== Initial Library State ===");
        library.DisplayAvailableItems();
        
        Console.WriteLine("\n=== Checking Out Items ===");
        library.CheckOutItem("B001", "John Doe");
        library.CheckOutItem("D001", "Jane Smith");
        library.CheckOutItem("E001", "Bob Johnson");
        
        Console.WriteLine("\n=== Current Borrowed Items ===");
        library.DisplayBorrowedItems();
        
        Console.WriteLine("\n=== Available Items After Checkout ===");
        library.DisplayAvailableItems();
        
        Console.WriteLine("\n=== Returning an Item ===");
        library.ReturnItem("B001");
        
        Console.WriteLine("\n=== Final Library Catalog ===");
        library.DisplayAllItems();
        
        Console.WriteLine("=== Late Fees Calculation ===");
        double totalFees = library.CalculateLateFees();
        Console.WriteLine($"Total late fees: ${totalFees:F2}");
    }
}
```

---

## **RANGKUMAN DAN TIPS PRAKTIS**

### **Functions & Collections - Key Points:**
1. **Methods** membantu mengorganisir kode dan menghindari pengulangan
2. **List<T>** cocok untuk koleksi yang berurutan dan dapat berubah
3. **Dictionary<TKey, TValue>** efisien untuk pencarian berdasarkan key
4. Selalu gunakan **TryGetValue()** untuk akses Dictionary yang aman
5. LINQ menyediakan operasi powerful untuk koleksi

### **Class & Object - Key Points:**
1. **Encapsulation**: Gunakan private fields dengan public properties
2. **Constructor overloading** memberikan fleksibilitas dalam pembuatan object
3. **Static members** milik class, bukan instance
4. Properties dengan get/set memberikan kontrol akses yang lebih baik

### **Inheritance & Polymorphism - Key Points:**
1. **Inheritance** memungkinkan code reuse dan hierarki class
2. **Abstract classes** mendefinisikan template yang harus diimplementasi
3. **Interfaces** mendefinisikan kontrak tanpa implementasi
4. **Polymorphism** memungkinkan satu interface untuk berbagai implementasi
5. **Virtual/Override** memungkinkan method polymorphism

### **Best Practices:**
- Gunakan naming convention yang konsisten (PascalCase untuk class/method, camelCase untuk variables)
- Selalu validasi input dalam methods
- Preferred composition over inheritance ketika memungkinkan
- Gunakan interfaces untuk loose coupling
- Implement proper error handling dengan try-catch

### **Latihan Akhir**
Cobalah membuat sistem sederhana yang menggunakan semua konsep:
1. Buat class Student dengan properties dan methods
2. Gunakan List untuk menyimpan students
3. Buat interface IAssessable dengan method CalculateGrade()
4. Implement inheritance dengan UndergraduateStudent dan GraduateStudent
5. Gunakan polymorphism untuk menghitung grade berbeda untuk setiap tipe student

Materi ini dirancang untuk 3 jam pembelajaran dengan 60 menit per bagian, termasuk waktu untuk praktik dan diskusi.