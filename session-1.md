# C# Fundamentals
## Materi Presentasi Komprehensif

---

## 1. Pengantar dan Sejarah C#

### Apa itu C#?
C# (dibaca "C Sharp") adalah bahasa pemrograman modern, berorientasi objek yang dikembangkan oleh Microsoft sebagai bagian dari platform .NET Framework.

### Sejarah Singkat C#
- **2000**: Dikembangkan oleh Anders Hejlsberg di Microsoft
- **2002**: C# 1.0 dirilis bersamaan dengan .NET Framework 1.0
- **2003**: C# 1.2 dengan .NET Framework 1.1
- **2005**: C# 2.0 memperkenalkan Generics dan Nullable Types
- **2007**: C# 3.0 dengan LINQ dan Lambda Expressions
- **2010**: C# 4.0 dengan Dynamic Binding
- **2012**: C# 5.0 dengan Async/Await
- **2015**: C# 6.0 dengan String Interpolation
- **2017**: C# 7.0 dengan Pattern Matching
- **2019**: C# 8.0 dengan Nullable Reference Types
- **2020**: C# 9.0 dengan Records
- **2021**: C# 10.0 dengan Global Using
- **2022**: C# 11.0 dengan Raw String Literals
- **2023**: C# 12.0 dengan Primary Constructors

### Karakteristik Utama C#
- **Type-safe**: Mencegah error tipe data pada runtime
- **Object-oriented**: Mendukung encapsulation, inheritance, polymorphism
- **Memory-managed**: Garbage collection otomatis
- **Cross-platform**: Dapat berjalan di Windows, Linux, macOS
- **Strongly-typed**: Setiap variabel memiliki tipe data yang jelas

---

## 2. Kenapa Perlu Belajar C#?

### Keunggulan C#

#### 💼 **Peluang Karir Luas**
- Bahasa yang sangat diminati di industri
- Gaji programmer C# yang kompetitif
- Banyak lowongan kerja untuk .NET Developer

#### 🔧 **Versatilitas Tinggi**
- **Web Development**: ASP.NET Core untuk aplikasi web modern
- **Desktop Applications**: WPF, WinForms, MAUI
- **Mobile Development**: Xamarin untuk iOS dan Android
- **Game Development**: Unity menggunakan C#
- **Cloud Computing**: Azure, microservices
- **API Development**: Web API, minimal APIs

#### 📈 **Ekosistem yang Kuat**
- **NuGet Package Manager**: Ribuan library siap pakai
- **Visual Studio**: IDE terbaik untuk development
- **Dokumentasi Microsoft**: Sangat lengkap dan berkualitas
- **Community Support**: Komunitas developer yang besar

#### 🎯 **Kemudahan Pembelajaran**
- Sintaks yang clean dan mudah dipahami
- Strong typing membantu mencegah error
- IntelliSense yang excellent
- Debugging tools yang powerful

#### 🚀 **Performance dan Scalability**
- Kompilasi ke bytecode yang efisien
- Garbage collection yang optimized
- Mendukung asynchronous programming
- Cocok untuk aplikasi enterprise

### Mengapa C# Pilihan Tepat?
1. **Stabilitas**: Didukung langsung oleh Microsoft
2. **Evolusi Berkelanjutan**: Update reguler dengan fitur baru
3. **Cross-platform**: .NET Core/5+ berjalan di berbagai OS
4. **Open Source**: .NET Core adalah open source
5. **Integration**: Integrasi mudah dengan teknologi Microsoft lainnya

---

## 3. Setup Environment dan Cara Install C#

### Pilihan Development Environment

#### Option 1: Visual Studio (Recommended untuk Windows)
**Langkah Instalasi:**
1. Kunjungi https://visualstudio.microsoft.com/
2. Download Visual Studio Community (gratis)
3. Pilih workload:
   - **.NET desktop development**
   - **ASP.NET and web development**
   - **Mobile development with .NET**
4. Install dan restart komputer

#### Option 2: Visual Studio Code (Cross-platform)
**Langkah Instalasi:**
1. Download VS Code dari https://code.visualstudio.com/
2. Install .NET SDK dari https://dotnet.microsoft.com/download
3. Install extension C# di VS Code
4. Install extension .NET Extension Pack

#### Option 3: JetBrains Rider (Professional)
- IDE berbayar dengan fitur lengkap
- Excellent untuk development enterprise

### Instalasi .NET SDK

#### Windows:
```bash
# Download dari Microsoft website atau gunakan Chocolatey
choco install dotnet-sdk
```

