# TIL 작성법
# 📚 Today I Learned (TIL)

> 매일 배운 내용을 정리하는 공간입니다.  
> 핵심 내용을 간결하게 기록하며, 꾸준한 학습을 목표로 합니다. 🚀  

---

## **📌 1. 주제 소개**  
- 오늘 배운 내용을 간략히 요약합니다.  
- 핵심 키워드를 정리하고, 학습 목표를 기록합니다.  

### **✅ 오늘의 주제: Git 기본 명령어**
- Git이란 무엇인가?
- Git의 주요 개념 (버전 관리, 커밋, 브랜치 등)
- 자주 사용하는 Git 명령어 정리  

---

## **📌 2. 학습 내용 정리**  
> **🔹 개념 설명과 예제 코드 포함**  

### **1️⃣ Git이란?**
Git은 **분산 버전 관리 시스템(DVCS)** 으로,  
코드 변경 사항을 추적하고 여러 개발자들이 협업할 수 있도록 도와줍니다.  

### **2️⃣ Git 기본 명령어 정리**
| 명령어 | 설명 |
|--------|------|
| `git init` | 현재 폴더를 Git 저장소로 초기화 |
| `git clone [URL]` | 원격 저장소를 로컬로 복제 |
| `git status` | 현재 변경 사항 확인 |
| `git add .` | 모든 변경 사항을 스테이징 영역에 추가 |
| `git commit -m "메시지"` | 변경 사항을 커밋 |
| `git push origin main` | 원격 저장소로 푸시 |

---

## **📌 3. 코드 예제**  
> **💡 실습 코드와 주석을 포함하여 가독성을 높임**  

```bash
# 1. 새로운 Git 저장소 초기화
git init

# 2. 원격 저장소 연결
git remote add origin https://github.com/username/repository.git

# 3. 변경 사항 확인
git status

# 4. 파일 추가 및 커밋
git add .
git commit -m "첫 번째 커밋"

# 5. 원격 저장소로 업로드
git push origin main
```
## 📌 4. 추가 학습 자료  
> **🔗 유용한 링크와 참고 자료 정리**  

- [공식 Git 문서](https://git-scm.com/doc)  
- [GitHub 사용법 가이드](https://docs.github.com/en)  
- [MarkDown 문법 정리](https://www.markdownguide.org/)  

---

## 📌 5. 오늘의 느낀 점 & 회고  
> **✍️ 짧게라도 회고를 작성하여 학습 효과를 높임**  

✅ **오늘 배운 내용 요약:**  
- Git의 기본 개념과 주요 명령어를 익혔다.  
- `git add`, `git commit`, `git push`의 흐름을 이해했다.  

💡 **느낀 점:**  
- Git의 기본 흐름을 이해하는 것이 중요하다.  
- 앞으로 협업할 때 Git을 더 효율적으로 사용할 수 있을 것 같다.  
- 명령어를 반복해서 사용하면서 익숙해져야겠다.  

---

## 📌 6. 내일 학습할 내용  
> **⏭️ 학습 계획을 미리 정리하여 지속적인 학습 유도**  

- Git 브랜치(`branch`)와 병합(`merge`) 개념 익히기  
- 협업 시 `pull request` 사용 방법 배우기  
- GitHub Actions를 활용한 자동화 학습  

---

# 🎯 **TIL 작성 규칙**  
✅ **짧고 간결하게 핵심 내용만 정리**  
✅ **코드 예제 포함하여 이해도를 높임**  
✅ **매일 1개 이상의 학습 내용을 기록**  
✅ **느낀 점과 회고를 작성하여 복습 효과 극대화**  
