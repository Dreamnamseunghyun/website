import { useState } from "react";
import "../styles/AppleLoginPage.css";

function AppleLoginPage() {
    const [id, setId] = useState("");
    const [password, setPassword] = useState("");

    const handleLogin = () => {
        if (!id || !password) {
            alert("Apple ID와 비밀번호를 입력하세요.");
            return;
        }

        console.log("Apple style login:", { id, password });
    };

    return (
        <div className="apple-login-page">
            <div className="apple-login-card">
                <div className="apple-login-logo"></div>

                <h1 className="apple-login-title">Apple 계정 로그인</h1>
                <p className="apple-login-subtitle">
                    하나의 계정으로 모든 서비스를 이용하세요.
                </p>

                <input
                    type="text"
                    className="apple-login-input"
                    placeholder="Apple ID"
                    value={id}
                    onChange={(e) => setId(e.target.value)}
                />

                <input
                    type="password"
                    className="apple-login-input"
                    placeholder="비밀번호"
                    value={password}
                    onChange={(e) => setPassword(e.target.value)}
                />

                <button
                    type="button"
                    className="apple-login-button"
                    onClick={handleLogin}
                >
                    계속
                </button>
            </div>
        </div>
    );
}

export default AppleLoginPage;