#### macOS:
```bash
# Gunakan Homebrew
brew install --cask dotnet-sdk
```

#### Linux (Ubuntu):
```bash
# Add Microsoft repository
wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb

# Install .NET SDK
sudo apt-get update
sudo apt-get install -y dotnet-sdk-8.0
```

### Verifikasi Instalasi
```bash
# Check .NET version
dotnet --version

# List installed SDKs
dotnet --list-sdks

# Create new console project
dotnet new console -n MyFirstApp
cd MyFirstApp
dotnet run
```

### Struktur Project C#
```
MyFirstApp/
├── MyFirstApp.csproj    # Project file
├── Program.cs           # Main program file
└── obj/                 # Build output folder
```

---

## 4. Data Types

### Kategori Data Types

#### **Value Types** (Disimpan di Stack)

##### **Integer Types**
```csharp
byte    age = 25;           // 0 to 255 (8-bit)
sbyte   temperature = -10;  // -128 to 127 (8-bit signed)
short   year = 2024;        // -32,768 to 32,767 (16-bit)
ushort  port = 8080;        // 0 to 65,535 (16-bit unsigned)
int     population = 1000000; // -2.1B to 2.1B (32-bit)
uint    fileSize = 4000000U;  // 0 to 4.2B (32-bit unsigned)
long    distance = 9223372036854775807L; // 64-bit
ulong   bigNumber = 18446744073709551615UL; // 64-bit unsigned
```

##### **Floating Point Types**
```csharp
float   price = 19.99f;     // 32-bit, ~7 digits precision
double  pi = 3.14159265359; // 64-bit, ~15 digits precision
decimal money = 1000.50m;   // 128-bit, ~28 digits precision (financial)
```

##### **Other Value Types**
```csharp
char    initial = 'A';      // Unicode character
bool    isActive = true;    // true or false
DateTime today = DateTime.Now; // Date and time
```

#### **Reference Types** (Disimpan di Heap)

##### **String**
```csharp
string name = "John Doe";
string empty = "";
string nullString = null;

// String interpolation (C# 6.0+)
string greeting = $"Hello, {name}!";

// Multiline string
string multiline = @"Line 1
Line 2
Line 3";
```

##### **Arrays**
```csharp
// Array declaration and initialization
int[] numbers = new int[5];           // Array of 5 integers
int[] values = {1, 2, 3, 4, 5};       // Initialize with values
string[] names = new string[] {"Alice", "Bob", "Charlie"};

// Multidimensional arrays
int[,] matrix = new int[3,3];         // 2D array
int[,,] cube = new int[2,2,2];        // 3D array

// Jagged arrays
int[][] jaggedArray = new int[3][];
jaggedArray[0] = new int[4];
jaggedArray[1] = new int[2];
jaggedArray[2] = new int[3];
```

### Nullable Types
```csharp
// Nullable value types (C# 2.0+)
int? nullableInt = null;
DateTime? nullableDate = null;

// Check for null
if (nullableInt.HasValue)
{
    Console.WriteLine($"Value: {nullableInt.Value}");
}

// Null coalescing operator
int result = nullableInt ?? 0;  // Use 0 if null
```

### Type Conversion

#### **Implicit Conversion** (Automatic)
```csharp
int intValue = 100;
long longValue = intValue;    // int to long (safe)
float floatValue = intValue;  // int to float (safe)
```

#### **Explicit Conversion** (Manual)
```csharp
double doubleValue = 123.45;
int intFromDouble = (int)doubleValue;  // 123 (truncated)

// Using Convert class
string numberString = "123";
int parsedInt = Convert.ToInt32(numberString);

// Using Parse methods
int parsed = int.Parse("456");
DateTime parsedDate = DateTime.Parse("2024-01-01");

// Safe parsing with TryParse
if (int.TryParse("789", out int safeResult))
{
    Console.WriteLine($"Parsed successfully: {safeResult}");
}
```

### var Keyword (Type Inference)
```csharp
var number = 42;        // Inferred as int
var text = "Hello";     // Inferred as string
var list = new List<string>(); // Inferred as List<string>

// var requires initialization
// var x; // Error: Cannot infer type
```

---

## 5. Operators

### Arithmetic Operators
```csharp
int a = 10, b = 3;

int addition = a + b;       // 13
int subtraction = a - b;    // 7
int multiplication = a * b; // 30
int division = a / b;       // 3 (integer division)
int modulus = a % b;        // 1 (remainder)

// Increment/Decrement
int x = 5;
x++;    // Post-increment: x becomes 6
++x;    // Pre-increment: x becomes 7
x--;    // Post-decrement: x becomes 6
--x;    // Pre-decrement: x becomes 5

// Compound assignment
x += 5;  // x = x + 5
x -= 2;  // x = x - 2
x *= 3;  // x = x * 3
x /= 2;  // x = x / 2
x %= 4;  // x = x % 4
```

