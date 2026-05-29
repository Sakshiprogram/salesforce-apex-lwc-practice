public class AbsQ10 {
    public abstract class Person { String name; public Person(String n){name=n;} public abstract void display(); }
    public class Student extends Person { public Student(String n){ super(n);} public override void display(){ System.debug(name); } }
    public static void runTest(){ new Student('Sakshi').display(); }
}