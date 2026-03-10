import React from 'react';
import "../styles/LoginPageVersion.css";

const LoginPageDark = () => {
    return (
        <div className="login-page login-page-dark">
            <div className="login-wrapper">
                <h1 className="login-title dark-title">로그인</h1>
                <p className="login-subtitle dark-subtitle">
                    계정에 로그인하여 서비스를 이용하세요.
                </p>

                <div className="login-card dark-card">
                    <div className="login-card-body">
                        <label className="login-label dark-label">이메일</label>

                        <input
                            type="email"
                            className="login-input dark-input"
                            placeholder="이메일"
                        />

                        <input
                            type="password"
                            className="login-input dark-input"
                            placeholder="비밀번호"
                        />

                        <button type="button" className="login-link-button dark-link">
                            비밀번호를 잊으셨나요?
                        </button>

                        <button type="button" className="login-submit dark-submit">
                            로그인
                        </button>
                    </div>

                    <div className="login-card-footer dark-footer">
                        <button type="button" className="signup-link dark-signup-link">
                            계정 만들기
                        </button>
                    </div>
                </div>

                <div className="login-footer-links dark-footer-links">
                    <span>한국어</span>
                    <span>도움말</span>
                    <span>개인정보처리방침</span>
                    <span>약관</span>
                </div>
            </div>
        </div>
    );
};

export default LoginPageDark;