### Comparison Operators
```csharp
int a = 5, b = 10;

bool equal = (a == b);          // false
bool notEqual = (a != b);       // true
bool greaterThan = (a > b);     // false
bool lessThan = (a < b);        // true
bool greaterOrEqual = (a >= b); // false
bool lessOrEqual = (a <= b);    // true

// String comparison
string str1 = "Hello";
string str2 = "Hello";
bool stringEqual = (str1 == str2); // true
```

### Logical Operators
```csharp
bool condition1 = true;
bool condition2 = false;

// Logical AND
bool andResult = condition1 && condition2;  // false

// Logical OR
bool orResult = condition1 || condition2;   // true

// Logical NOT
bool notResult = !condition1;               // false

// Short-circuit evaluation
bool result = (5 > 3) || (10 / 0 == 1);   // true, second part not evaluated
```

### Bitwise Operators
```csharp
int a = 6;  // 110 in binary
int b = 4;  // 100 in binary

int bitwiseAnd = a & b;    // 4 (100)
int bitwiseOr = a | b;     // 6 (110)
int bitwiseXor = a ^ b;    // 2 (010)
int bitwiseNot = ~a;       // -7 (inverts all bits)
int leftShift = a << 1;    // 12 (1100)
int rightShift = a >> 1;   // 3 (011)
```

### Assignment Operators
```csharp
int x = 10;

x += 5;   // x = x + 5;   (15)
x -= 3;   // x = x - 3;   (12)
x *= 2;   // x = x * 2;   (24)
x /= 4;   // x = x / 4;   (6)
x %= 4;   // x = x % 4;   (2)
x &= 3;   // x = x & 3;   (bitwise AND)
x |= 1;   // x = x | 1;   (bitwise OR)
x ^= 2;   // x = x ^ 2;   (bitwise XOR)
x <<= 1;  // x = x << 1;  (left shift)
x >>= 1;  // x = x >> 1;  (right shift)
```

### Conditional Operator (Ternary)
```csharp
int age = 18;
string status = (age >= 18) ? "Adult" : "Minor";

// Nested ternary (use sparingly)
string category = (age < 13) ? "Child" : 
                 (age < 20) ? "Teen" : "Adult";
```

### Null-related Operators
```csharp
string name = null;

// Null coalescing operator (??)
string displayName = name ?? "Unknown";

// Null conditional operator (?.)
int? length = name?.Length;  // null if name is null

// Null coalescing assignment (??=) - C# 8.0+
name ??= "Default Name";  // Assign if null
```

### Type Testing Operators
```csharp
object obj = "Hello World";

// is operator
bool isString = obj is string;  // true

// as operator
string str = obj as string;     // "Hello World" or null

// typeof operator
Type stringType = typeof(string);
```

---

## 6. Conditional Statements

### if Statement
```csharp
int age = 25;

// Basic if
if (age >= 18)
{
    Console.WriteLine("You are an adult.");
}

// if-else
if (age >= 65)
{
    Console.WriteLine("Senior citizen");
}
else if (age >= 18)
{
    Console.WriteLine("Adult");
}
else
{
    Console.WriteLine("Minor");
}

// Single line (without braces)
if (age >= 18)
    Console.WriteLine("Can vote");
```

### Nested if Statements
```csharp
int score = 85;
bool hasExtraCredit = true;

if (score >= 60)
{
    if (hasExtraCredit)
    {
        if (score >= 80)
        {
            Console.WriteLine("Grade: A");
        }
        else
        {
            Console.WriteLine("Grade: B");
        }
    }
    else
    {
        Console.WriteLine("Grade: C");
    }
}
else
{
    Console.WriteLine("Grade: F");
}
```

### switch Statement
```csharp
char grade = 'B';

// Traditional switch
switch (grade)
{
    case 'A':
        Console.WriteLine("Excellent!");
        break;
    case 'B':
        Console.WriteLine("Good job!");
        break;
    case 'C':
        Console.WriteLine("Average");
        break;
    case 'D':
        Console.WriteLine("Below average");
        break;
    case 'F':
        Console.WriteLine("Failed");
        break;
    default:
        Console.WriteLine("Invalid grade");
        break;
}

// Multiple case labels
int dayNumber = 1;
switch (dayNumber)
{
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
        Console.WriteLine("Weekday");
        break;
    case 6:
    case 7:
        Console.WriteLine("Weekend");
        break;
    default:
        Console.WriteLine("Invalid day");
        break;
}
```

