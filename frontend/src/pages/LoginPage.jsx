import { useState } from "react";

export default function LoginPage() {
    const [email, setEmail] = useState("");
    const [password, setPassword] = useState("");

    return (
        <div style={styles.page}>
            <div style={styles.card}>
                <div style={styles.brand}>SITE BUILDER</div>
                <h1 style={styles.title}>고객 로그인</h1>
                <p style={styles.desc}>
                    홈페이지 제작 진행을 위한 전용 로그인 페이지입니다.
                </p>
                <p style={styles.descSub}>이메일과 비밀번호로 접속하세요.</p>

                <div style={styles.form}>
                    <input
                        type="text"
                        placeholder="이메일"
                        value={email}
                        onChange={(e) => setEmail(e.target.value)}
                        style={styles.input}
                    />
                    <input
                        type="password"
                        placeholder="비밀번호"
                        value={password}
                        onChange={(e) => setPassword(e.target.value)}
                        style={styles.input}
                    />
                    <button style={styles.button}>로그인</button>
                </div>
            </div>
        </div>
    );
}

const styles = {
    page: {
        minHeight: "100vh",
        background: "#202124",
        display: "flex",
        alignItems: "center",
        justifyContent: "center",
        padding: "24px",
        fontFamily: "Arial, sans-serif",
    },
    card: {
        width: "100%",
        maxWidth: "420px",
        background: "#f7f7f2",
        borderRadius: "20px",
        padding: "40px 32px",
        boxShadow: "0 20px 60px rgba(0,0,0,0.35)",
    },
    brand: {
        fontSize: "13px",
        fontWeight: 700,
        letterSpacing: "0.08em",
        color: "#5f6368",
        marginBottom: "18px",
    },
    title: {
        fontSize: "46px",
        lineHeight: 1.08,
        margin: "0 0 16px 0",
        color: "#111",
        fontWeight: 800,
    },
    desc: {
        margin: "0 0 8px 0",
        color: "#444",
        fontSize: "15px",
    },
    descSub: {
        margin: "0 0 24px 0",
        color: "#444",
        fontSize: "15px",
    },
    form: {
        display: "flex",
        flexDirection: "column",
        gap: "12px",
    },
    input: {
        width: "100%",
        padding: "14px 16px",
        borderRadius: "12px",
        border: "1px solid #d8d8d8",
        fontSize: "15px",
        boxSizing: "border-box",
        outline: "none",
        background: "#fff",
    },
    button: {
        marginTop: "6px",
        width: "100%",
        padding: "14px 16px",
        borderRadius: "12px",
        border: "none",
        background: "#111",
        color: "#fff",
        fontSize: "15px",
        fontWeight: 700,
        cursor: "pointer",
    },
};
