package first_fianl;


#### Scanner 사용하기 위해서는 임포트 필수
import java.util.Scanner;

public class makeFile {
  public static void main (String[] args) {
###     Scanner 생성
    Scanner scanner = new Scanner(System.in); 

###    문자열 입력 받기    띄어쓰기 불가능
    System.out.print("이름을 입력하세요: ");
    String name = scanner.next();  

###    정수 입력 받기
    System.out.print("나이를 입력하세요: ");
    int age = scanner.nextInt();

###    한 줄 전부다 입력   띄어쓰기 가능
    System.out.print("한 줄 입력하세요: ");
    String line = sc.nextLine();

###    true 또는 flase
    System.out.print("true 또는 false를 입력하세요: ");
    boolean value = sc.nextBoolean();
---
###       출력
    String a = "Hello";

###      출력: a의 값은: Hello
    System.out.println("a의 값은: " + a);

###     출력: a의 값은: Hello
    print("a의 값은: $a");  
    
###     출력: a의 값은: Hello 
    System.out.printf("a의 값은: %s\n", a);

---



    
