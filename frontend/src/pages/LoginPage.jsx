import { useState } from "react";
import { login } from "../services/auth";

export default function LoginPage() {
    const [form, setForm] = useState({
        userId: "",
        userPw: ""
    });

    const [loading, setLoading] = useState(false);
    const [message, setMessage] = useState("");

    const handleChange = (e) => {
        const { name, value } = e.target;
        setForm((prev) => ({
            ...prev,
            [name]: value
        }));
    };

    const handleSubmit = async (e) => {
        e.preventDefault();
        setLoading(true);
        setMessage("");

        try {
            const data = await login(form);
            setMessage(data?.message || "로그인 요청이 완료되었습니다.");
        } catch (error) {
            setMessage(
                error?.response?.data?.message ||
                "로그인 중 오류가 발생했습니다."
            );
        } finally {
            setLoading(false);
        }
    };

    return (
        <div className="login-page">
            <div className="login-shell">
                <div className="login-brand">
                    <div className="brand-badge">SITE BUILDER</div>
                    <h1>고객 로그인</h1>
                    <p>홈페이지 제작 진행을 위한 전용 로그인 페이지입니다.</p>
                    <p>이메일과 비밀번호로 접속하세요.</p>
                </div>

                <div className="login-card">
                    <form onSubmit={handleSubmit} className="login-form">
                        <label htmlFor="email">이메일</label>
                        <input
                            id="userId"
                            name="userId"
                            type="text"
                            placeholder="아이디 입력"
                            value={form.userId}
                            onChange={handleChange}
                            required
                        />

                        <label htmlFor="password">비밀번호</label>
                        <input
                            id="userPw"
                            name="userPw"
                            type="password"
                            placeholder="비밀번호 입력"
                            value={form.userPw}
                            onChange={handleChange}
                            required
                        />

                        <button type="submit" disabled={loading}>
                            {loading ? "로그인 중..." : "로그인"}
                        </button>

                        {message && <p className="login-message">{message}</p>}
                    </form>
                </div>
            </div>
        </div>
    );
}