### switch Expression (C# 8.0+)
```csharp
// Modern switch expression
string GetGradeDescription(char grade) => grade switch
{
    'A' => "Excellent!",
    'B' => "Good job!",
    'C' => "Average",
    'D' => "Below average",
    'F' => "Failed",
    _ => "Invalid grade"
};

// Pattern matching with switch
object value = 42;
string result = value switch
{
    int i when i > 0 => "Positive integer",
    int i when i < 0 => "Negative integer",
    int => "Zero",
    string s => $"String: {s}",
    null => "Null value",
    _ => "Unknown type"
};
```

### Pattern Matching (C# 7.0+)
```csharp
object obj = "Hello";

// is expressions with patterns
if (obj is string str && str.Length > 0)
{
    Console.WriteLine($"Non-empty string: {str}");
}

if (obj is int number)
{
    Console.WriteLine($"Integer: {number}");
}

// Tuple patterns
(int x, int y) point = (3, 4);
string quadrant = point switch
{
    (0, 0) => "Origin",
    (var a, var b) when a > 0 && b > 0 => "First quadrant",
    (var a, var b) when a < 0 && b > 0 => "Second quadrant",
    (var a, var b) when a < 0 && b < 0 => "Third quadrant",
    (var a, var b) when a > 0 && b < 0 => "Fourth quadrant",
    _ => "On axis"
};
```

### Conditional Compilation
```csharp
#define DEBUG

class Program
{
    static void Main()
    {
#if DEBUG
        Console.WriteLine("Debug mode");
#else
        Console.WriteLine("Release mode");
#endif

#if DEBUG && !RELEASE
        Console.WriteLine("Debug only");
#endif
    }
}
```

---

## 7. Loops

### for Loop
```csharp
// Basic for loop
for (int i = 0; i < 5; i++)
{
    Console.WriteLine($"Iteration: {i}");
}

// Multiple variables
for (int i = 0, j = 10; i < j; i++, j--)
{
    Console.WriteLine($"i = {i}, j = {j}");
}

// Infinite loop (be careful!)
for (;;)
{
    Console.WriteLine("This runs forever");
    break; // Exit condition needed
}

// Nested for loops
for (int i = 1; i <= 3; i++)
{
    for (int j = 1; j <= 3; j++)
    {
        Console.Write($"{i}x{j}={i*j} ");
    }
    Console.WriteLine();
}
```

### while Loop
```csharp
int counter = 0;

// Basic while loop
while (counter < 5)
{
    Console.WriteLine($"Counter: {counter}");
    counter++;
}

// Input validation example
string input;
while (true)
{
    Console.Write("Enter 'exit' to quit: ");
    input = Console.ReadLine();
    if (input.ToLower() == "exit")
        break;
    Console.WriteLine($"You entered: {input}");
}

// Condition at the beginning
int number = 10;
while (number > 0)
{
    Console.WriteLine(number);
    number--;
}
```

### do-while Loop
```csharp
int attempts = 0;

// Execute at least once
do
{
    Console.WriteLine("Enter password:");
    string password = Console.ReadLine();
    attempts++;
    
    if (password == "secret123")
    {
        Console.WriteLine("Access granted!");
        break;
    }
    else
    {
        Console.WriteLine("Access denied!");
    }
} while (attempts < 3);

// Menu example
int choice;
do
{
    Console.WriteLine("Menu:");
    Console.WriteLine("1. Option 1");
    Console.WriteLine("2. Option 2");
    Console.WriteLine("0. Exit");
    Console.Write("Choice: ");
    
    int.TryParse(Console.ReadLine(), out choice);
    
    switch (choice)
    {
        case 1:
            Console.WriteLine("Option 1 selected");
            break;
        case 2:
            Console.WriteLine("Option 2 selected");
            break;
    }
} while (choice != 0);
```

