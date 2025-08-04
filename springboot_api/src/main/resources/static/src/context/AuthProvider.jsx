import { useState } from "react";
import AuthContext from "./AuthContext";

export function AuthProvider({ children }) {
  const [usuario, setUsuario] = useState({ name: "Teste" });

  function login(email, senha) {
    if (email && senha) {
      setUsuario({ email });
      return true;
    }
    return false;
  }

  function logout() {
    setUsuario(null);
  }

  return (
    <AuthContext.Provider value={{ usuario, login, logout }}>
      {children}
    </AuthContext.Provider>
  );
}
