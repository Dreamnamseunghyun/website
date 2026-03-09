$ErrorActionPreference = "Stop"

Write-Host "=== React frontend structure setup start ===" -ForegroundColor Cyan

# 1. frontend folder structure
$dirs = @(
    "frontend",
    "frontend\public",
    "frontend\src",
    "frontend\src\assets",
    "frontend\src\components",
    "frontend\src\components\layout",
    "frontend\src\pages",
    "frontend\src\services",
    "frontend\src\styles"
)

foreach ($dir in $dirs) {
    if (-not (Test-Path $dir)) {
        New-Item -ItemType Directory -Path $dir | Out-Null
        Write-Host "Created: $dir"
    } else {
        Write-Host "Exists: $dir"
    }
}

# 2. package.json
@'
{
  "name": "website-frontend",
  "private": true,
  "version": "0.0.1",
  "type": "module",
  "scripts": {
    "dev": "vite",
    "build": "vite build",
    "preview": "vite preview"
  },
  "dependencies": {
    "axios": "^1.7.9",
    "react": "^18.3.1",
    "react-dom": "^18.3.1",
    "react-router-dom": "^7.1.1"
  },
  "devDependencies": {
    "@vitejs/plugin-react": "^4.3.4",
    "vite": "^6.0.5"
  }
}
'@ | Set-Content -Path "frontend\package.json" -Encoding UTF8

# 3. vite.config.js
@'
import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";

export default defineConfig({
  plugins: [react()],
  server: {
    port: 5173,
    proxy: {
      "/api": {
        target: "http://localhost:8080",
        changeOrigin: true
      }
    }
  }
});
'@ | Set-Content -Path "frontend\vite.config.js" -Encoding UTF8

# 4. index.html
@'
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Website Builder</title>
  </head>
  <body>
    <div id="root"></div>
    <script type="module" src="/src/main.jsx"></script>
  </body>
</html>
'@ | Set-Content -Path "frontend\index.html" -Encoding UTF8

# 5. .gitignore
@'
node_modules
dist
.env
'@ | Set-Content -Path "frontend\.gitignore" -Encoding UTF8

# 6. main.jsx
@'
import React from "react";
import ReactDOM from "react-dom/client";
import { RouterProvider } from "react-router-dom";
import router from "./router";
import "./styles/login.css";

ReactDOM.createRoot(document.getElementById("root")).render(
  <React.StrictMode>
    <RouterProvider router={router} />
  </React.StrictMode>
);
'@ | Set-Content -Path "frontend\src\main.jsx" -Encoding UTF8

# 7. router.jsx
@'
import { createBrowserRouter } from "react-router-dom";
import App from "./App";
import LoginPage from "./pages/LoginPage";

const router = createBrowserRouter([
  {
    path: "/",
    element: <App />,
    children: [
      { index: true, element: <LoginPage /> }
    ]
  }
]);

export default router;
'@ | Set-Content -Path "frontend\src\router.jsx" -Encoding UTF8

# 8. App.jsx
@'
import { Outlet } from "react-router-dom";

export default function App() {
  return <Outlet />;
}
'@ | Set-Content -Path "frontend\src\App.jsx" -Encoding UTF8

# 9. auth.js
@'
import axios from "axios";

export async function login(payload) {
  const response = await axios.post("/api/auth/login", payload, {
    headers: {
      "Content-Type": "application/json"
    }
  });

  return response.data;
}
'@ | Set-Content -Path "frontend\src\services\auth.js" -Encoding UTF8

# 10. LoginPage.jsx
@'
import { useState } from "react";
import { login } from "../services/auth";

export default function LoginPage() {
  const [form, setForm] = useState({
    email: "",
    password: ""
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
          <p>
            홈페이지 제작 진행을 위한 전용 로그인 페이지입니다.
            이메일과 비밀번호로 접속하세요.
          </p>
        </div>

        <div className="login-card">
          <form onSubmit={handleSubmit} className="login-form">
            <label htmlFor="email">이메일</label>
            <input
              id="email"
              name="email"
              type="email"
              placeholder="name@company.com"
              value={form.email}
              onChange={handleChange}
              required
            />

            <label htmlFor="password">비밀번호</label>
            <input
              id="password"
              name="password"
              type="password"
              placeholder="비밀번호 입력"
              value={form.password}
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
'@ | Set-Content -Path "frontend\src\pages\LoginPage.jsx" -Encoding UTF8

# 11. login.css
@'
* {
  box-sizing: border-box;
}

html, body, #root {
  margin: 0;
  padding: 0;
  min-height: 100%;
  font-family: "Segoe UI", "Malgun Gothic", sans-serif;
  background: #f6f8fb;
  color: #111827;
}

body {
  min-height: 100vh;
}

.login-page {
  min-height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 32px;
  background:
    radial-gradient(circle at top left, rgba(59,130,246,0.12), transparent 28%),
    radial-gradient(circle at bottom right, rgba(37,99,235,0.10), transparent 24%),
    #f6f8fb;
}

.login-shell {
  width: 100%;
  max-width: 1100px;
  display: grid;
  grid-template-columns: 1.1fr 0.9fr;
  gap: 28px;
  align-items: center;
}

.login-brand h1 {
  margin: 0 0 16px;
  font-size: 48px;
  line-height: 1.15;
  letter-spacing: -0.02em;
}

.login-brand p {
  margin: 0;
  font-size: 17px;
  line-height: 1.7;
  color: #4b5563;
  max-width: 520px;
}

.brand-badge {
  display: inline-block;
  margin-bottom: 18px;
  padding: 8px 12px;
  border-radius: 999px;
  background: #dbeafe;
  color: #1d4ed8;
  font-size: 12px;
  font-weight: 700;
  letter-spacing: 0.08em;
}

.login-card {
  background: #ffffff;
  border: 1px solid #e5e7eb;
  border-radius: 24px;
  padding: 32px;
  box-shadow: 0 20px 50px rgba(15, 23, 42, 0.08);
}

.login-form {
  display: flex;
  flex-direction: column;
  gap: 12px;
}

.login-form label {
  font-size: 14px;
  font-weight: 600;
  color: #374151;
}

.login-form input {
  width: 100%;
  height: 52px;
  border: 1px solid #d1d5db;
  border-radius: 14px;
  padding: 0 16px;
  font-size: 15px;
  outline: none;
  transition: border-color 0.2s ease, box-shadow 0.2s ease;
  background: #fff;
}

.login-form input:focus {
  border-color: #2563eb;
  box-shadow: 0 0 0 4px rgba(37, 99, 235, 0.12);
}

.login-form button {
  margin-top: 10px;
  height: 54px;
  border: none;
  border-radius: 14px;
  background: linear-gradient(135deg, #2563eb, #1d4ed8);
  color: white;
  font-size: 15px;
  font-weight: 700;
  cursor: pointer;
  transition: transform 0.15s ease, opacity 0.2s ease;
}

.login-form button:hover {
  transform: translateY(-1px);
}

.login-form button:disabled {
  opacity: 0.7;
  cursor: not-allowed;
}

.login-message {
  margin-top: 8px;
  font-size: 14px;
  color: #2563eb;
}

@media (max-width: 900px) {
  .login-shell {
    grid-template-columns: 1fr;
  }

  .login-brand h1 {
    font-size: 36px;
  }

  .login-card {
    padding: 24px;
  }
}
'@ | Set-Content -Path "frontend\src\styles\login.css" -Encoding UTF8

Write-Host "=== frontend structure created successfully ===" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:"
Write-Host "1. cd frontend"
Write-Host "2. npm install"
Write-Host "3. npm run dev"