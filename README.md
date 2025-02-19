# EverySaju

## 📌 릴리즈 관리

### 🔹 브랜치 전략
- `main` : 운영 환경
- `develop` : 개발 브랜치
- `feature/기능명` : 새로운 기능 개발
- `release/x.x.x` : 배포 준비 브랜치
- `hotfix/버그명` : 긴급 수정

### 🔹 버전 규칙 (Semantic Versioning)
- `MAJOR.MINOR.PATCH` (예: `1.2.3`)
  - `MAJOR` : 큰 변경 (이전 버전과 호환 불가)
  - `MINOR` : 새로운 기능 추가 (하위 호환 가능)
  - `PATCH` : 버그 수정 및 보안 업데이트


### 🔹 Slack 연동
- `#release-notes` 채널에서 릴리즈 공지
- 배포 완료 후 자동 메시지 발송
- 장애 발생 시 빠른 공지 및 대응

---

## 📌 릴리즈 노트 (CHANGELOG)
릴리즈 정보는 [`CHANGELOG.md`](./CHANGELOG.md) 파일에서 확인
