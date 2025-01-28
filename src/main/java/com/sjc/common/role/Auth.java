package com.sjc.common.role;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public enum Auth {
    USER("ROLE_USER", "일반 사용자"),
    ADMIN("ROLE_ADMIN", "일반 관리자"),
    SUPER_ADMIN("ROLE_SUPER", "슈퍼 관리자");

    private final String key;
    private final String title;

}
