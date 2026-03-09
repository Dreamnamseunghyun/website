import axios from "axios";

export async function login(payload) {
    const response = await axios.post("/api/login", payload, {
        headers: {
            "Content-Type": "application/json"
        }
    });

    return response.data;
}
