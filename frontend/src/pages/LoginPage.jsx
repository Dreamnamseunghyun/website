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
            const response = await axios.post(
                "/website/api/login",
                {
                    id: id,
                    password: password
                },
                {
                    withCredentials: true,
                    headers: {
                        "Content-Type": "application/json"
                    }
                }
            );

            console.log("login response:", response.data);

            if (response.data.success) {
                alert(response.data.message || "로그인 성공");

                // 로그인 성공 후 이동
                window.location.href = "/main";

            } else {
                alert(response.data.message || "로그인 실패");
            }

        } catch (error) {

            console.error("login error:", error);

            if (error.response) {
                console.error("status:", error.response.status);
                console.error("data:", error.response.data);
                alert(error.response.data.message || "서버 오류가 발생했습니다.");
            } else if (error.request) {
                alert("서버 응답이 없습니다. 서버 실행 여부를 확인하세요.");
            } else {
                alert("로그인 요청 중 오류가 발생했습니다.");
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