### foreach Loop
```csharp
// Array iteration
int[] numbers = {1, 2, 3, 4, 5};
foreach (int number in numbers)
{
    Console.WriteLine($"Number: {number}");
}

// String iteration
string text = "Hello";
foreach (char character in text)
{
    Console.WriteLine($"Character: {character}");
}

// Collection iteration
List<string> names = new List<string> {"Alice", "Bob", "Charlie"};
foreach (string name in names)
{
    Console.WriteLine($"Name: {name}");
}

// Dictionary iteration
Dictionary<string, int> ages = new Dictionary<string, int>
{
    {"Alice", 25},
    {"Bob", 30},
    {"Charlie", 35}
};

foreach (KeyValuePair<string, int> kvp in ages)
{
    Console.WriteLine($"{kvp.Key} is {kvp.Value} years old");
}

// Or using var for cleaner code
foreach (var person in ages)
{
    Console.WriteLine($"{person.Key} is {person.Value} years old");
}
```

### Loop Control Statements

#### break Statement
```csharp
// Exit loop completely
for (int i = 0; i < 10; i++)
{
    if (i == 5)
        break; // Exit when i equals 5
    Console.WriteLine(i); // Prints 0, 1, 2, 3, 4
}

// Break from nested loop
for (int i = 0; i < 3; i++)
{
    for (int j = 0; j < 3; j++)
    {
        if (i == 1 && j == 1)
            break; // Only breaks inner loop
        Console.WriteLine($"i={i}, j={j}");
    }
}
```

#### continue Statement
```csharp
// Skip current iteration
for (int i = 0; i < 10; i++)
{
    if (i % 2 == 0)
        continue; // Skip even numbers
    Console.WriteLine(i); // Prints 1, 3, 5, 7, 9
}

// Continue in foreach
List<int> numbers = new List<int> {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
foreach (int number in numbers)
{
    if (number % 3 == 0)
        continue; // Skip multiples of 3
    Console.WriteLine(number); // Prints 1, 2, 4, 5, 7, 8, 10
}
```

### Advanced Loop Patterns

#### goto Statement (Use sparingly)
```csharp
for (int i = 0; i < 5; i++)
{
    for (int j = 0; j < 5; j++)
    {
        if (i * j > 6)
            goto ExitLoops; // Jump to label
        Console.WriteLine($"{i} * {j} = {i * j}");
    }
}

ExitLoops:
Console.WriteLine("Exited nested loops");
```

#### LINQ with Loops (Advanced)
```csharp
var numbers = Enumerable.Range(1, 10);

// Where (filtering)
foreach (int evenNumber in numbers.Where(n => n % 2 == 0))
{
    Console.WriteLine($"Even: {evenNumber}");
}

// Select (transformation)
foreach (string numberString in numbers.Select(n => n.ToString()))
{
    Console.WriteLine($"String: {numberString}");
}
```

---

## Tips dan Best Practices

### 1. Coding Style
- Gunakan **PascalCase** untuk class, method, property
- Gunakan **camelCase** untuk variable dan parameter
- Gunakan **const** untuk konstanta
- Berikan nama yang deskriptif

### 2. Performance Tips
- Gunakan `StringBuilder` untuk manipulasi string yang banyak
- Prefer `List<T>` over arrays untuk koleksi dinamis
- Gunakan `foreach` untuk iterasi read-only
- Gunakan `for` untuk iterasi dengan index

### 3. Error Handling
- Selalu validate input data
- Gunakan `TryParse` untuk konversi yang aman
- Handle exceptions dengan try-catch

### 4. Memory Management
- Dispose IDisposable objects dengan `using` statement
- Avoid memory leaks dengan proper event unsubscription

---

## Resources untuk Belajar Lebih Lanjut

### Dokumentasi Official
- [Microsoft C# Documentation](https://docs.microsoft.com/en-us/dotnet/csharp/)
- [.NET API Browser](https://docs.microsoft.com/en-us/dotnet/api/)

### Online Learning
- Microsoft Learn (Gratis)
- Pluralsight
- Udemy
- Coursera

### Practice Platforms
- LeetCode
- HackerRank
- Codewars
- Exercism.io

### Komunitas
- Stack Overflow
- Reddit r/csharp
- Discord .NET Community
- GitHub

---

## Kesimpulan

C# adalah bahasa pemrograman yang powerful dan versatile dengan ekosistem yang kuat. Dengan memahami fundamentals ini, Anda telah memiliki foundation yang solid untuk:

1. **Mengembangkan aplikasi desktop** dengan WPF atau WinForms
2. **Membuat web applications** dengan ASP.NET Core
3. **Membangun mobile apps** dengan Xamarin atau MAUI
4. **Mengembangkan games** dengan Unity
5. **Membuat cloud applications** dengan Azure

**Next Steps:**
- Practice dengan project kecil
- Pelajari Object-Oriented Programming
- Eksplorasi .NET ecosystem
- Join komunitas developer C#

Selamat belajar dan coding! 🚀