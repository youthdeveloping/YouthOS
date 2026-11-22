# YouthOS

청소년 개발자를 위한 리눅스 기반 운영체제입니다. 코딩 입문 교육과 GitHub, Cloudflare 등 개발자 서비스 활용을 한 번에 지원합니다.

## 구성

- 베이스: Debian 13 (trixie) / live-build
- 데스크톱: XFCE, 한국어 로케일, fcitx5-hangul 입력기
- 입문용: Thonny, Python 3
- 개발용: Git, GitHub CLI(`gh`), Node.js, VS Code, Wrangler(Cloudflare)
- 설치 프로그램: Calamares
- 첫 부팅 환영 화면과 개발자 사이트 북마크 기본 제공

## ISO 빌드

GitHub Actions에서 자동으로 빌드합니다.

1. 저장소의 Actions 탭 > "Build YouthOS ISO" > Run workflow
2. 완료 후 Artifacts의 `youthos-iso`를 내려받습니다.

로컬에서 빌드하려면 Debian 계열 환경에서 다음을 실행합니다.

```
sudo apt install live-build
sudo lb config
sudo lb build
```

## 폴더 구조

- `auto/` : live-build 설정 스크립트
- `config/package-lists/` : 설치할 패키지 목록
- `config/hooks/live/` : VS Code, Wrangler 설치 스크립트
- `config/includes.chroot/` : ISO에 그대로 복사되는 파일 (환영 화면, 브라우저 정책 등)
- `.github/workflows/` : ISO 자동 빌드

## 보안 원칙

GitHub 토큰, Cloudflare 로그인 정보 등은 이미지에 포함하지 않습니다. 각 사용자가 첫 부팅 후 직접 로그인합니다.

## 작업 표기 규칙

- 여러 AI와 함께 작업하므로, Claude가 작성하거나 수정한 부분에는 `- by Claude Ai`를, ChatGPT가 작성하거나 수정한 부분에는 `- by ChatGPT AI`를 표기합니다.
- 주석을 지원하지 않는 파일은 이 목록에 기록합니다.
  - `config/includes.chroot/etc/firefox/policies/policies.json` (- by Claude Ai)
- 각자 별도 브랜치에서 작업하고 Pull Request로 통합합니다.
- 상대방이 작성한 파일을 수정하기 전에는 현재 내용과 작업 내역을 확인하고, 수정 이유를 남깁니다.

## 교육 콘텐츠

- 저장소 루트의 `education/` 폴더에 작성합니다.
- 빌드할 때 `config/includes.chroot/etc/skel/education/`로 복사되어, 설치된 시스템의 홈 폴더(`~/education`)에 들어갑니다.
- 문서의 명령어는 ISO에 실제 탑재된 패키지와 일치해야 합니다.

- by Claude Ai
