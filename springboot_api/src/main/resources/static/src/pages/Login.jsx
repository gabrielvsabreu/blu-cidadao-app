import { useState } from "react";
import { useNavigate } from "react-router-dom";
import { useAuth } from "../hooks/useAuth";

function Login() {
  const [email, setEmail] = useState("");
  const [senha, setSenha] = useState("");
  const [erro, setErro] = useState("");
  const navigate = useNavigate();
  const { login } = useAuth();

  function handleSubmit(e) {
    e.preventDefault();
    const sucesso = login(email, senha);
    if (sucesso) {
      navigate("/dashboard");
    } else {
      setErro("Email ou senha inválidos.");
    }
  }

  return (
    <div className="p-6 max-w-md mx-auto">
      <h2 className="text-2xl font-bold text-sky-950 mb-4">Login</h2>
      <form onSubmit={handleSubmit} className="space-y-4">
        <input
          type="email"
          placeholder="Email"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
          className="w-full border border-gray-300 rounded p-2"
        />
        <input
          type="password"
          placeholder="Senha"
          value={senha}
          onChange={(e) => setSenha(e.target.value)}
          className="w-full border border-gray-300 rounded p-2"
        />
        {erro && <p className="text-red-500 text-sm">{erro}</p>}
        <button type="submit" className="w-full bg-sky-950 text-white py-2 rounded">
          Entrar
        </button>
      </form>
    </div>
  );
}

export default Login;
