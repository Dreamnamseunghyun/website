import { useState } from "react";
import axios from "axios";
import "../styles/LoginPage.css";

function LoginPage() {
    const [id, setId] = useState("");
    const [password, setPassword] = useState("");

    const handleLogin = async () => {
        if (!id || !password) {
            alert("아이디와 비밀번호를 입력하세요.");
            return;
        }

        try {
            const response = await axios.post("/api/login", {
                id: id,
                password: password
            });

            console.log(response.data);

            if (response.data.success) {
                alert(response.data.message || "로그인 성공");
                window.location.href = "/main";
            } else {
                alert(response.data.message || "로그인 실패");
            }

        } catch (error) {

            console.error(error);

            if (error.response) {
                alert(error.response.data.message || "서버 오류");
            } else {
                alert("서버 연결 실패");
            }

        }
    };

    return (
        <div className="login-container">

            <div className="login-box">

                <h1 className="login-title">Login</h1>

                <input
                    type="text"
                    placeholder="ID"
                    value={id}
                    onChange={(e) => setId(e.target.value)}
                    className="login-input"
                />

                <input
                    type="password"
                    placeholder="Password"
                    value={password}
                    onChange={(e) => setPassword(e.target.value)}
                    className="login-input"
                />

                <button
                    className="login-button"
                    onClick={handleLogin}
                >
                    로그인
                </button>

            </div>

        </div>
    );
}

export default LoginPage;
