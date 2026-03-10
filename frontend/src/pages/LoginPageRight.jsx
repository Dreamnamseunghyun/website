import React from 'react';
import "../styles/LoginPageVersion.css";

const LoginPageRight = () => {
    return (
        <div className="login-page login-page-light">
            <div className="login-wrapper">
                <h1 className="login-title">로그인</h1>
                <p className="login-subtitle">계정에 로그인하여 서비스를 이용하세요.</p>

                <div className="login-card">
                    <div className="login-card-body">
                        <label className="login-label">이메일</label>

                        <input
                            type="email"
                            className="login-input"
                            placeholder="이메일"
                        />

                        <input
                            type="password"
                            className="login-input"
                            placeholder="비밀번호"
                        />

                        <button type="button" className="login-link-button">
                            비밀번호를 잊으셨나요?
                        </button>

                        <button type="button" className="login-submit light-submit">
                            로그인
                        </button>
                    </div>

                    <div className="login-card-footer">
                        <button type="button" className="signup-link">
                            계정 만들기
                        </button>
                    </div>
                </div>

                <div className="login-footer-links">
                    <span>한국어</span>
                    <span>도움말</span>
                    <span>개인정보처리방침</span>
                    <span>약관</span>
                </div>
            </div>
        </div>
    );
};

export default LoginPageRight;
