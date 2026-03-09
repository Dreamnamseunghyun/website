import { useState } from "react";
import "../styles/GoogleLoginPage.css";

function GoogleLoginPage() {
    const [id, setId] = useState("");
    const [password, setPassword] = useState("");

    const handleLogin = () => {
        if (!id || !password) {
            alert("이메일과 비밀번호를 입력하세요.");
            return;
        }

        console.log("Google style login:", { id, password });
    };

    return (
        <div className="google-login-page">
            <div className="google-login-card">
                <div className="google-login-logo">G</div>

                <h1 className="google-login-title">로그인</h1>
                <p className="google-login-subtitle">
                    계정에 로그인하여 서비스를 계속 이용하세요.
                </p>

                <input
                    type="text"
                    className="google-login-input"
                    placeholder="이메일 또는 아이디"
                    value={id}
                    onChange={(e) => setId(e.target.value)}
                />

                <input
                    type="password"
                    className="google-login-input"
                    placeholder="비밀번호"
                    value={password}
                    onChange={(e) => setPassword(e.target.value)}
                />

                <button
                    type="button"
                    className="google-login-primary-button"
                    onClick={handleLogin}
                >
                    다음
                </button>
            </div>
        </div>
    );
}

export default GoogleLoginPage;
