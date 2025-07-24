-- 운동갈래 서비스 MySQL 테이블 정의 (컬럼 설명 포함)

-- 1. 회원/유저
CREATE TABLE user (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,           -- 유저 고유번호
    social_id VARCHAR(64) UNIQUE,                   -- 소셜 로그인 ID(카카오/네이버 등)
    nickname VARCHAR(32) NOT NULL,                  -- 닉네임
    email VARCHAR(128),                             -- 이메일
    password VARCHAR(128),                          -- 비밀번호(소셜로그인만 쓸 경우 NULL)
    profile_image VARCHAR(255),                     -- 프로필 이미지 URL
    join_date DATE,                                 -- 가입일
    trust_score INT DEFAULT 100,                    -- 신뢰도 점수(기본 100)
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP   -- 생성일시
);

-- 2. 프로필 (실력, 위치 등)
CREATE TABLE user_profile (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,           -- 프로필 고유번호
    user_id BIGINT NOT NULL,                        -- 유저 ID (user 테이블 참조)
    level_id INT,                                   -- 실력 등급 ID (level 테이블 참조)
    review_score FLOAT DEFAULT 0,                   -- 평균 리뷰 점수
    activity_count INT DEFAULT 0,                   -- 모임 참여 횟수
    FOREIGN KEY (user_id) REFERENCES user(id)
);

CREATE TABLE user_location (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,           -- 위치 고유번호
    user_id BIGINT NOT NULL,                        -- 유저 ID (user 테이블 참조)
    location_name VARCHAR(64),                      -- 위치명(구/동 등)
    is_primary BOOLEAN DEFAULT FALSE,               -- 대표 위치 여부
    FOREIGN KEY (user_id) REFERENCES user(id)
);

-- 3. 급수/실력 등급
CREATE TABLE level (
    id INT PRIMARY KEY AUTO_INCREMENT,              -- 등급 고유번호
    name VARCHAR(16) NOT NULL,                      -- 등급명(초심, D조 등)
    description VARCHAR(64)                         -- 등급 설명
);

-- 4. 매칭/모임
CREATE TABLE matching (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,           -- 매칭 고유번호
    title VARCHAR(128) NOT NULL,                    -- 매칭 제목
    description TEXT,                               -- 매칭 상세 설명
    date DATETIME NOT NULL,                         -- 모임 일시
    place_name VARCHAR(64),                         -- 장소명(네이버 지도에서 받아온 이름)
    latitude DOUBLE,                                -- 위도(네이버 지도)
    longitude DOUBLE,                               -- 경도(네이버 지도)
    capacity INT,                                   -- 참여 정원
    level_id INT,                                   -- 참여 가능 등급 ID
    host_user_id BIGINT,                            -- 주최자 유저 ID
    image_url VARCHAR(255),                         -- 매칭 대표 이미지 URL
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,  -- 생성일시
    FOREIGN KEY (level_id) REFERENCES level(id),
    FOREIGN KEY (host_user_id) REFERENCES user(id)
);

-- 5. 매칭 참가자/신청자
CREATE TABLE matching_applicant (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,           -- 참가자 고유번호
    matching_id BIGINT NOT NULL,                    -- 매칭 ID (matching 테이블 참조)
    user_id BIGINT NOT NULL,                        -- 유저 ID (user 테이블 참조)
    status ENUM('approved', 'pending', 'rejected', 'wait') DEFAULT 'pending', -- 상태(승인/대기/거절/대기인원)
    is_host BOOLEAN DEFAULT FALSE,                  -- 주최자 여부
    joined_at DATETIME,                             -- 참가 확정 일시
    FOREIGN KEY (matching_id) REFERENCES matching(id),
    FOREIGN KEY (user_id) REFERENCES user(id)
);

-- 6. 리뷰 (모임/참가자)
CREATE TABLE review (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,           -- 리뷰 고유번호
    reviewer_id BIGINT NOT NULL,                    -- 작성자 유저 ID
    reviewee_id BIGINT,                             -- 피평가자 유저 ID(참가자 리뷰)
    matching_id BIGINT,                             -- 매칭 ID(모임 리뷰)
    rating INT CHECK (rating BETWEEN 1 AND 5),      -- 별점(1~5)
    content TEXT,                                   -- 리뷰 내용
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,  -- 작성일시
    FOREIGN KEY (reviewer_id) REFERENCES user(id),
    FOREIGN KEY (reviewee_id) REFERENCES user(id),
    FOREIGN KEY (matching_id) REFERENCES matching(id)
);

CREATE TABLE review_tag (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,           -- 태그 고유번호
    review_id BIGINT NOT NULL,                      -- 리뷰 ID (review 테이블 참조)
    tag VARCHAR(32),                                -- 태그명(좋았던 점 등)
    FOREIGN KEY (review_id) REFERENCES review(id)
);

-- 7. 알림
CREATE TABLE notification (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,           -- 알림 고유번호
    user_id BIGINT NOT NULL,                        -- 유저 ID (user 테이블 참조)
    type VARCHAR(32),                               -- 알림 타입(매칭시작, 리뷰요청 등)
    title VARCHAR(128),                             -- 알림 제목
    message TEXT,                                   -- 알림 내용
    is_read BOOLEAN DEFAULT FALSE,                  -- 읽음 여부
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,  -- 생성일시
    FOREIGN KEY (user_id) REFERENCES user(id)
);

-- 8. 페널티
CREATE TABLE penalty (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,           -- 페널티 고유번호
    user_id BIGINT NOT NULL,                        -- 유저 ID (user 테이블 참조)
    reason VARCHAR(128),                            -- 사유
    matching_id BIGINT,                             -- 관련 매칭 ID
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,  -- 생성일시
    FOREIGN KEY (user_id) REFERENCES user(id),
    FOREIGN KEY (matching_id) REFERENCES matching(id)
);

-- 9. 북마크/좋아요
CREATE TABLE bookmark (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,           -- 북마크 고유번호
    user_id BIGINT NOT NULL,                        -- 유저 ID (user 테이블 참조)
    matching_id BIGINT NOT NULL,                    -- 매칭 ID (matching 테이블 참조)
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,  -- 생성일시
    FOREIGN KEY (user_id) REFERENCES user(id),
    FOREIGN KEY (matching_id) REFERENCES matching(id)
);

-- 10. 사진 업로드
CREATE TABLE photo (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,           -- 사진 고유번호
    user_id BIGINT,                                 -- 유저 ID (user 테이블 참조)
    matching_id BIGINT,                             -- 매칭 ID (matching 테이블 참조)
    review_id BIGINT,                               -- 리뷰 ID (review 테이블 참조)
    url VARCHAR(255) NOT NULL,                      -- 사진 URL
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,  -- 업로드 일시
    FOREIGN KEY (user_id) REFERENCES user(id),
    FOREIGN KEY (matching_id) REFERENCES matching(id),
    FOREIGN KEY (review_id) REFERENCES review(id)
); 